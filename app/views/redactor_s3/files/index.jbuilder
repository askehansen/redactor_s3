json.array! @files do |file|
  json.thumb "#{RedactorS3.config.s3_host_url}/#{file.key}"
  json.image "#{RedactorS3.config.s3_host_url}/#{file.key}"
end