class ScenariosController < ApplicationController
  before_action :set_scenario, only: [:show, :edit, :update, :destroy]
  
  def index
    @scenarios = Scenario.all.order(:scenario_name)
  end

  def new
    @scenario = Scenario.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @scenario.update(scenario_params)
        format.html { redirect_to scenarios_path, notice: 'Scenario was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @scenario = Scenario.new(scenario_params)

    respond_to do |format|
      if @scenario.save
        format.html { redirect_to scenarios_path, notice: 'Scenario was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @scenario.destroy
    respond_to do |format|
      format.html { redirect_to scenarios_path, notice: 'Scenario was successfully deleted.' }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario = Scenario.find(params[:id])
    end
  
   # Never trust parameters from the scary internet, only allow the white list through.
    def scenario_params
      params.require(:scenario).permit(:scenario_name, :scenario_description)
    end
  
end
