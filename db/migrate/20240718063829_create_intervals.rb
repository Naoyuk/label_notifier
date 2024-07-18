class CreateIntervals < ActiveRecord::Migration[7.1]
  def change
    create_table :intervals do |t|
      t.integer :day
      t.integer :copies_per_day

      t.timestamps
    end
  end
end
