class PagesController < ApplicationController
  def home
    
    #admins_only!
    
  end
  
  def time_clock
    @about = RubyPiTc.About
  end
  
  def fail
  end
end
