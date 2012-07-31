require 'refinerycms-core'

module Refinery
  autoload :PageResourcesGenerator, 'generators/refinery/page_resources_generator'

  module PageResources

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end

    require 'refinery/page_resources/configuration'
    require 'refinery/page_resources/engine'
    require 'refinery/page_resources/extension'
  end
end
