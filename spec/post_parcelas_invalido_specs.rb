# frozen_string_literal: true

describe 'dado que sao inseridos dados invalidos para parcelas' do

    context 'quando o parametro parcelas estiver ausente' do
        let(:result) { ApiUser.save(build(:user_parcelas_ausente).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['parcelas']).to eql 'Parcelas não pode ser vazio' }
    end

    context 'quando uma parcela for textual' do
        let(:result) { ApiUser.save(build(:user_parcelas_textual).to_hash) }
        
        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response).not_to be_nil }
    end

    context 'quando uma parcela for booleano' do
        let(:result) { ApiUser.save(build(:user_parcelas_booleano).to_hash) }
        
        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
    end

    context 'quando uma parcela for string numerica' do
        let(:result) { ApiUser.save(build(:user_parcelas_string_numerica).to_hash) }
        
        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
    end

    context 'quando uma parcela for negativa' do
        let(:result) {  ApiUser.save(build(:user_parcelas_negativo).to_hash) }
        
        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['parcelas']).to eql 'Parcelas deve ser igual ou maior que 2' }
    end

    context 'quando uma parcela for zero' do
        let(:result) {  ApiUser.save(build(:user_parcelas_zero).to_hash) }
        
        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['parcelas']).to eql 'Parcelas deve ser igual ou maior que 2' }
    end

    context 'quando uma parcela for unica' do
        let(:result) {  ApiUser.save(build(:user_parcelas_unica).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['parcelas']).to eql 'Parcelas deve ser igual ou maior que 2' }
    end

    context 'quando uma parcela for muito alta' do
        let(:result) {  ApiUser.save(build(:user_parcelas_muitos_digitos).to_hash) }
        
        it { expect(@result.response.code).to eql '400' }
        it { expect(@result.parsed_response). not_to be_nil }
        it { expect(@result.parsed_response['erros']['parcelas']).to start_with('Parcelas deve ser igual ou menor que') }
    end

    context 'quando uma parcela for maior que 48' do
        let(:result) {  ApiUser.save(build(:user_parcelas_maior_que_limite).to_hash) }
        
        it { expect(@result.response.code).to eql '400' }
        it { expect(@result.parsed_response). not_to be_nil }
        it { expect(@result.parsed_response['erros']['parcelas']).to eql('Parcelas deve ser igual ou menor que 48') }
    end
end
