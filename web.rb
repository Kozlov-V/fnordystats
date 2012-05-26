require "./app.rb"
p [:WEB_PORT, ENV['PORT']]

FnordMetric.server_configuration = {
  :redis_url => ENV['REDISTOGO_URL'] || "redis://localhost:6379",
  :inbound_stream => false,
  :start_worker => true,
  :web_interface => ["0.0.0.0", ENV["PORT"]||"4242"]
}

FnordMetric.standalone
