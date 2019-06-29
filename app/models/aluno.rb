class Aluno < ApplicationRecord
    has_and_belongs_to_many :projetos
    validates :nome, presence: true
    validates :categoria, presence: true
    validates :curso, presence: true
    validates :matricula, presence: true
end
