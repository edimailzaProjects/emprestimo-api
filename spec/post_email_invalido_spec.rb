# frozen_string_literal: true

describe 'dado que sao inseridos dados invalidos para e-mail' do

    context 'quando o parametro email estiver ausente' do
        let(:result) { ApiUser.save(build(:user_email_ausente).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['email']). to eql 'E-mail não deve ser vazio' }
    end

    context 'quando um email for vazio' do
        let(:result) { ApiUser.save(build(:user_email_vazio).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['email']).to eql('E-mail deve ser um e-mail válido').or eql ('não é um endereço de e-mail')}
    end

    context 'quando um email ja estiver cadastrado na base' do
        let(:result) { ApiUser.save(build(:user_email_existente).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['email']).to eql('Email duplicado')}
    end

    context 'quando o e-mail estiver fora do padrao - 1: @email.com' do
        let(:result) { ApiUser.save(build(:user_email_fora_do_padrao_um).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['email']).to eql('E-mail deve ser um e-mail válido').or eql ('não é um endereço de e-mail')}
        
    end

    context 'quando o e-mail estiver fora do padrao - 2: sem @' do
        let(:result) { ApiUser.save(build(:user_email_fora_do_padrao_dois).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['email']).to eql('E-mail deve ser um e-mail válido').or eql ('não é um endereço de e-mail')}
    end

    context 'quando o e-mail estiver fora do padrao - 3: sem nada apos o ultimo ponto' do
        let(:result) { ApiUser.save(build(:user_email_fora_do_padrao_tres).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['email']).to eql('E-mail deve ser um e-mail válido').or eql ('não é um endereço de e-mail')}
    end

    context 'quando o e-mail estiver fora do padrao - 4: outro simbolo no lugar do @' do
        let(:result) { ApiUser.save(build(:user_email_fora_do_padrao_quatro).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['email']).to eql('E-mail deve ser um e-mail válido').or eql ('não é um endereço de e-mail')}
    end

    context 'quando o e-mail estiver fora do padrao - 5: texto sem separadores' do
        let(:result) { ApiUser.save(build(:user_email_fora_do_padrao_cinco).to_hash) }

        it { expect(result.response.code).to eql '400' }
        it { expect(result.parsed_response). not_to be_nil }
        it { expect(result.parsed_response['erros']['email']).to eql('E-mail deve ser um e-mail válido').or eql ('não é um endereço de e-mail')}
    end
end