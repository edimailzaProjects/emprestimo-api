# frozen_string_literal: true

describe 'listagem bem sucedida' do
    context 'quando a url for consultada' do
        let(:result) { ApiUser.list }

        it { expect(result.response.code).to eql '200' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response).to be_a_kind_of(Array) }
    end

    context 'quando um usuario registrado for consultado' do
        let(:user) { build(:user_registrado) }
        let(:result) { ApiUser.find(user.cpf) }

        it { expect(result.response.code).to eql '200' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['id']). not_to be_nil }
        it { expect(result.parsed_response['nome']). to eql 'Edi Teste Get' }
        it { expect(result.parsed_response['nome']).to be_a_kind_of(String) }
        it { expect(result.parsed_response['cpf']). not_to be_nil }
        it { expect(result.parsed_response['cpf']).to be_a_kind_of(String) }
        it { expect(result.parsed_response['email']). to eql 'ediget@email.com' }
        it { expect(result.parsed_response['email']).to be_a_kind_of(String) }
        it { expect(result.parsed_response['valor']). to eql 1200.0 }
        it { expect(result.parsed_response['valor']).to be_a_kind_of(Float) }
        it { expect(result.parsed_response['parcelas']). to eql 3 }
        it { expect(result.parsed_response['parcelas']).to be_a_kind_of(Integer) }
        it { expect(result.parsed_response['seguro']). to eql true }
        it { expect(result.parsed_response['seguro']).to be_a_kind_of(TrueClass) }

        after do
            id_gerado = result.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end

    context 'quando o sustenido for enviado na consulta' do
        let(:result) { ApiUser.find("#{'#'}") }

        it { expect(result.response.code).to eql '200' }
    end

    context 'quando o cpf tiver restricao' do 
        let(:result) { ApiUser.find_cpf_problems(97093236014) }

        it { expect(result.response.code).to eql '200' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['mensagem']).to eql 'O CPF 97093236014 tem problema' }
    end

    context 'quando o cpf nao tiver restricao' do
        let(:user) { build(:user_registrado) }
        let(:result) { ApiUser.find_cpf_problems(user.cpf) }

        it { expect(result.response.code).to eql '204' }
    end
end
