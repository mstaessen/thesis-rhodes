class AppApplication < Rho::RhoApplication
    def initialize
        @identity = nil
        @flashes = []

        @tabs = nil
        @@toolbar = nil

        super
    end

    def has_identity?
        return !@identity.nil?
    end

    def get_identity
        return @identity
    end

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
end