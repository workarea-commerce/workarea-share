module Workarea
  module Share
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::Share

      config.to_prepare do
        Workarea::Storefront::ApplicationController.send(
          :helper,
          Workarea::Storefront::SharesHelper
        )
      end
    end
  end
end
