class Pay < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :deadline_month
  belongs_to_active_hash :deadline_year
  belongs_to :user, optional: true
end
