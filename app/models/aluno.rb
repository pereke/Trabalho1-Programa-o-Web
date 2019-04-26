class Aluno < ApplicationRecord
    has_and_belongs_to_many :projetos
end
