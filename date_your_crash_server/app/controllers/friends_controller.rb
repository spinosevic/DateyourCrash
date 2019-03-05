class FriendsController < ApplicationController

  def index
    @friends = Friend.all
    render json: @friends
  end

  def show
    @friend = Friend.find_by(id: params[:id])
    if @friend
      render json: @friend
    else
      render json: {error: "Friend not found"}, status: 404
    end
  end

end
