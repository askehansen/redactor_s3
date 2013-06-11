module RedactorS3
  class Engine < ::Rails::Engine
    isolate_namespace RedactorS3
     config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end
