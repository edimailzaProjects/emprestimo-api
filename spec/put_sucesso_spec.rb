# frozen_string_literal: true

describe 'atualizacao bem sucedida' do
    context 'quando um usuario tiver seus dados atualizados' do
        before(:all) do
            user_existente = build(:user_desatualizado)
            @user_atualizado = build(:user_atualizado)
            @result_put = ApiUser.update(user_existente.cpf, @user_atualizado.to_hash)
            @result_get = ApiUser.find(user_existente.cpf)
        end

        it { expect(@result_put.response.code).to eql '200' }
        it { expect(@result_get.parsed_response). not_to be_nil }
        it { expect(@result_get.parsed_response['nome']). to eql @user_atualizado.nome }
        it { expect(@result_get.parsed_response['cpf']). to eql @user_atualizado.cpf }
        it { expect(@result_get.parsed_response['email']). to eql @user_atualizado.email }
        it { expect(@result_get.parsed_response['valor']). to eql @user_atualizado.valor }
        it { expect(@result_get.parsed_response['parcelas']). to eql @user_atualizado.parcelas }
        it { expect(@result_get.parsed_response['seguro']). to eql @user_atualizado.seguro }

        after do
            id_gerado = @result_put.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end
end
