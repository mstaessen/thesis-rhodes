module ActionHelper

    def check_auth
        if !has_identity? and @request['model'] != 'Auth'
            redirect :model => :Auth, :action => :login
        end
    end

    def has_identity?
        ::Rho.get_app.has_identity?
    end

    def set_identity_token(token)
        ::Rho.get_app.set_identity_token(token)
    end

    def get_identity_token
        ::Rho.get_app.get_identity_token
    end

    def get_identity
        ::Rho.get_app.get_identity
    end

    def set_identity(identity)
        ::Rho.get_app.set_identity(identity)
    end

    def get_identity_fullname
        "#{get_identity['firstName']} #{get_identity['lastName']}"
    end

    def has_flashes?
        ::Rho.get_app.has_flashes?
    end

    def get_flashes
        ::Rho.get_app.get_flashes
    end

    def add_flash(flash)
        ::Rho.get_app.add_flash(flash)
    end

    def render_flashes(*flashes)
        render :partial => "partials/flashes", :locals => {:flashes => flashes + get_flashes}
    end
end