class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to posts_path
    end
  end
  
  def help
  end
  
  def about
  end
  
  def contact
    
  end
  
end
