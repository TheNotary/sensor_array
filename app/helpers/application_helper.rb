module ApplicationHelper
  def sensor_links
    links = { 
              "Integrity (doors & windows)" => "/pages/integrity",
              "Motion" => "/pages/motion",
              "Thermal" => "/pages/thermal",
              "Accoustic" => "/pages/accoustic",
              "Photonic (camera)" => "/pages/photonic"
            }
  end
  
  def ether_links
    links = {
              "Packet Sniffer" => "/pages/packet_sniffer",
              "Network Host Scan" => "/pages/nbtscan",
              "Wake on Lan" => "/pages/wol"
    }
  end
  
  def config_links
    links = { 
              "The Pi Bootcamp" => "/pages/the_pi_bootcamp",
              "Configure RPi" => "/pages/configuration",
              "wireless" => "/pages/wireless",
              "Backups & .img files" => "/pages/backups_and_images",
            }
  end
  
  def control_links
    links = {
      "LCD Control" => "/pages/lcd",
    }
  end
  
  def equipment_links
    links = {"Electronics Lab Essentials & Suggestions" => "/pages/electronics_lab"}
  end
  
  def lab_links
    links = {
      "" => "",
      "3d_scanner" => "/pages/3d_scanner",
      "fine_positioning" => "/pages/fine_positioning",
      "Micro Positioner" => "/pages/micro_positioner",
      "environmental" => "/pages/environmental",
      "Camera and Vid Streaming" => "/pages/camera",
      "Check Pin States" => "/pages/check_pin_state",
      "Infra-Red Signal Detection" => "/pages/ir",
      "Chicken Coop Door" => "/pages/coop",
      "Motors" => "/pages/motors",
      "Screen" => "/pages/screen",
      "Audio Playback" => "/pages/audio_playback",
      "Audio Signal Sensing" => "/pages/audio_signal_sensing",
      "Logic Analyzer" => "/pages/logic_analyzer",
      "Avr ethernet Satalites" => "/pages/avr",
      "Hovering Robot" => "/pages/hover",
      "Data Transmission/ Receiption" => "/pages/data_io",
    }.reject!{ |k, v| k == "" and v == "" }
  end
  
  def activitie_links
    links = {
      "Semi-Virtual Laser Dungeon" => "/pages/laser_dungeon",
      "Variable Madlibs Buckets" => "/pages/variable_madlibs_buckets",
      "learn_programming_by_flight" => "/pages/learn_programming_by_flight",
      }
  end

  def external_links
    links = {
      "" => "",
      "A beautiful lab of sharing" => "http://publiclab.org/tools",
    }.reject!{ |k, v| k == "" and v == "" }
  end
  
  def mark_active?(k,v)
    mark_active_conditions(k,v) ? "active" : ""
  end
  
  def mark_active_conditions(k,v)
    return true if "/#{params[:controller]}/#{params[:action]}" == v
    return true if "/#{params[:controller]}" == v and params[:action] == "index"
    return false
  end
  
  def hostname
    if ENV['HEROKU_DEPLOYMENT'].nil?
      return `hostname`.strip
    else
      return "heroku"
    end
  end
end
