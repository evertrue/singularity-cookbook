source 'https://rubygems.org'

group :test, :development do
  gem 'rake'
end

group :test do
  gem 'berkshelf',  '~> 3.2'
  gem 'rubocop', '~> 0.32'
  gem 'foodcritic', '~> 4.0'
  gem 'test-kitchen', '~> 1.4'
  gem 'kitchen-ec2', '~> 0.10'
end

group :test, :vagrant do
  gem 'kitchen-vagrant', '~> 0.15'
end
