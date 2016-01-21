class LikesController < ApplicationController
  # TODO Shouldn't this be handled using AJAX?
  # TODO Do we even need notices?

  # GET /idea/1/likes
  def index
  end

  # POST /idea/1/likes
  def create
    # TODO Do we actually need a notice here?
    # TODO Mixing computation and IO again ...
    authorize! :create, like
    notice = if like.save
               'Ihre Stimme wurde erfolgreich gespeichert.'
             else
               # TODO Actually check the error ...
               'Sie haben für dieses Thema schon abgestimmt.'
             end
    redirect_to idea, notice: notice
  end

  # DELETE /likes/1
  def destroy
    # TODO De we even want likes to be destroyable?
    authorize! :destroy, like
    idea = like.idea # TODO Ugly
    like.destroy
    # TODO Redirect to where we came from
    redirect_to idea, notice: 'Ihre Stimme wurde erfolgeich gelöscht.'
  end

  private

    # TODO DRY up the memoization?
    def idea
        @idea ||= Idea.find(params[:idea_id])
    end

    def likes
      @likes ||= idea.likes
    end

    def like
      @like ||= if params[:idea_id]
                  idea.like(current_user)
                else
                  Like.find(params[:id])
                end
    end
end
