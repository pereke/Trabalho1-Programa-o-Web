class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.string :idAluno
      t.string :nome
      t.string :categoria
      t.string :curso

      t.timestamps
    end
  end
end
