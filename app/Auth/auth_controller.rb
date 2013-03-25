class AuthController < AppController

    #Shows login form & error messages
    def login

    end

    # Initiates the Request and renders a "waiting page"
    def do_login
        Rho::AsyncHttp.post(
            :url => "https://http://kulcapexpenseapp.appspot.com/userService/login",
            :callback => (url_for :action => :do_login_callback)
        )
    end

    # Validates the login callback and redirects to either login or /app
    def do_login_callback

    end

    # Logs out the user
    def do_logout

    end
end