class IdeasController < ApplicationController
  load_and_authorize_resource

  # GET /ideas
  def index
  end

  # GET /ideas/1
  def show
  end

  # GET /ideas/new
  def new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  def create
    @idea.author = current_user
    if @idea.save
      redirect_to @idea, notice: 'Ihre Idee wurde erfolgreich erstellt.'
    else
      render :new
    end
  end

  # PATCH/PUT /ideas/1
  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Ihre Idee wurde erfolgreich aktualisiert.'
    else
      render :edit
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea.destroy
    redirect_to ideas_url, notice: 'Ihre Idee wurde erfolgreich gelöscht.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
