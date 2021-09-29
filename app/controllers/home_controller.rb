
class HomeController < ApplicationController
  #before_action :user_loged_in?
  def index
  end
  def user_loged_in?
    if session[:user].nil?
        flash[:notice]="You should login as an user to continue"
        redirect_to new_user_session_path
    end
  end
end