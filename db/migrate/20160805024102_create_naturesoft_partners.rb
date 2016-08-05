class CreateNaturesoftPartners < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_partners_partners do |t|
      t.string :name
      t.string :logo
      t.text :description
      t.string :website
      t.integer :height
      t.integer :width
      t.string :scale_type
      t.references :user, references: :naturesoft_users, index: true

      t.timestamps
    end
  end
end
