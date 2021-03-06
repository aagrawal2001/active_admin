module ActiveAdmin
  module Generators
    class AssetsGenerator < Rails::Generators::Base

      def self.source_root
        @_active_admin_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def install_assets
        require 'rails'
        require 'active_admin'

        if ActiveAdmin.use_asset_pipeline?
          template '3.1/active_admin.js', 'app/assets/javascripts/active_admin.js'
          template '3.1/active_admin.css.scss', 'app/assets/stylesheets/active_admin.css.scss'
        else
          template '../../../../../app/assets/javascripts/active_admin/application.js', 'public/javascripts/active_admin.js'
          directory '../../../../../app/assets/images/active_admin', 'public/images/active_admin'
          generate "jquery:install --ui"
        end
      end

    end
  end
end
