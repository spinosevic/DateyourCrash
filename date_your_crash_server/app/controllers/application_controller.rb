class ApplicationController < ActionController::API

  def characteristic_params
    params.require(:characteristic).permit(:arched_eyebrows, :beard, :big_lips, :big_nose, :black_hair, :bushy_eyebrows, :chubby, :heavy_makeup, :high_cheekbones, :mustache, :narrow_eyes, :pale_skin, :pointy_nose, :receding_hairline, :straight_hair, :wavy_hair, :white, :asian, :hispanic, :indian)
  end
end
