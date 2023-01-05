class HomeController < ApplicationController
    before_action :authenticate_user!

    def index 
        @doctors = User.find_by(role: :doctors)
    end
end
