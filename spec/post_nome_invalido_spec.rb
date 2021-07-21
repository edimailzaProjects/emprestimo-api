# frozen_string_literal: true

describe 'dado que sao inseridos dados invalidos para nome' do
    
    context 'quando o parametro nome estiver ausente' do
        let (:result) { ApiUser.save(build(:user_nome_ausente).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['nome']). to eql 'Nome não pode ser vazio' }
    end

    context 'quando o parametro nome for vazio' do
        let(:result) { ApiUser.save(build(:user_nome_vazio).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['nome']). to eql 'Nome não pode ser vazio' }

        after do
            id_gerado = result.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end

    context 'quando o nome nao for textual' do
        let(:result) { ApiUser.save(build(:user_nome_float).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['mensagem']). to eql 'Nome não pode ser vazio' }

        after do
            id_gerado = result.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end
end
