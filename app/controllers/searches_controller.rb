class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @renge = params[:renge]
    
    if @renge == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
  
end
