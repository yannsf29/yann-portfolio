module CurrentUserConcern
    extend ActiveSupport::Concern
    
    def current_user
        super || guest_user
    end

    def guest_user
        OpenStruct.new(name: "jason", 
                   first_name: "guest", 
                   last_name: "User", 
                   email: "yann@exemple.com")
    
    end        
end

