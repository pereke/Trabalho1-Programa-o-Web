class CreateAlunosProjetos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos_projetos, id: false do |t|
      t.belongs_to :aluno, index: true
      t.belongs_to :projeto, index: true
    end
  end
end
