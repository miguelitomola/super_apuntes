class UserSessionsController < ApplicationController
  before_action :set_user_session, only: [:show, :create, :edit, :update, :destroy]

  # GET /user_sessions/new
  def new
    @user_session = UserSession.new
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(user_session_params)

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to root_path, notice: "Bienvenido #{@user_session.username}"  }
        format.json { render :show, status: :created, location: @user_session }
      else
        format.html { render :new }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: '¡Hasta pronto!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_session
      @user_session = UserSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_session_params
      params.require(:user_session).permit(:username, :password)
    end
end
