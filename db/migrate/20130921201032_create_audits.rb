class CreateAudits < ActiveRecord::Migration
  def up
    create_table :audits do |t|
      t.integer :url_id
      t.string :remote_ip
    
      t.timestamps
    end
  end
  
  def down
    drop_table :audits
  end
end
