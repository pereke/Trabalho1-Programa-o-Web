class Aula < ApplicationRecord
    validates :nomeAula, presence: true
    validates :categoria, presence: true
    validates :quantidade, presence: true
end
