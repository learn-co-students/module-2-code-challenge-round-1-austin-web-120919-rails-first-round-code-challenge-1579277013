class CreateHeroinePowers < ActiveRecord::Migration[5.1]
  def change
    create_table :heroine_powers do |t|
      t.references :heroine, index: true, foreign_key: true
      t.references :power, index: true, foreign_key: true

      t.timestamps
    end
  end
end
