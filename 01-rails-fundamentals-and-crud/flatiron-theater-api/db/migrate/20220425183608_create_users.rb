class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin
      
      # created_at, updated_at
      t.timestamps
    end
  end
end
