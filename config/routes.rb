ControlSwitch::Application.routes.draw do

  resources :door_events

  get "api/print_to_lcd", :to => "api#print_to_lcd"
  get "api/snap_photo", :to => "api#snap_photo"
  
  get "pages/screen"
  get "pages/motors"
  get "pages/wiringpi"
  get "/fail", :to => 'pages#fail'
  get "cmds/shutdown"
  get "cmds/restart"
  devise_for :users
  
  get "pages/accoustic"
  get "pages/integrity"
  get "pages/motion"
  get "pages/thermal"
  get "pages/configuration"
  get "pages/backups_and_images"
  
  get "pages/audio_playback"
  get "pages/audio_signal_sensing"
  get "pages/coop"
  get "pages/check_pin_state"
  get "pages/camera"
  get "pages/ir"
  get "pages/electronics_lab"
  get "pages/lcd"
  get "pages/home"
  get "pages/laser_dungeon"
  get "pages/logic_analyzer"
  get "/pages/avr"


  root 'pages#home'
  
end
