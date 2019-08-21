class Rack::Attack
  # Throttle POST requests to /shares by IP Address
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:shares/ip:#{req.ip}"
  throttle('shares/ip', limit: 6, period: 60.seconds) do |request|
    if request.path == '/shares' && request.post?
      request.ip
    end
  end
end
