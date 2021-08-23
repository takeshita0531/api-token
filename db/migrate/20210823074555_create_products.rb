class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :age
      t.string :email

      t.timestamps
    end
  end
end
