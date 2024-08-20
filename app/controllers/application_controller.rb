class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def destroy
    session.destroy
    redirect_to root_path, notice: 'Signed out successfully!'
  end
end