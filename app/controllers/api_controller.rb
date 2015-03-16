class ApiController < ActionController::Base
  
  def snap_photo
    resp = `raspistill -o public/tmp/snap.jpg`
    
    render text: "ok"
  end

  def print_to_lcd
    msg = params[:msg]
    turn_off = params[:off]
    turn_on = params[:on]
    
    # sudo -n makes it error out if you need a password
    lcd_control_command = "sudo -n python /home/pi/dev/python/Adafruit_Python_CharLCD/examples/lcd_cli.py"
    
    if turn_off
      lcd_control_command += " --off"
    else
      lcd_control_command += " #{msg}"
    end
    
    result = spawn lcd_control_command
    
    binding.pry

    render text: "ok"
  end
  
end
