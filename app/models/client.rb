class Client < ApplicationRecord
end
class Client < ApplicationRecord

    validates :name, :cpf, :email, presence: true
    validates :name,  :cpf, :email, uniqueness: true
    validates :cpf, length: { minimum: 11 }

end