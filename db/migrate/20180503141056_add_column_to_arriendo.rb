class AddColumnToArriendo < ActiveRecord::Migration
  def change
  	add_column :arriendos, :deleted_at, :datetime, null: true
  end
end
