require_dependency "redactor_s3/application_controller"
require_dependency "aws-sdk"
require_dependency "jbuilder"

module RedactorS3
  class FilesController < ApplicationController
    def success
      settings = Settings.new
      render json: { filelink: "http://#{settings.s3_host}/#{params[:key]}" }
    end
    
    def index
      @settings = Settings.new
      s3 = AWS::S3.new access_key_id: @settings.access_key, secret_access_key: @settings.secret_key, s3_endpoint: @settings.endpoint
      bucket = s3.buckets[@settings.bucket]
      @files = bucket.objects.with_prefix(@settings.prefix)
    end
  end
end
