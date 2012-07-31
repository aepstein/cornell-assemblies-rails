module CornellAssembliesRails
  module Rails
    module Authenticator
      module ClassMethods

        def is_authenticator
          helper_method :current_user_session, :current_user, :sso_net_id
          before_filter :check_authorization
          send :include, InstanceMethods
        end

      end

      module InstanceMethods

        protected

        def sso_net_id
          net_id = request.env['REMOTE_USER'] || request.env['HTTP_REMOTE_USER']
          net_id.blank? ? false : net_id
        end

        def check_authorization
          Authorization.current_user = current_user
        end

        # Obtains user record for currently logged in user
        # * if sso credential is detected verifies it matches session and
        #   updates/logs in automatically as needed
        def current_user
          return @current_user unless @current_user.blank?
          @current_user = User.find(session[:user_id]) if session[:user_id]
          if sso_net_id
            if @current_user && @current_user.net_id != sso_net_id
              @current_user = nil
              session[:user_id] = nil
            end
            @current_user.refresh if @current_user.respond_to? :refresh
            return @current_user unless @current_user.blank?
            initialize_user( sso_net_id )
            if @current_user = User.find_by_net_id( sso_net_id )
              session[:user_id] = @current_user.id
            end
          end
          @current_user.refresh if @current_user.respond_to? :refresh
          @current_user
        end

        def require_user
          unless current_user
            store_location
            redirect_to login_url, alert: 'You must log in to access this page.'
          end
        end

        def require_no_user
          if current_user || @current_user
            redirect_to logout_url
          end
        end

        def store_location
          return if self.class.to_s == UserSessionsController
          session[:return_to] = request.fullpath
        end

        def redirect_back_or_default(default)
          redirect_to(session[:return_to] || default)
          session[:return_to] = nil
        end

        def initialize_user( net_id )
          User.find_or_create_by_net_id( net_id )
        end

        # Override this method in your application to refresh the current user
        # * in particular, to synchronize with LDAP record if no sync in certain
        #   timeframe
        def refresh_current_user
          current_user
        end

      end

      def self.included(receiver)
        receiver.extend         ClassMethods
      end
    end
  end
end

