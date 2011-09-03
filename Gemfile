source 'http://rubygems.org'

gem 'rails', '3.0.3'

# gem 'sqlite3-ruby', :require => 'sqlite3'
# postgres db gem
gem 'pg'

## Developer added gems

# Devise Gem for authentication
gem 'devise', '1.1.3'

# Heroku for deployment
gem 'heroku'

# Haml for more concise view markup
gem 'haml'
gem 'haml-rails'

# Hpricot HTML parser - Haml required it
gem 'hpricot'

# Paperclip for file uploads
gem 'paperclip', '~> 2.3'
# And the Amazon S3 gem for accessing Amazon
gem 'aws-s3'

# Geokit gem for geocoding addresses
gem 'geokit'

# Geokit rails3 for doing distance based queries
gem 'geokit-rails3'

# Fastercsv for importing csv data
gem 'fastercsv'

#Testing gems - only for test and development environments
group :test, :development do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
	gem 'shoulda'
	gem 'cucumber-rails'
	gem 'faker'
end

group :test do
	gem 'rspec_tag_matchers'
	gem 'autotest'
	gem 'database_cleaner'
	gem 'launchy'
	gem 'pickle'
	gem 'capybara'
	gem 'webrat'
end

# At some point I needed ruby_parser, but believe unnecessary. Commenting out now. Will remove later
# gem 'ruby_parser'

