class EncountersController < ApplicationController

  def index
    @encounters = Encounter.all
    render json: @encounters
  end

  def show
    @encounter = Encounter.find_by(id: params[:id])
    if @encounter
      render json: @encounter
    else
      render json: {error: "Encounter not found"}, status: 404
    end
  end

  def create
    @encounter = Encounter.new(encounter_params)
    if @encounter.save
      render json: @encounter
    else
      render json: {error: "Unable to create encounter"}, status: 400
    end
  end

  def destroy
    Encounter.find(params[:id]).destroy
  end

private
  def encounter_params
    params.require(:encounter).permit(:friend_id, :user_id, :duration, :time)
  end

end
