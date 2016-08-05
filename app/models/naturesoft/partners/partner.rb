module Naturesoft::Partners
  class Partner < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :width, presence: true
    validates :height, presence: true
    validates :logo, allow_blank: true, format: {
			with: %r{\.(gif|jpg|png)\Z}i,
			message: 'must be a URL for GIF, JPG or PNG image.'
		}
    mount_uploader :logo, Naturesoft::Partners::PartnerUploader
    
    def self.scale_type
      [
      ["FILL", "fill"],
      ["FIT", "fit"],]
    end
    def self.sort_by
      [
        ["Name","naturesoft_partners_partners.name"],
        ["Created At","naturesoft_partners_partners.created_at"]
      ]
    end
    def self.sort_orders
      [
        ["ASC","asc"],
        ["DESC","desc"]
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:key].present?
        params[:key].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_partners_partners.name,' ',naturesoft_partners_partners.description,' ',naturesoft_partners_partners.website)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_partners_partners.name"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "asc"
      records = records.order("#{sort_by} #{sort_orders}")
      
      return records
    end
  end
end
