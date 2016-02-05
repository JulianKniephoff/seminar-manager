class LikesController < ApplicationController
  # TODO Shouldn't this be handled using AJAX?
  # TODO Do we even need notices?

  load_resource :topic
  load_and_authorize_resource :like, through: :topic, shallow: true

  # GET /topics/1/likes
  def index
  end

  # POST /topics/1/likes
  def create
    @like.user = current_user
    saved = @like.save
    redirect_to @topic, notice: saved ?
                         'Ihre Stimme wurde erfolgreich gespeichert.'
                       :
                         # TODO Actually check the error ...
                         'Sie haben für dieses Thema schon abgestimmt.'
    # TODO Also the latter case should never happen ...
  end

  # DELETE /likes/1
  def destroy
    @topic = @like.topic  # TODO Why do we need to do this?!
    @like.destroy
    # TODO Redirect to where we came from
    redirect_to @topic, notice: 'Ihre Stimme wurde erfolgeich gelöscht.'
  end
end
