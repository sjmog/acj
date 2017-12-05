class CoachesController
  before_action :authenticate_coach!

  def show
    @coach = current_user
  end
end