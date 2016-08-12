module Naturesoft
  module Partners
    module Admin
      class OptionsController < Naturesoft::Admin::AdminController
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Partners", naturesoft_partners.admin_partners_path
        end
    
        # GET /partners
        def index
          add_breadcrumb "Settings", nil
          
          @options = Naturesoft::Option.options("partners")
        end
      end
    end
  end
end
