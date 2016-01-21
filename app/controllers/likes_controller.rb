class LikesController < ApplicationController
  load_resource :idea
  load_and_authorize_resource :like, through: :idea, shallow: true

  # GET /idea/1/likes
  def index
  end

  # POST /idea/1/likes
  def create
  end

  # DELETE /likes/1
  def destroy
  end
end
