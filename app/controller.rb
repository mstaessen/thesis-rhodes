class AppController < Rho::RhoController
    include BrowserHelper

    def serve(application, object_mapping, req, res)
        pre_dispatch(application, req, res)
        super
    end

    def pre_dispatch(application, req, res)
        # If a user is not logged in, redirect to login form
        if !application.has_identity? and req['model'] != 'Auth'
            redirect :model => :auth, :action => :login
        end
    end

    def has_flashes?
        return ::Rho.get_app.has_flashes?
    end

    def get_flashes
        return ::Rho.get_app.get_flashes
    end

    def add_flash(flash)
        ::Rho.get_app.add_flash(flash)
    end
end