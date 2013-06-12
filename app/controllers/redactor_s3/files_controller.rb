require_dependency "redactor_s3/application_controller"
require_dependency "aws-sdk"
require_dependency "jbuilder"

module RedactorS3
  class FilesController < ApplicationController
    def success
      render json: { filelink: "#{RedactorS3.config.s3_host_url}/#{params[:key]}" }
    end
    
    def index
      s3 = AWS::S3.new access_key_id: RedactorS3.config.access_key, secret_access_key: RedactorS3.config.secret_key, s3_endpoint: RedactorS3.config.endpoint
      bucket = s3.buckets[RedactorS3.config.bucket]
      @files = bucket.objects.with_prefix(RedactorS3.config.prefix)
    end
  end
end
