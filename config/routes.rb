ControlSwitch::Application.routes.draw do

  resources :door_events

  get "api/print_to_lcd", :to => "api#print_to_lcd"
  get "api/snap_photo", :to => "api#snap_photo"
  
  get "pages/motors"
  get "pages/wiringpi"
  get "/fail", :to => 'pages#fail'
  get "cmds/shutdown"
  get "cmds/restart"
  devise_for :users
  get "pages/rvm"
  get "pages/coop"
  get "pages/check_pin_state"
  get "pages/camera"
  get "pages/ir"
  get "pages/electronics_lab"
  get "pages/time_clock"
  get "pages/lcd"
  get "pages/home"
  root 'pages#home'
  
end
