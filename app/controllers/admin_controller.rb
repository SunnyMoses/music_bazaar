class AdminController < ApplicationController
  def login
        if request.post?
          if params[:name]=="admin" && params[:password]=="nimda"
            session[:admin]="admin"
            
            redirect_to stores_path
            flash[:notice]="Welcome admin"
          else
            session[:admin]= nil
            flash[:notice]="Invalid credentials"
            redirect_to :action => :login
          end
        end
      end

  def logout
    session[:admin]=nil
    flash[:notice] = "You are logged out"
    redirect_to :action => :login
  end
end
