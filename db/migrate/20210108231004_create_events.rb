class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :time
      t.text :description
      t.text :location

      t.timestamps
    end
  end
end
