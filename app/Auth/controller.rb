require 'helpers/action_helper'

class AuthController < Rho::RhoController
    include ActionHelper

    #Shows login form & error messages
    def login

    end

    # Initiates the Request and renders a "waiting page"
    def do_login
        if @params['email'] and @params['password']
            Rho::AsyncHttp.post(
                :url => "http://kulcapexpenseapp.appspot.com/resources/userService/login",
                :body => "email=#{@params['email']}&password=#{@params['password']}",
                :callback => (url_for :action => :do_login_callback)
            )
        else
            add_flash({:type => 'error', :msg => 'Please enter all your credentials.'})
            redirect :action => :login
        end
    end

    # Validates the login callback and redirects to either login or /app
    def do_login_callback
        rho_info(@params.inspect)

        if @params['status'] == 'ok' and @params['body']
            set_identity_token(@params['body'])

            Rho::AsyncHttp.post(
                :url => "http://kulcapexpenseapp.appspot.com/resources/userService/getEmployee",
                :body => "token=#{get_identity_token}",
                :callback => (url_for :action => :get_employee_callback)
            )
        else
            add_flash({:type => 'error', :msg => 'Could not login, please try again.'})
            WebView.navigate(url_for :action => :login)
        end
    end

    def get_employee_callback
        rho_info(@params.inspect)

        if @params['status'] == 'ok' and !@params['body'].empty?
            # The response's Content-Type is application/json and is automatically parsed by Rhodes
            set_identity(@params['body'])

            add_flash({:type => 'success', :msg => "Successfully logged in. Welcome, #{get_identity_fullname}"})
            WebView.navigate(url_for :model => :Default, :action => :index)
        else
            add_flash({:type => 'error', :msg => 'Something went wrong during login, please try again.'})
            WebView.navigate(url_for :action => :login)
        end
    end

    # Logs out the user
    def do_logout
        ::Rho.get_app.clear_identity
        redirect :model => :Default, :action => :index
    end
end