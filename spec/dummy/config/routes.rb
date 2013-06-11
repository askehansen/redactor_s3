Rails.application.routes.draw do

  mount RedactorS3::Engine => "/redactor_s3"
end
