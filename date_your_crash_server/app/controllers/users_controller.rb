class UsersController < ApplicationController


  def signup
    par=["beard", "mustache", "arched_eyebrows", "big_lips", "big_nose", "black_hair", "blond_hair", "bushy_eyebrows", "chubby", "pale_skin", "straight_hair", "wavy_hair", "heavy_makeup", "high_cheekbones", "narrow_eyes", "pointy_nose", "receding_hairline", "rosy_cheeks", "race", "white", "indian", "hispanic", "asian", "black"]
    @user=User.create(user_params)
    descr_params=params['data']
    descr_params.permit!
    @user.descriptions.create!(descr_params)
    @user.descriptions[0].attributes.select{|x,y|  (par.include?(x)?@user.parameters.push(y):0)}
    @user.save
    render json: @user.id
  end

  def login

    @user=User.all.find{|x| x.username==params['user']}
    if @user.authenticate==params['password']
      render json: {user:@user.id, matches:@user.matches}
    else
      render json: "Invalid Username/Password"
    end

  end

  def index

    gender = request.headers['gender']
    interest = request.headers['interest']
    id=request.headers['id'].to_i
    @matches=User.all.select{|x| x.id!=id}
    if interest=="both"
      @matches=@matches.select{|x| x.interest==gender||x.interest=="both"}
    else
      @matches=@matches.select{|x| x.gender==interest}.select{|y| y.interest==gender||y.interest=="both"}
    end
    render json: @matches
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {error: "Unable to create user"}, status: 400
    end
  end

  def match
    @user=User.all.find{|x| x.id==params['userId']}
    @matches=params['array'].map{|match| match['id']}
    @matches.each do |match_id|
      @match=User.find{|x| x.id==match_id}
      @user.matches.push(@match)
      @user.save
    end
render json: @user.matches

  end

  def message
    @user=User.all.find{|x| x.id==params['message']['sender_id']}
    message=params['message']
    message.permit!
    @message=Message.create(message)

    render json: @message
  end

  def messages
    userId = request.headers['UserId']
    @messages=Message.all.select{|x| x.sender_id==userId|| x.receiver_id==userId}
    render json: @messages
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :name, :gender, :interest, :url)
  end
  def characteristic_params
    params.require(:user).permit(:data)
  end
end
