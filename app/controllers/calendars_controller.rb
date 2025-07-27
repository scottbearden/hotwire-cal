class CalendarsController < ApplicationController
  before_action :set_calendar, only: %i[show edit update destroy]

  def index
    @calendars = Current.user.calendars.all
  end

  def show
    # @calendar is already set by before_action
  end

  def new
    @calendar = Current.user.calendars.build
  end

  def create
    @calendar = Current.user.calendars.build(calendar_params)

    if @calendar.save
      redirect_to @calendar, notice: "Calendar created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @calendar is already set by before_action
  end

  def update
    if @calendar.update(calendar_params)
      redirect_to @calendar, notice: "Calendar updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @calendar.destroy!
    redirect_to calendars_path, notice: "Calendar deleted."
  end

  private

  def set_calendar
    @calendar = Current.user.calendars.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:name, :color)
  end
end
