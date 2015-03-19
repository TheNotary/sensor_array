class DoorEventsController < ApplicationController
  before_action :set_door_event, only: [:show, :edit, :update, :destroy]

  # GET /door_events
  # GET /door_events.json
  def index
    @door_events = DoorEvent.all
  end

  # GET /door_events/1
  # GET /door_events/1.json
  def show
  end

  # GET /door_events/new
  def new
    @door_event = DoorEvent.new
  end

  # GET /door_events/1/edit
  def edit
  end

  # POST /door_events
  # POST /door_events.json
  def create
    @door_event = DoorEvent.new(door_event_params)

    respond_to do |format|
      if @door_event.save
        format.html { redirect_to @door_event, notice: 'Door event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @door_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @door_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /door_events/1
  # PATCH/PUT /door_events/1.json
  def update
    respond_to do |format|
      if @door_event.update(door_event_params)
        format.html { redirect_to @door_event, notice: 'Door event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @door_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /door_events/1
  # DELETE /door_events/1.json
  def destroy
    @door_event.destroy
    respond_to do |format|
      format.html { redirect_to door_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_door_event
      @door_event = DoorEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def door_event_params
      params.require(:door_event).permit(:event_type, :sensor_name)
    end
end
