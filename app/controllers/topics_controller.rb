class TopicsController < ApplicationController
  load_and_authorize_resource

  # GET /topics
  def index
    @topics = @topics.order(sort_column => sort_direction)
  end

  # GET /topics/1
  def show
    @comment = Comment.new
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

    # TODO Abstract this out?
    def sort_column
      # TODO Naming ...
      Topic.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
    end

    def sort_direction
      # TODO Abstract out this pattern?
      %w(asc desc).include?(params[:direction]) ? params[:direction] : 'desc'
    end

    helper_method :sort_column, :sort_direction
end
