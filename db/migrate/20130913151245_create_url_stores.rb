class CreateUrlStores < ActiveRecord::Migration
  def change
    create_table :url_stores do |t|
      t.string :generic_url
      t.string :alias, null: false

      t.timestamps
    end
  end
end
