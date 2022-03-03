unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION']
    }

    config.fog_directory  = 'rails-photo-user'
    config.asset_host = 'https://s3-ap-northeast1.amazonaws.com/rails-photo-user'
    config.asset_host = 'https://rails-photo-user.s3.amazonaws.com'
    config.cache_storage = :fog
    config.fog_public = false
  end
end
