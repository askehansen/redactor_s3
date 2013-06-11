RedactorS3::Engine.routes.draw do
  get "success" => "files#success"
  get "files" => "files#index"
end
