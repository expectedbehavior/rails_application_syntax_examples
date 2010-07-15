# Templates to check out
# Expected Behavior :: http://github.com/expectedbehavior/rails_templates
# Fastest Forward   :: http://github.com/fastestforward/rails_template
# Mike Gunderloy's  :: http://github.com/ffmike/BigOldRailsTemplate
# Jeremy McNally's  :: http://github.com/jm/rails-templates

TEMPLATE_ROOT = File.dirname(template)
log "template dir", TEMPLATE_ROOT

# Refactoring is good.
load_template "#{TEMPLATE_ROOT}/template_helpers.rb"
announce("I just loaded the template helpers.")

# Execute a random command
run "echo 'Reading Rainbow!' > README"

# Run a rake command. 
rake "stats"

# Print
log "your face", "is dumb"

# Installs plugins. 
plugin 'authlogic', :git => 'git://github.com/binarylogic/authlogic.git'
generate(:session, "user_sessions")
generate(:controller, "user_sessions")

# Good for making changes to existing files
gsub_file 'app/controllers/application_controller.rb', /#\s*(filter_parameter_logging :password)/, '\1'

# Can also do it with blocks to do fancier things
gsub_file "config/database.yml", /password:/ do |match|
  require 'pwfoo' # comment me out to get a dumb error message
  pwd = PwFoo::GeneratePassword.new(16).generate_with_min_strength 80
  "password: #{pwd}"
end


# More refactoring ugly stuff into other files. Please don't load_template using a Git address. 
# It makes developing your template super difficult.
load_template "#{TEMPLATE_ROOT}/gitignore.rb"
# load_template "http://github.com/expectedbehavior/indyrb_template_demo/raw/master/gitignore.rb"

# Executes all the other commands in a different directory.
inside "vendor" do 
  file "foo.rb", "LOLTEST"
end

if yes?("make a git repo and commit?")
  # Commit quietly
  git :init
  git :add => '.'
  git :commit => "-q -m 'initial commit'"  
end

