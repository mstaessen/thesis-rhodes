class DefaultController < Rho::RhoController
    include BrowserHelper

    def pre_dispatch(req, res)
        super
        @child = true
    end

    def index


        render :action => :index
    end

end