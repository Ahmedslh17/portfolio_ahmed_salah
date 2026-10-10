class CreateVisits < ActiveRecord::Migration[8.1]
  def change
    create_table :visits do |t|
      t.string :page
      t.string :ip_address

      t.timestamps
    end
  end
end
