module Naturesoft
  module Partners
    module Admin
      class PartnersController < Naturesoft::Admin::AdminController
        before_action :set_partner, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Partners", naturesoft_partners.admin_partners_path
        end
    
        # GET /partners
        def index
          @partners = Partner.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /partners/1
        def show
          add_breadcrumb @partner.name, naturesoft_partners.new_admin_partner_path
          add_breadcrumb "Show"
        end
    
        # GET /partners/new
        def new
          @partner = Partner.new(width: 400, height: 400, scale_type: "fit")
          add_breadcrumb "New Partners", naturesoft_partners.new_admin_partner_path
        end
    
        # GET /partners/1/edit
        def edit
          add_breadcrumb @partner.name, naturesoft_partners.new_admin_partner_path
          add_breadcrumb "Edit"
        end
    
        # POST /partners
        def create
          @partner = Partner.new(partner_params)
          @partner.user = current_user
    
          if @partner.save
            redirect_to admin_partners_path, notice: 'Partner was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /partners/1
        def update
          if @partner.update(partner_params)
            redirect_to admin_partners_path, notice: 'Partner was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /partners/1
        def destroy
          @partner.destroy
          render text: 'Partner was successfully destroyed.'
        end
        
        # ENABLE /partners/stutus
        def enable
          @partner.enable
          render text: "Status was sucessfully enabled"
        end
        
        # DISABLE /partners/stutus
        def disable
          @partner.disable
          render text: "Status was sucessfully disabled"
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_partner
            @partner = Partner.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def partner_params
            params.fetch(:partner, {}).permit(:name, :logo, :description, :website, :height, :width, :scale_type)
          end
      end
    end
  end
end
