module Vaultify
  class Engine < ::Rails::Engine
    isolate_namespace Vaultify
    class << self

      def config
        file = File.open(File.join(::Rails.root, "/config/vaultify.yml"))
        @config ||= YAML.safe_load(file)
      end

      # loads a yml file with the configuration options
      #
      # @param file [String] path to the yml file
      #
      def load_config(file)
        @config = YAML.load_file(file)
      end
    end
  end
end
