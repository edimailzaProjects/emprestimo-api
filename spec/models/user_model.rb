# frozen_string_literal: true

class UserModel
    attr_accessor :nome, :cpf, :email, :valor, :parcelas, :seguro

    def to_hash
        {
            nome: @nome,
            cpf: @cpf,
            email: @email,
            valor: @valor,
            parcelas: @parcelas,
            seguro: @seguro
        }
    end
end