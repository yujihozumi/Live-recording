unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAQH2KVTCKMWGXVZOE'],
      aws_secret_access_key: ENV['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'],
      region: ENV['ap-northeast-1']
    }

    config.fog_directory  = 'rails-photo-user'
    config.cache_storage = :fog
  end
end
