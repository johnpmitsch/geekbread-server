class PingController < ApplicationController
  # GET /_ah/health
  # GET /ping
  def health_check
    render json: {"status": "WORKING!!"}
  end

  def root
    render json: {"HELLO": "WELCOME TO GEEKBREAD"}
  end
end
