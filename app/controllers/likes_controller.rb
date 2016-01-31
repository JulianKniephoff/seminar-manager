class LikesController < ApplicationController
  # TODO Shouldn't this be handled using AJAX?
  # TODO Do we even need notices?

  load_resource :idea
  load_and_authorize_resource :like, through: :idea, shallow: true

  # GET /idea/1/likes
  def index
  end

  # POST /idea/1/likes
  def create
    @like.user = current_user
    saved = @like.save
    redirect_to @idea, notice: saved ?
                         'Ihre Stimme wurde erfolgreich gespeichert.'
                       :
                         # TODO Actually check the error ...
                         'Sie haben für dieses Thema schon abgestimmt.'
    # TODO Also the latter case should never happen ...
  end

  # DELETE /likes/1
  def destroy
    @idea = @like.idea  # TODO Why do we need to do this?!
    @like.destroy
    # TODO Redirect to where we came from
    redirect_to @idea, notice: 'Ihre Stimme wurde erfolgeich gelöscht.'
  end
end
