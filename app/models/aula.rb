class Aula < ApplicationRecord
    validates :nomeAula, presence: true
    validates :categoria, presence: true
    validates :quantidade, presence: true
    has_one_attached :materialDidatico
end
