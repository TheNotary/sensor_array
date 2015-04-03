class PageGenerator < Rails::Generators::Base
  def create_initializer_file
    page_name = args.first
    require 'pry'
    binding.pry
    
    route "get /pages/#{page_name}"
    # create the page view with header
    # Add the page to the navbar using clever regex
    nav_target_file = 'app/helpers/application_helper.rb'
    nav_target_signature = /(^  def lab_links\s^\s*links..*\{\s\s*"" => "",)/
    s = File.read nav_target_file
    nav_target_signature =~ s
    
    gsub_file nav_target_file, nav_target_signature, "#{$1}"
    
    
    # create_file "config/initializers/initializer.rb", "# Add initialization content here"
  end
end

