class PageGenerator < Rails::Generators::Base
  def create_initializer_file
    @page_name = args.first
    
    # Add the route
    route "get \"/pages/#{@page_name}\""
    
    # create the page view with header
    create_file "app/views/pages/#{@page_name}.html.haml", "%h1 #{@page_name}"
    
    # Add the page to the navbar using clever regex
    # BEGIN def add_page_to_navbar
    nav_target_file = 'app/helpers/application_helper.rb'
    nav_target_signature = /(^  def lab_links\s^\s*links..*\{\s\s*"" => "",)/
    s = File.read nav_target_file
    nav_target_signature =~ s
    
    gsub_file nav_target_file, nav_target_signature, "#{$1}\n      \"#{@page_name}\" => \"/pages/#{@page_name}\","
    # END def add_page_to_navbar
  end
  
end

