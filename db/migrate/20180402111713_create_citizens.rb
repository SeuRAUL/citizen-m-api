class CreateCitizens < ActiveRecord::Migration[5.2]
  def change
    create_table :citizens do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :lastLocation
      t.boolean :mutant, default: false

      t.timestamps
    end
  end
end
