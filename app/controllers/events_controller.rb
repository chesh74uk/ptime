class EventsController < ApplicationController
  
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def new
    @test = Test.find(params[:test_id])
    @event = Event.new
  end
  
  def create
    @test = Test.find(params[:test_id])
    @event = Event.new(event_params)
    @test.events << @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to test_path(@test), notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to test_path(@test), notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to tests_path, notice: 'Event was successfully deleted.' }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @test = Test.find(params[:test_id])
      @event = Event.find(params[:id])
    end
  
   # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_name, :event_date, :event_outcome)
    end
    
end


