class Professor < ApplicationRecord
    validates :nomeProfessor, presence: true
    validates :sala, presence: true
    validates :email, presence: true
    validates :telefone, presence: true
end
