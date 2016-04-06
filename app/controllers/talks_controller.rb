class TalksController < ApplicationController
  load_and_authorize_resource

  # GET /talks
  # GET /talks.json
  def index
    @talks = Talk.all
  end

  # GET /talks/1
  # GET /talks/1.json
  def show
  end

  # GET /talks/new
  def new
    @talk = Talk.new
  end

  # GET /talks/1/edit
  def edit
  end

  # PATCH/PUT /talks/1
  # PATCH/PUT /talks/1.json
  def update
    if @talk.update(talk_params)
      redirect_to @talk, notice: 'Der Vortrag wurde erfolgreich aktualisiert.'
    else
      render :edit
    end
  end

  # TODO Should these be their own resources?

  # GET /talks/archived
  def archived
    @talks = @talks.before_semester(current_semester).order(date: :asc)
  end

  # GET /talks/current
  def current
    @talks = @talks.by_semester(current_semester).order(date: :asc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talk
      @talk = Talk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talk_params
      filters = [:title, :description]
      filters << :date if current_user.admin?
      params.require(:talk).permit(*filters)
    end
end
