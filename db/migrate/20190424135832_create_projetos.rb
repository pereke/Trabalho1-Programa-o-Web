class CreateProjetos < ActiveRecord::Migration[5.2]
  def change
    create_table :projetos do |t|
      t.string :nomeProjeto
      t.integer :inicio
      t.integer :termino
      t.text :resumo

      t.timestamps
    end
  end
end
