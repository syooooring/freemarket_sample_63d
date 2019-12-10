class CardsController < ApplicationController
  require 'payjp'
  before_action :set_card

  # 後ほど登録したクレジットの表示画面を作成します。
  def index
  end

  # クレジットカード情報入力画面
  def new
    if @card
      
      redirect_to card_path unless @card
    else
      # redirect_to root_path
    end
  end

  # 登録画面で入力した情報をDBに保存
  def create
    
    Payjp.api_key = "sk_test_046a73e1cffbb5b0a496029d"
    if params['payjp-token'].blank?
      render 'mypages/create_card'
    else
      customer = Payjp::Customer.create( # ここで先ほど生成したトークンを顧客情報と紐付け、PAY.JP管理サイトに送信
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id} # 記述しなくても大丈夫です
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to cards_path
      else
        render 'mypages/create_card'
      end
    end
  end

  # 後ほど削除機能を実装します。
  def destroy
  end

  require 'payjp'

  def confimation
    if @card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @items = Item.find(1)
     # 購入した際の情報を元に引っ張ってくる
      card = Card.find(1)
     # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
      Payjp.api_key = "sk_test_046a73e1cffbb5b0a496029d"
     # キーをセットする(環境変数においても良い)
      Payjp::Charge.create(
      amount: 800, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      # if @product.update(status: 1, buyer_id: current_user.id)
      #   flash[:notice] = '購入しました。'
      #   redirect_to controller: "products", action: 'show'
      # else
      #   flash[:alert] = '購入に失敗しました。'
      #   redirect_to controller: "products", action: 'show'
      # end
     #↑この辺はこちら側のテーブル設計どうりに色々しています
    end
  end

  def completed
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
