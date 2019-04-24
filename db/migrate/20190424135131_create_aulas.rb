class CreateAulas < ActiveRecord::Migration[5.2]
  def change
    create_table :aulas do |t|
      t.string :nomeAula
      t.string :categoria
      t.integer :quantidade

      t.timestamps
    end
  end
end
