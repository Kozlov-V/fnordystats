$stdout.sync = true
require 'rubygems'
require 'bundler'
Bundler.require
require "fnordmetric"
p [:APP_ENV_PORT, ENV['PORT']]

FnordMetric.namespace :stats do

  # numeric (delta) gauge, 1-hour tick
  gauge :unicorns_seen_per_hour, 
    :tick => 1.hour.to_i, 
    :title => "Unicorns seenper Hour"

  # on every event like { _type: 'unicorn_seen' }
  event(:unicorn_seen) do
    # increment the unicorns_seen_per_hour gauge by 1
    incr :unicorns_seen_per_hour 
  end

  # draw a timeline showing the gauges value, auto-refresh every 2s
  widget 'Overview', {
    :title => "Unicorn-Sightings per Hour",
    :type => :timeline,
    :gauges => :unicorns_seen_per_hour,  
    :include_current => true,
    :autoupdate => 2
  }

end
