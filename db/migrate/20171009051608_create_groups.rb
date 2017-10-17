class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name,               null: false, unique:true
      t.string :member_id,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
