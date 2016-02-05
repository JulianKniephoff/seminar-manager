class CommentsController < ApplicationController
  # TODO The fact that this belongs to cancan is wrong
  load_resource :topic
  load_and_authorize_resource :comment, through: :topic, shallow: true

  # GET /topics/1/comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /topics/1/comments
  def create
    # TODO Can we do this nicer?
    # TODO Do we need this in `new` as well?
    @comment.author = current_user
    if @comment.save
      redirect_to @topic, notice: 'Ihr Kommentar wurde erfolgreich hinzugefügt.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Ihr Kommentar wurde erfolgreich aktualisiert.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @topic = @comment.topic
    @comment.destroy
    # TODO Redirect to where we came from
    redirect_to topic_path(@topic), notice: 'Ihr Kommentar wurde erfolgreich gelöscht.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author_id, :topic_id, :content)
    end
end
