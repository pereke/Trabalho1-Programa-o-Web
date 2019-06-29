class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :nomeProfessor
      t.text :formacao
      t.string :password_digest
      t.string :sala
      t.string :email
      t.string :telefone

      t.timestamps
    end
  end
end
