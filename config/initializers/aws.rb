require 'aws-sdk'

AWS.config( {
  :logger            => Rails.logger,
  :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
} )

