module Naturesoft
  module Partners
    module Backend
      class OptionsController < Naturesoft::Backend::BackendController
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Partners", naturesoft_partners.backend_partners_path
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
