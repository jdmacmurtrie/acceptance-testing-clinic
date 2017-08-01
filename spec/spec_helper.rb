require "pry"
require "rspec"
require "capybara"
require "capybara/rspec"
require "launchy"

require_relative "../server"

Capybara.app = Sinatra::Application

RSpec::Expectations.configuration.on_potential_false_positives = :nothing
