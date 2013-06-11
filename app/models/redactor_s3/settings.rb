module RedactorS3
  class Settings
    attr_accessor :application_host, :bucket, :access_key, :secret_key, :endpoint, :s3_host, :prefix

    def initialize
      @application_host = RedactorS3.application_host
      @bucket = RedactorS3.bucket
      @access_key = RedactorS3.access_key
      @secret_key = RedactorS3.secret_key

      @endpoint = RedactorS3.endpoint || 's3.amazonaws.com'
      @s3_host = RedactorS3.s3_host || "#{@bucket}.#{@endpoint}"
      @prefix = RedactorS3.prefix || 'files/'
    end

    def bucket_url
      "http://#{@bucket}.#{@endpoint}"
    end

    def success_url
      "http://#{@application_host}/s3/success"
    end

    def policy
      policy_json="{'expiration': '2020-01-01T00:00:00Z',
        'conditions': [ 
          {'bucket': '#{@bucket}'}, 
          ['starts-with', '$key', ''],
          {'acl': 'public-read'},
          {'success_action_redirect': '#{success_url}'},
          ['starts-with', '$Content-Type', ''],
          ['content-length-range', 0, 1048576]
        ]
      }"

      Base64.encode64(policy_json).gsub("\n","")
    end

    def signature
      Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), @secret_key, policy)).gsub("\n","")
    end
  end
end