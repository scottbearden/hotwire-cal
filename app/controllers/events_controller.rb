class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  def index
    @events = Current.user.events.all
  end

  def show
    # @event is already set by before_action
  end

  def new
    @event = Current.user.events.build
  end

  def create
    @event = Current.user.events.build(event_params)

    if @event.save
      redirect_to calendar_path(@event.calendar), notice: "Event created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @event is already set by before_action
  end

  def update
    if @event.update(event_params)
      redirect_to calendar_path(@event.calendar), notice: "Event updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy!
    redirect_back(fallback_location: events_url, notice: "Event was successfully destroyed.")
  end

  private

  def set_event
    @event = Current.user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:summary, :start_time, :end_time, :calendar_id)
  end
end
