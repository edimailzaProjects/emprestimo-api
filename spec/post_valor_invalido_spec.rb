# frozen_string_literal: true

describe 'dado que sao inseridos dados invalidos para valor' do

    context 'quando o parametro valor estiver ausente' do
       let(:result) { ApiUser.save(build(:user_valor_ausente).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['valor']).to eql 'Valor não pode ser vazio' }
    end

    context 'quando um valor nao numerico for enviado' do
        let(:result) { ApiUser.save(build(:user_valor_nao_numerico).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['valor']).to eql 'Valor deve ser um valor válido' }
        
    end

    context 'quando o valor for negativo' do
        let(:result) { ApiUser.save(build(:user_valor_negativo).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['valor']).to have_text 'Valor deve ser um valor válido' }
        it { expect(result).not_to be_empty }

        after do
            id_gerado = result.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end

    context 'quando um valor abaixo do esperado for enviado' do
        let(:result) { ApiUser.save(build(:user_valor_abaixo_do_esperado).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['valor']).to start_with('O valor deve ser um numero menor que') }

        after do
            id_gerado = result.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end

    context 'quando um valor possuir mais de dois digitos apos a virgula' do
        let(:result) { ApiUser.save(build(:user_valor_quatro_digitos_virgula).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['valor']).to eql 'Valor deve ser um valor válido' }

        after do
            id_gerado = result.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end
    
    context 'quando um valor acima do esperado for enviado' do
        let(:result) { ApiUser.save(build(:user_valor_acima_do_esperado).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['valor']).to eql 'Valor deve ser menor ou igual a R$ 40.000' }
    end
end
