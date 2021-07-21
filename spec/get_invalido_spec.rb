# frozen_string_literal: true

describe 'consulta invalida para cpf' do 

    context 'quando o cpf nao for informado na consulta' do 
        let(:result) { ApiUser.no_list_cpf_problems }

        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.response.code).to eql '404' }
        it { expect(result.parsed_response['message']).to eql 'No message available' }
    end

    context 'quando o cpf nao estiver cadastrado' do 
        let(:result) { ApiUser.find(1) }

        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.response.code).to eql '404' } 
        it { expect(result.parsed_response['mensagem']).to eql 'CPF 1 não encontrado' }
    end

    context 'quando um usuario nao registrado for consultado' do
        let(:result) { ApiUser.find(2) }

        it { expect(result.response.code).to eql '404' }
        it { expect(result.parsed_response). not_to be_nil }
    end

    context 'quando um numero com muitos digitos for consultado' do
        let(:result) { ApiUser.find(25555555555555555555555555555) }

        it { expect(result.response.code).to eql '404' }
        it { expect(result.parsed_response). not_to be_nil }
    end

    context 'quando letras forem consultadas em vez de numeros' do
        let(:result) { ApiUser.find("abc") }

        it { expect(result.response.code).to eql '404' }
        it { expect(result.parsed_response). not_to be_nil }
    end

    context 'quando o numero for flutuante' do
        let(:result) { ApiUser.find(0.5) }

        it { expect(result.response.code).to eql '404' }
        it { expect(result.parsed_response). not_to be_nil }
    end
end
