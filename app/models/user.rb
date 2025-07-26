class User < ApplicationRecord
  has_secure_password
  normalizes :email, with: ->(email) { email.strip.downcase }
  validates :handle, presence: true, uniqueness: true,
    format: { with: /\A[a-z0-9_]+\z/ }
  validates :email, presence: true, uniqueness: true
  PASSWORD_MIN_LENGTH = 8
  PASSWORD_MAX_LENGTH = 84
  validates_length_of :password, allow_blank: true, minimum: PASSWORD_MIN_LENGTH, maximum: PASSWORD_MAX_LENGTH, on: [ :create, :update ]
  validates_confirmation_of :password, allow_blank: true, on: :update
end
