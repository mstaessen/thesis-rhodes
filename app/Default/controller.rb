require 'helpers/action_helper'

class DefaultController < Rho::RhoController
    include ActionHelper

    def index
        check_auth

    end

end