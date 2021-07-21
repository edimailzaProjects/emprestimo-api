# frozen_string_literal: true

describe 'post mal sucedido' do
    context 'quando os dados do user nao forem enviados' do
        let(:result) { ApiUser.invalid_save_one() }

        it { expect(result.response.code).to eql '400' }
    end

    context 'quando o cpf for inserido na url' do

        let(:user) { build(:user) }
        let(:result) { ApiUser.invalid_save_two(user.to_hash) }
        
        it { expect(result.response.code).to eql '405' }
    end
end
