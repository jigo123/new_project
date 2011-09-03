require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)


module Tap
  class Application < Rails::Application

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false, :helpers => false 
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.template_engine :haml
    end
    
    config.autoload_paths += %W(#{config.root}/lib)

  end
end

