class CommentsController < ApplicationController
  # TODO The fact that this belongs to cancan is wrong
  load_resource :idea
  load_resource :comment, through: :idea, shallow: true

  # GET /idea/1/comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /idea/1/comments
  def create
    if @comment.save
      redirect_to @idea, notice: 'Ihr Kommentar wurde erfolgreich hinzugefügt.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Ihr Kommentar wurde erfolgreich aktualisiert.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Ihr Kommentar wurde erfolgreich gelöscht.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author_id, :idea_id, :content)
    end
end
