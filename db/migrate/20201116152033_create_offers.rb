class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :category
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.string :city
      t.string :delivery_type

      t.timestamps
    end
  end
end
