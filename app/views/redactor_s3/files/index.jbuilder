json.array! @files do |file|
  json.thumb "#{@settings.bucket_url}/#{file.key}"
  json.image "#{@settings.bucket_url}/#{file.key}"
end