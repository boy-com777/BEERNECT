# CarrierWave.configure do |config|
#   config.asset_host = ENV['API_URL']
# end
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil),
      region: 'ap-northeast-1'
    }
    config.fog_directory = 'beernect'
  end
end
