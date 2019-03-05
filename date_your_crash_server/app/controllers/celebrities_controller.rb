class CelebritiesController < ApplicationController


  def seed
    @celebrity=Celebrity.create(gender: params["_json"][0], name: params["_json"][2], url: params["_json"][3])
    descr_params=params['_json'][1]
    descr_params.permit!
    @celebrity.descriptions.create!(descr_params)
  end

  def index
    @celebrities = Celebrity.all
    render json: @celebrities

  end

  def long
    @celebrities = Celebrity.all
    render json: { json: @celebrities.as_json( except: [:created_at, :updated_at, :id], include: { descriptions: { except: [:desc_id, :desc_type, :created_at, :updated_at, :id] } } )}
  end

  def show
    @celebrity = Celebrity.find_by(id: params[:id])
    if @celebrity
      render json: @celebrity
    else
      render json: {error: "Celebrity not found"}, status: 404
    end
  end

end
