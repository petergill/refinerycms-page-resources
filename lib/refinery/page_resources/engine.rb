module Refinery
  module PageResources
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery

      engine_name :refinery_page_resources

      def self.register(tab)
        tab.name = "resources"
        tab.partial = "/refinery/admin/pages/tabs/resources"
      end

      initializer "register refinery_page_resources plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "page_resources"
          plugin.hide_from_menu = true
        end
      end

      config.to_prepare do
        require 'refinerycms-pages'
        Refinery::Page.send :has_many_page_resources
        Refinery::Blog::Post.send :has_many_page_resources if defined?(::Refinery::Blog)
        Refinery::Resource.module_eval do
          has_many :resource_pages, :dependent => :destroy
        end
      end

      config.after_initialize do
        Refinery::Pages::Tab.register do |tab|
          register tab
        end

        if defined?(Refinery::Blog::Tab)
          Refinery::Blog::Tab.register do |tab|
            register tab
          end
        end

        Refinery.register_engine(Refinery::PageResources)
      end
    end
  end
end