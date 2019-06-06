class Projeto < ApplicationRecord
    has_and_belongs_to_many :alunos
    validates :nomeProjeto, presence: true
    validates :inicio, presence: true
    validates :termino, presence: true
end
