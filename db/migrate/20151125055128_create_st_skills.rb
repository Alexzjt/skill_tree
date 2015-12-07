class CreateStSkills < ActiveRecord::Migration
  def change
    create_table :st_skills do |t|
      t.string :name
      t.integer :level
      t.integer :maxlevel
      t.text :description
      t.string :approach
      t.string :icon
      t.string :before
      t.string :after
      t.string :bonus

      t.timestamps null: false
    end
  end
end
