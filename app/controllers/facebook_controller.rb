class FacebookController < ApplicationController

  def accept_token
    profile = Facebook.profile_for(params[:fb_token])

    u = User.exists?(fb_id: profile["id"])

    unless u
      u = User.create(
        name: profile["name"],
        email: profile["email"],
        fb_id: profile["id"],
      )
    end

    u.token = params[:fb_token]
    u.save

    render json: u
  end

end
