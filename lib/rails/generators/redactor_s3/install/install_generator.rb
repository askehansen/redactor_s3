module RedactorS3
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Creates an initializer at config/initializers/radactor_s3.rb'

      def self.source_root
        @source_root ||= File.expand_path("../templates", __FILE__)
      end

      def create_initializer_file
        template 'initializer.rb', File.join('config', 'initializers', 'redactor_s3.rb')
      end
    end
  end
end