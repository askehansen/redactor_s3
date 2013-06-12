RedactorS3.configure do |config|
  config.application_host = 'my.domain.com'
  config.bucket = 'mybucket'
  config.access_key = 'AWS_ACCESS_KEY_ID'
  config.secret_key = 'AWS_SECRET_ACCESS_KEY'
  
  ## Optinal
  # config.region = 'eu-west-1'
  # config.s3_host = 'mybucket.example.com'
  # config.prefix = 'files/'
end