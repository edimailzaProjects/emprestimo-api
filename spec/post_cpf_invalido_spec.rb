# frozen_string_literal: true

describe 'dado que sao inseridos dados invalidos para cpf' do
    
    context 'quando o parametro cpf estiver ausente' do
        let(:result) { ApiUser.save( build(:user_cpf_ausente).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['cpf']). to eql 'CPF não pode ser vazio' }
    end

    context 'quando um cpf for booleano' do
        let(:result) { ApiUser.save(build(:user_cpf_booleano).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['mensagem']). to eql 'CPF deve ser um cpf válido' }
    end

    context 'quando um cpf ja existir na base' do
        let(:result) { ApiUser.save(build(:user_cpf_existente).to_hash) }

        it { expect(result.response.code).to eql '409' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['mensagem']). to eql 'CPF já existente' }
    end

    context 'quando um cpf for negativo' do
        let(:result) { ApiUser.save(build(:user_cpf_valor_negativo).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['mensagem']). to eql 'CPF deve ser um cpf válido' }
    end
end

