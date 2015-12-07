class CreateStProfessions < ActiveRecord::Migration
  def change
    create_table :st_professions do |t|
      t.string :name
      t.text :description
      t.string :user_name
      t.integer :level
      t.string :status

      t.timestamps null: false
    end
  end
end
