class CreateAlunosProjetos < ActiveRecord::Migration[5.2]
  def change
    create_join_table :alunos, :projetos do |t|
      t.index :aluno_id
      t.index :projeto_id
    end
  end
end
