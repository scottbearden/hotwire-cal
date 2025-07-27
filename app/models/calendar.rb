class Calendar < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  has_many :events, dependent: :destroy

  validates :color, presence: true
  validates :name, presence: true
end
