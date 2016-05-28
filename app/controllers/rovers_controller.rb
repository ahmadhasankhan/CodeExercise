class RoversController < ApplicationController
  before_action :set_rover, only: [:show, :edit, :update, :destroy]

  # GET /rovers
  # GET /rovers.json
  def index
    @rovers = Rover.all
  end

  # GET /rovers/1
  # GET /rovers/1.json
  def show
  end

  # GET /rovers/new
  def new
    @rover = Rover.new
  end

  # GET /rovers/1/edit
  def edit
  end

  # POST /rovers
  # POST /rovers.json
  def create
    @rover = Rover.new(rover_params)
    respond_to do |format|
      if @rover.save
        format.html { redirect_to @rover, notice: 'Rover was successfully created.' }
        format.json { render :show, status: :created, location: @rover }
      else
        format.html { render :new }
        format.json { render json: @rover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rovers/1
  # PATCH/PUT /rovers/1.json
  def update
    respond_to do |format|
      # Pass the commands and update the Rover positions
      updated_params = @rover.get_positions(params[:commands])
      if updated_params && @rover.update(updated_params)
        format.html { redirect_to @rover, notice: 'Rover was successfully updated.' }
        format.json { render :show, status: :ok, location: @rover }
      else
        format.html { render :edit }
        format.json { render json: @rover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rovers/1
  # DELETE /rovers/1.json
  def destroy
    @rover.destroy
    respond_to do |format|
      format.html { redirect_to rovers_url, notice: 'Rover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rover
    @rover = Rover.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rover_params
    params.require(:rover).permit(:position_x, :position_y, :direction, :commands)
  end
end
