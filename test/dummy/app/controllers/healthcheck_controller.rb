class HealthcheckController < ApplicationController
    def index
        render json: { message: "OK" }
    end
end
