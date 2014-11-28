class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.text :copy
      t.string :dest

      t.timestamps
    end
  end
end
