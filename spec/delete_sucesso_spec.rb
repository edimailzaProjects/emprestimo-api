# frozen_string_literal: true

describe 'delete bem sucedido' do
    context 'quando uma simulacao registrada for removida' do
        let(:user) { build(:user_delete) }
        let(:result) { ApiUser.remove(user.id) }

        it { expect(result.response.code).to eql '204' }
        it { expect(result.parsed_response).to eql 'OK' }
    end
end
