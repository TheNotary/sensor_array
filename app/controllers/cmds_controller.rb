class CmdsController < ApplicationController
  def shutdown
		`sudo shutdown -h now`
		render :text => "true"
  end

  def restart
  end
end
