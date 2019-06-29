class Professor < ApplicationRecord
    has_secure_password
    validates :nomeProfessor, presence: true
    validates :sala, presence: true
    validates :email, presence: true
    validates :telefone, presence: true
end
