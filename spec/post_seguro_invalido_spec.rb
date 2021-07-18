# frozen_string_literal: true

describe 'ausencia de parametros' do
    context 'quando o parametro seguro estiver ausente' do
        before do
            @simulacao = {
                "nome": "Edi Teste",
                "cpf": 85093238014,
                "email": "edi@email.com",
                "valor": 1200,
                "parcelas": 3,
            }

            @result = HTTParty.post("http://localhost:8080/api/v1/simulacoes", 
                body: @simulacao.to_json,
                headers: {
                    'Content-Type' => 'application/json'
                } 
            )
        end

        it { expect(@result.response.code).to eql '400' }
        it { expect(@result.parsed_response['erros']['seguro']). to eql 'Valor não pode ser vazio' }
    end

    context 'quando o parametro seguro estiver ausente' do
        before do
            @simulacao = {
                "nome": "Edi Teste",
                "cpf": 85093238014,
                "email": "edi@email.com",
                "valor": 1200,
                "parcelas": 3,
            }

            @result = HTTParty.post("http://localhost:8080/api/v1/simulacoes", 
                body: @simulacao.to_json,
                headers: {
                    'Content-Type' => 'application/json'
                } 
            )
        end

        it { expect(@result.response.code).to eql '400' }
        it { expect(@result.parsed_response['erros']['seguro']). to eql 'Valor não pode ser vazio' }
    end
end