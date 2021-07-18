# frozen_string_literal: true

describe 'simulacao bem sucedida' do
    context 'quando uma nova simulacao for criada' do
        let(:result) { ApiUser.save(build(:user).to_hash) }

        it { expect(result.response.code).to eql '201' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['nome']). to eql 'Edi Teste' }
        it { expect(result.parsed_response['cpf']). to eql '85093258018' }
        it { expect(result.parsed_response['email']). to eql 'edi@email.com' }
        it { expect(result.parsed_response['valor']). to eql 1200 }
        it { expect(result.parsed_response['parcelas']). to eql 3 }
        it { expect(result.parsed_response['seguro']). to eql true }

        after do
            id_gerado = result.parsed_response['id']
            ApiUser.remove(id_gerado)
        end
    end  
end


