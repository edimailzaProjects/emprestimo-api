# frozen_string_literal: true

describe 'update mal sucedido' do
    context 'quando um cpf nao estiver cadastrado' do
        before(:all) do
            @user_atualizado = build(:user_put_invalido)
            @result_put = ApiUser.update(1, @user_atualizado.to_hash)
        end

        it { expect(@result_put.response.code).to eql '404' }

        after do
            id_gerado = @result_put.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end

    context 'quando os dados nao forem enviados' do
        before(:all) do
            @result_put = ApiUser.invalid_update()
        end

        it { expect(@result_put.response.code).to eql '405' }
    end
end
