# frozen_string_literal: true

require 'faker'

require_relative '../models/user_model'

FactoryBot.define do
    factory :user, class: UserModel do
        nome { "Edi Teste" }
        cpf { "80000000001" }
        email { "edi@email.com" }
        valor { 1200 }
        parcelas { 3 }
        seguro { true }
    end

    factory :user_desatualizado, class: UserModel do
        nome { "Edi Teste" }
        cpf { "80000000000" }
        email { "edi@email.com" }
        valor { 1200 }
        parcelas { 3 }
        seguro { true }

        after(:build) do |user|
            result = ApiUser.save(user.to_hash)
            user.cpf = result.parsed_response['cpf']
        end
    end

    factory :user_atualizado, class: UserModel do
        nome { "Edi Teste Put" }
        cpf { "80000000000" }
        email { "ediput@email.com" }
        valor { 1201 }
        parcelas { 2 }
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
        nome { "Edi Teste Get para CPF ja existente" }
        cpf { Faker::Number.number(digits: 11) }
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
        cpf { 80000000002 }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 1200 }
        parcelas { 2 } 
        seguro { true }
    end

    factory :user_nome_vazio, class: UserModel do
        nome { "" }
        cpf { 80000000003 }
        email { "editestenomevazio@email.com" } 
        valor { 5200 }
        parcelas { 3 } 
        seguro { true }
    end

    factory :user_nome_float, class: UserModel do
        nome { 5.9 }
        cpf { 80000000004 }
        email { "editestenomefloat@email.com" } 
        valor { 2300 }
        parcelas { 5 } 
        seguro { true }
    end

    factory :user_email_ausente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000005 }
        valor { 9200 }
        parcelas { 4 } 
        seguro { true }
    end

    factory :user_email_vazio, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000006 }
        email { "" }
        valor { 1200 }
        parcelas { 3 } 
        seguro { true }
    end

    factory :user_email_existente, class: UserModel do
        nome { "Edi Teste E-mail Repetido" }
        cpf { 80000000007 }
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
        cpf { 80000000008 }
        email { "@email.com" }
        valor { 5509 }
        parcelas { 7 } 
        seguro { true }
    end

    factory :user_email_fora_do_padrao_dois, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000009 }
        email { "ediemail.com" }
        valor { 5509 }
        parcelas { 9 } 
        seguro { true }
    end

    factory :user_email_fora_do_padrao_tres, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000010 }
        email { "edi@email" }
        valor { 59 }
        parcelas { 6 } 
        seguro { true }
    end

    factory :user_email_fora_do_padrao_quatro, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000011 }
        email { "edi#email.com" }
        valor { 5509 }
        parcelas { 7 } 
        seguro { true }
    end

    factory :user_email_fora_do_padrao_cinco, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000012 }
        email { "ediemailcom" }
        valor { 5509 }
        parcelas { 7 } 
        seguro { true }
    end

    factory :user_valor_ausente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000013 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 5 } 
        seguro { true }
    end

    factory :user_valor_nao_numerico, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000014 }
        email { Faker::Internet.free_email(name: nome) } 
        valor { "abc" }
        parcelas { 5 } 
        seguro { true }
    end

    factory :user_valor_negativo, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000015 }
        email { Faker::Internet.free_email(name: nome) } 
        valor { -1 }
        parcelas { 10 } 
        seguro { true }
    end

    factory :user_valor_abaixo_do_esperado, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000016 }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 1 }
        parcelas { 4 } 
        seguro { true }
    end

    factory :user_valor_quatro_digitos_virgula, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000088 }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 1000.9999 }
        parcelas { 4 } 
        seguro { true }
    end
    
    factory :user_valor_acima_do_esperado, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000017 }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 4000001 }
        parcelas { 4 } 
        seguro { true }
    end

    factory :user_parcelas_ausente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000018 }
        email { Faker::Internet.free_email(name: nome) } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_textual, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000019 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { "abc" } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_booleano, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000020 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { true } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_negativo, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000022 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { -1 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_zero, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000023 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 0 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_unica, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000024 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 1 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_maior_que_limite, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000025 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 49 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_parcelas_muitos_digitos, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000026 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 10000000000 } 
        valor { 5509 }
        seguro { true }
    end

    factory :user_seguro_ausente, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000027 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 2 } 
        valor { 5509 }
    end

    factory :user_seguro_falso, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000028 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 2 } 
        valor { 5509 }
        seguro { false }
    end

    factory :user_seguro_nulo, class: UserModel do
        nome { Faker::Name.name_with_middle }
        cpf { 80000000029 }
        email { Faker::Internet.free_email(name: nome) } 
        parcelas { 4 } 
        valor { 5509 }
        seguro { null }
    end

    factory :user_registrado, class: UserModel do
        id { 0 }
        nome { "Edi Teste Get" }
        cpf { Faker::Number.number(digits: 11) }
        email { "ediget@email.com" }
        valor { 1200 }
        parcelas { 3 }
        seguro { true }

        after(:build) do |user|
            result = ApiUser.save(user.to_hash)
            user.cpf = result.parsed_response['cpf']
            puts user.cpf
        end
    end

    factory :user_delete, class: UserModel do
        id { 0 }
        nome { "Edi Teste Delete" }
        cpf { Faker::Number.number(digits: 11) }
        email { "edidelete@email.com" }
        valor { 1200 }
        parcelas { 3 }
        seguro { true }

        after(:build) do |user|
            result = ApiUser.save(user.to_hash)
            user.id = result.parsed_response['id']
        end
    end  

    factory :user_put_invalido, class: UserModel do
        nome { "Edi Teste Put" }
        cpf { "80000000040" }
        email { "edi@email.com" }
        valor { 1200 }
        parcelas { 3 }
        seguro { true }
    end
end
