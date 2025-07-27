class Event < ApplicationRecord
  belongs_to :calendar, touch: true
  belongs_to :user, default: -> { Current.user }

  validates :summary, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return unless start_time.present? && end_time.present?

    errors.add(:end_time, "must be after the start time") if end_time <= start_time
  end
end
