class SessionsController < ApplicationController
  def create
    render json: env["omniauth.auth"].to_json
  end
end
