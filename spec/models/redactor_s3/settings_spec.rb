require 'spec_helper'

module RedactorS3
  describe Settings do
    it "Has a default bucket_url" do
      RedactorS3.bucket = 'mybucket'
      settings = Settings.new
      expect(settings.bucket_url).to eq('http://mybucket.s3.amazonaws.com')
    end

    it "Has a custom bucket_url" do
      RedactorS3.bucket = 'mybucket'
      RedactorS3.endpoint = 's3-eu-west-1.amazonaws.com'
      settings = Settings.new
      expect(settings.bucket_url).to eq('http://mybucket.s3-eu-west-1.amazonaws.com')
    end

    it "Has a default s3_host" do
      RedactorS3.bucket = 'mybucket'
      settings = Settings.new
      expect(settings.s3_host).to eq('mybucket.s3.amazonaws.com')
    end

    it "Has a custom s3_host" do
      RedactorS3.s3_host = 'static.example.com'
      settings = Settings.new
      expect(settings.s3_host).to eq('static.example.com')
    end
  end
end
