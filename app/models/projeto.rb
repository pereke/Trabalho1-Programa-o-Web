class Projeto < ApplicationRecord
    has_and_belongs_to_many :alunos
end
