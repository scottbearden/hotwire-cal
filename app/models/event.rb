class Event < ApplicationRecord
  belongs_to :user
  belongs_to :calendar

  # Validations
  validates :summary, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, inclusion: { in: %w[confirmed tentative cancelled] }
  validates :visibility, inclusion: { in: %w[default public private confidential] }

  # Ensure end_time is after start_time (unless all_day)
  validate :end_time_after_start_time, unless: :all_day?

  # Scopes
  scope :confirmed, -> { where(status: "confirmed") }
  scope :upcoming, -> { where("start_time > ?", Time.current) }
  scope :today, -> { where(start_time: Date.current.beginning_of_day..Date.current.end_of_day) }
  scope :this_week, -> { where(start_time: Date.current.beginning_of_week..Date.current.end_of_week) }

  # Methods
  def all_day?
    all_day
  end

  def duration
    return 0 if all_day?
    ((end_time - start_time) / 1.hour).round(2)
  end

  def formatted_time_range
    if all_day?
      start_time.strftime("%B %d, %Y")
    elsif start_time.to_date == end_time.to_date
      "#{start_time.strftime('%B %d, %Y')} • #{start_time.strftime('%l:%M %p')} - #{end_time.strftime('%l:%M %p')}"
    else
      "#{start_time.strftime('%B %d, %Y %l:%M %p')} - #{end_time.strftime('%B %d, %Y %l:%M %p')}"
    end
  end

  def attendee_emails
    return [] unless attendees.present?
    attendees.map { |a| a["email"] }.compact
  end

  def add_attendee(email, name = nil, response_status = "needsAction")
    self.attendees ||= []
    attendees << {
      "email" => email,
      "displayName" => name || email.split("@").first,
      "responseStatus" => response_status
    }
  end

  def set_reminder(method = "email", minutes_before = 10)
    self.reminders ||= []
    reminders << {
      "method" => method,
      "minutes" => minutes_before
    }
  end

  private

  def end_time_after_start_time
    return unless start_time && end_time
    errors.add(:end_time, "must be after start time") if end_time <= start_time
  end
end
