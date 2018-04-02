class CreateMutationFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :mutation_flags do |t|
      t.integer :flag
      t.string :mutation
      
      t.references :citizen, foreign_key: true

      t.timestamps
    end
  end
end
