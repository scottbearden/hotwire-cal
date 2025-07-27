class User < ApplicationRecord
  # Authentication
  has_secure_password

  # Normalizations
  normalizes :email, with: ->(email) { email.strip.downcase }

  # Constants
  PASSWORD_MIN_LENGTH = 8
  PASSWORD_MAX_LENGTH = 84

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true,
    format: { with: /\A[a-z0-9_]+\z/ }
  validates :password,
    length: { minimum: PASSWORD_MIN_LENGTH, maximum: PASSWORD_MAX_LENGTH },
    allow_blank: true,
    on: [ :create, :update ]
  validates :password_confirmation,
    confirmation: true,
    allow_blank: true,
    on: :update

  # Associations
  has_many :calendars, dependent: :destroy
  has_many :events, dependent: :destroy
end
