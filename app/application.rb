class AppApplication < Rho::RhoApplication

    def initialize
        @flashes = []
        @session = {}

        @tabs = nil
        @@toolbar = nil

        super
    end

    def on_deactivate_app
        # TODO: Serialize session data
    end

    def on_activate_app
        # TODO: Unserialize session data
    end

    def get_session(namespace)
        @session[namespace]
    end

    def set_session(namespace, value)
        @session[namespace] = value
    end

    # Identity

    def has_identity?
        !get_identity.empty?
    end

    def get_identity_token
        get_identity['token']
    end

    def set_identity_token(token)
        get_identity['token'] = token
    end

    def get_identity
        if @session[:identity].nil?
            @session[:identity] = {}
        end
        @session[:identity]
    end

    def set_identity(identity)
        @session[:identity] = identity
    end

    def clear_identity
        @session.delete(:identity)
    end

    # End Identity

    # Flash Messages

    def has_flashes?
        @flashes.length != 0
    end

    # Fetching the flash messages will clear the list to make sure no flash massages are left behind.
    def get_flashes
        flashes = @flashes
        @flashes = []
        flashes
    end

    def add_flash(flash)
        # "concatenates" the elements to the end of the array
        @flashes << flash
    end

    # End Flash Messages
end