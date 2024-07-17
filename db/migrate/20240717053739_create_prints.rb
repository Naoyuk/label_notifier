class CreatePrints < ActiveRecord::Migration[7.1]
  def change
    create_table :prints do |t|
      t.date :print_on
      t.integer :copies
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
