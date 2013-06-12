module RedactorS3
  class Config
    attr_accessor :application_host, :bucket, :access_key, :secret_key, :region, :prefix, :s3_alias

    def initialize
      self.prefix = 'files/'
    end

    def success_url
      "http://#{application_host}/s3/success"
    end

    def bucket_url
      "http://#{self.bucket}.#{self.endpoint}"
    end

    def s3_host_url
      self.s3_alias ? "http://#{self.s3_alias}" : self.bucket_url
    end

    def endpoint
      s3_prefix = 's3'
      s3_prefix << "-#{self.region}" if region
      "#{s3_prefix}.amazonaws.com"
    end

    def policy
      policy_json="{'expiration': '2020-01-01T00:00:00Z',
        'conditions': [ 
          {'bucket': '#{self.bucket}'}, 
          ['starts-with', '$key', ''],
          {'acl': 'public-read'},
          {'success_action_redirect': '#{self.success_url}'},
          ['starts-with', '$Content-Type', ''],
          ['content-length-range', 0, 1048576]
        ]
      }"

      Base64.encode64(policy_json).gsub("\n","")
    end

    def signature
      Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), self.secret_key, policy)).gsub("\n","")
    end
  end
end
