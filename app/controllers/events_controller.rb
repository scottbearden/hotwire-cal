class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  def index
    @events = Current.user.events.includes(:calendar).confirmed.order(:start_time)
  end

  def show
    # @event is already set by before_action
  end

  def new
    @event = Current.user.events.build
    @calendars = Current.user.calendars.all

    # Set default values
    @event.start_time = params[:start_time]&.to_datetime || 1.hour.from_now.beginning_of_hour
    @event.end_time = @event.start_time + 1.hour
    @event.timezone = Time.zone.name
  end

  def create
    @event = Current.user.events.build(event_params)
    @calendars = Current.user.calendars.all

    if @event.save
      redirect_to @event, notice: "Event created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @calendars = Current.user.calendars.all
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event updated successfully."
    else
      @calendars = Current.user.calendars.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    calendar = @event.calendar
    @event.destroy!
    redirect_to calendar_path(calendar), notice: "Event deleted successfully."
  end

  private

  def set_event
    @event = Current.user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :summary, :description, :location,
      :start_time, :end_time, :all_day,
      :status, :visibility, :color_id,
      :recurrence_rule, :timezone,
      :calendar_id,
      attendees: [],
      reminders: []
    )
  end
end
