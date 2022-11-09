require "./application"

# Initialize the `Application` to host the API.
app = Application.new

# For each CPU on the system run the `Application`, reuse the TCP port.
System.cpu_count.times do |_|
  Process.fork do
    app.run
  end
end

# Sleep indefinitely until the process terminates.
sleep()
