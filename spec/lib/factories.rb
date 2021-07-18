# frozen_string_literal: true

require 'faker'

require_relative '../models/user_model'

FactoryBot.define do
    factory :user, class: UserModel do
        nome { "Edi Teste" }
        cpf { "85093258018" }
        email { "edi@email.com" }
        valor { 1200 }
        parcelas { 3 }
        seguro { true }
    end

    factory :user_cpf_ausente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 1907 }
        parcelas { 6 } 
        seguro { true }
    end

    factory :user_cpf_booleano, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { true }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 1200 }
        parcelas { 3 } 
        seguro { true }
    end

    factory :user_cpf_existente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 85093238014 }
        email { Faker::Internet.free_email(name: nome) }
        valor { 1500 }
        parcelas { 2 } 
        seguro { true }

        after (:build) do |user|
            ApiUser.save(user.to_hash)
        end
    end

    factory :user_cpf_valor_negativo, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { -1 }
        email { Faker::Internet.free_email(name: nome) }
        valor { 12080 }
        parcelas { 3 }
        seguro { true }
    end

    factory :user_nome_ausente, class: UserModel do
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 1200 }
        parcelas { 2 } 
        seguro { true }
    end

    factory :user_nome_vazio, class: UserModel do
        nome { "" }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "editestenomevazio@email.com" } 
        valor { 5200 }
        parcelas { 3 } 
        seguro { true }
    end

    factory :user_nome_float, class: UserModel do
        nome { 5.9 }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "editestenomefloat@email.com" } 
        valor { 2300 }
        parcelas { 5 } 
        seguro { true }
    end

    factory :user_email_ausente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 85000238024 }
        valor { 9200 }
        parcelas { 4 } 
        seguro { true }
    end

    factory :user_email_vazio, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "" }
        valor { 1200 }
        parcelas { 3 } 
        seguro { true }
    end

    factory :user_email_existente, class: UserModel do
        nome { "Edi Teste email repetido" }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "ediemailrepetido@email.com" }
        valor { 5509 }
        parcelas { 7 } 
        seguro { true }

        after (:build) do |user|
            ApiUser.save(user.to_hash)
        end
    end

    factory :user_email_fora_do_padrao_um, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "@email.com" }
        valor { 5509 }
        parcelas { 7 } 
        seguro { true }
    end

    factory :user_email_fora_do_padrao_dois, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "ediemail.com" }
        valor { 5509 }
        parcelas { 9 } 
        seguro { true }
    end

    factory :user_email_fora_do_padrao_tres, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "edi@email" }
        valor { 59 }
        parcelas { 6 } 
        seguro { true }
    end

    factory :user_email_fora_do_padrao_quatro, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "edi#email.com" }
        valor { 5509 }
        parcelas { 7 } 
        seguro { true }
    end

    factory :user_email_fora_do_padrao_cinco, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { "ediemailcom" }
        valor { 5509 }
        parcelas { 7 } 
        seguro { true }
    end

    factory :user_valor_ausente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 5 } 
        seguro { true }
    end

    factory :user_valor_nao_numerico, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        valor { "abc" }
        parcelas { 5 } 
        seguro { true }
    end

    factory :user_valor_negativo, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        valor { -1 }
        parcelas { 10 } 
        seguro { true }
    end

    factory :user_valor_abaixo_do_esperado, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 1 }
        parcelas { 4 } 
        seguro { true }
    end
    
    factory :user_valor_acima_do_esperado, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 4000001 }
        parcelas { 4 } 
        seguro { true }
    end
    #10000000000000000 - este devolve vazio

    factory :user_parcelas_ausente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_textual, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { "abc" } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_booleano, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { true } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_string_numerica, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { "12" } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_negativo, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { -1 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_zero, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 0 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_unica, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 1 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_maior_que_limite, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 49 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_muitos_digitos, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { Faker::Number.leading_zero_number(digits: 11) }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 10000000000 } 
        valor { 5509 }
        seguro { true }
    end
end
