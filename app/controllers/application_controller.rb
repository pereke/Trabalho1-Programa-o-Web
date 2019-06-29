class ApplicationController < ActionController::API
    include JWTSessions::RailsAuthorization
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

    private

    def current_user
        @current_user ||= Professor.find(payload['professor_id'])
    end


    def not_authorized
        render json: { error: 'Nao autorizado'}, status: :unauthorized
    end
end
