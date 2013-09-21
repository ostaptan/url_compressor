class CreateAudits < ActiveRecord::Migration
  def up
    add_column :audits, :url_id, :integer 
    add_column :audits, :remote_ip, :string
  end
  
  def down
  end
end
