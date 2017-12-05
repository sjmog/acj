if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['s3_access_key'],
      aws_secret_access_key: ENV['s3_secret_key'],
      region:                'eu-west-1',
      host:                  's3.amazonaws.com',
      endpoint:              'https://s3.amazonaws.com/makers-acj'
    }
    config.fog_directory  = 'pdfs'
    config.fog_public     = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
  end
end