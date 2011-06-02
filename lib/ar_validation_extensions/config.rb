module ArValidationExtensions
  class Config
    require 'yaml'
    
    # TODO: Bake in support for multiple locales...
    DEFAULT_LOCALE = 'en'
    
    def self.values(locale = DEFAULT_LOCALE)
      @@config ||= nil
      
      # First, we want to see if the consumer of this gem has defined a config file
      return @@config[locale] unless @@config.nil?
      
      begin
        @@config = YAML.load_file(File.join(Rails.root, 'config', 'ar_validation_extensions.yml'))
      rescue
        # fall back to our smart defaults
        @@config = YAML.load_file(File.join(File.dirname(__FILE__), '../../config', 'ar_validation_extensions.yml'))
      end
      
      @@config[locale]
    end      
  end
end