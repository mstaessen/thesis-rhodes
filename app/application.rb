class AppApplication < Rho::RhoApplication

    def initialize
        @identity = nil
        @flashes = []

        @tabs = nil
        @@toolbar = nil

        super
    end

    # Identity

    def has_identity?
        !@identity.nil?
    end

    def get_identity_token
        @identity['token']
    end

    def set_identity_token(token)
        @identity = { 'token' => token }
    end

    def get_identity
        @identity
    end

    def set_identity(identity)
        @identity.merge!(identity)
    end

    def clear_identity
        @identity = nil
    end

    # End Identity

    # Flash Messages

    def has_flashes?
        return @flashes.length != 0
    end

    # Fetching the flash messages will clear the list to make sure no flash massages are left behind.
    def get_flashes
        flashes = @flashes
        @flashes = []
        return flashes
    end

    def add_flash(flash)
        # "concatenates" the elements to the end of the array
        @flashes << flash
    end

    # End Flash Messages
end