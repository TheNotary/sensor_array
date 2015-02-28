class ApiController < ActionController::Base
  
  def snap_photo
    resp = `raspistill -o public/tmp/snap.jpg`
    
    render text: "ok"
  end
  
end