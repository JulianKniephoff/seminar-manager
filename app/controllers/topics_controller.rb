class TopicsController < ApplicationController
  load_and_authorize_resource

  # GET /topics
  def index
  end

  # GET /topics/1
  def show
  end

  # GET /topics/new
  def new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  def create
    @topic.author = current_user
    if @topic.save
      redirect_to @topic, notice: 'Ihr Thema wurde erfolgreich erstellt.'
    else
      render :new
    end
  end

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Ihr Thema wurde erfolgreich aktualisiert.'
    else
      render :edit
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'Ihr Thema wurde erfolgreich gelöscht.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
