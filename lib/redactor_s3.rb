require "redactor_s3/engine"

module RedactorS3
  mattr_accessor :application_host, :access_key, :secret_key, :bucket, :s3_host, :endpoint, :prefix
end
