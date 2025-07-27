class EventsController < ApplicationController
  def index
    @events = Current.user.events.all
  end
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to calendar_path(@event.calendar), notice: "Event created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:summary, :start_time, :end_time, :calendar_id)
  end
end
