class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :categoria
      t.string :curso
      t.string :matricula
      t.timestamps
    end
  end
end
