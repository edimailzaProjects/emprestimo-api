# frozen_string_literal: true

class ApiUser
    include HTTParty
    base_uri 'http://localhost:8080/api/v1/simulacoes'
    headers 'Content-Type' => 'application/json'

    def self.save(user)
        post("/", body: user.to_json)
    end
    
    def self.remove(id)
        delete("/#{id}")
    end
end
