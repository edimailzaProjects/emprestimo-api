# frozen_string_literal: true

describe 'remocao mal sucedida' do
    context 'quando uma simulacao nao registrada for removida' do
        let(:result) { ApiUser.remove(2) }

        it { expect(result.response.code).to eql '404' }
        it { expect(result.parsed_response['mensagem']).to eql 'Simulação não encontrada' }

    end

    context 'quando um numero com muitos digitos for enviado na url da requisicao' do
        let(:result) { ApiUser.remove(200000000000000000000000000) }

        it { expect(result.response.code).to eql '400' }
    end

    context 'quando o sustenido for enviado' do
        let(:result) { ApiUser.remove("#{'#'}") }

        it { expect(result.response.code).to eql '405' }
    end

    context 'quando o letras sao enviadas em vez do id na url da requisicao' do
        let(:result) { ApiUser.remove("abc") }

        it { expect(result.response.code).to eql '400' }
    end
end
