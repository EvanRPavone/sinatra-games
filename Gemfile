# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'sinatra'
gem 'activerecord', '<=5.1', :require => 'active_record'
gem 'sinatra-activerecord'
gem 'rake'
gem 'bcrypt'
gem 'dotenv'
gem 'require_all'
gem 'rack_session_access'
gem 'corneal'
gem 'foreman'

group :development do
  gem 'sqlite3', '~>1.3.6'
  gem 'tux'
  gem 'shotgun'
  gem 'pry'
end

group :production do
  gem 'pg', '~> 0.20'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
end