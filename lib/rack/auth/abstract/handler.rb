module Rack
  module Auth
    # Rack::Auth::AbstractHandler implements common authentication functionality.
    #
    # +realm+ should be set for all handlers.

    class AbstractHandler

      attr_accessor :realm

      def initialize(app, &authenticator)
        @app, @authenticator = app, authenticator
      end

      def unauthorized(www_authenticate = challenge)
        return [ 401, { 'WWW-Authenticate' => www_authenticate.to_s }, [] ]
      end

      def bad_request
        [ 400, {}, [] ]
      end

    end
  end
end
