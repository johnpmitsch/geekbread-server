class PingController < ApplicationController
  # GET /_ah/health
  # GET /ping
  def health_check
    render json: {"status": "WORKING!!"}
  end
end
