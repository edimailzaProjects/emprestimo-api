# frozen_string_literal: true

class ApiUser
    include HTTParty
    base_uri CONFIG['url_padrao']
    headers 'Content-Type' => 'application/json'

    def self.save(user)
        post("/simulacoes/", body: user.to_json)
    end

    def self.invalid_save_one()
        post("/simulacoes/")
    end

    def self.invalid_save_two(user)
        post("/simulacoes/85093548018", body: user.to_json)
    end
    
    def self.remove(id)
        delete("/simulacoes/#{id}")
    end

    def self.list
        get("/simulacoes/")
    end

    def self.find(id)
        get("/simulacoes/#{id}")
    end

    def self.find_cpf_problems(cpf)
        get("/restricoes/#{cpf}")
    end

    def self.no_list_cpf_problems
        get("/restricoes/")
    end

    def self.update(cpf, user)
        put("/simulacoes/#{cpf}", body: user.to_json)
    end

    def self.invalid_update()
        put("/simulacoes/")
    end
end
