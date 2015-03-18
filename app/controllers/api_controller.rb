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
    
    # handle_lcd_in_thread(lcd_control_command)
    `#{lcd_control_command}`
    
    render text: "ok"
  end
  
  def have_sudo?
    system("sudo -n true 2>/dev/null;")
  end
  
  def handle_lcd_in_thread(lcd_control_command)
    Thread.new do
      if have_sudo?
        spawn lcd_control_command
        FayeUtility.log("Printed to LCD.")
      else
        FayeUtility.log("Error: Don't have sudo... You must not be running on the actual pi?")
      end
    end
  end
  
end
