require 'helpers/action_helper'
require 'helpers/browser_helper'
require 'date'

class WizardController < Rho::RhoController
    include ActionHelper
    include BrowserHelper

    def get_form
        if get_session(:form).nil?
            date = Date.today.day > 15 ? Date.today : Date.today.prev_month
            {
                'date' => {
                    'month' => date.month,
                    'year' => date.year
                },
                'employee' => get_identity,
                'expenses' => []
            }
        else
            get_session(:form)
        end
    end

    def index
        redirect :action => :info if is_tablet?
    end

    def info
        check_auth
        @form = get_form
        @units = [
            {'id' => 1,  'name' => 'G20'},
            {'id' => 2,  'name' => 'G21'},
            {'id' => 3,  'name' => 'G22'},
            {'id' => 4,  'name' => 'G23'},
            {'id' => 5,  'name' => 'G30'},
            {'id' => 6,  'name' => 'G31'},
            {'id' => 7,  'name' => 'G32'},
            {'id' => 8,  'name' => 'G33'},
            {'id' => 9,  'name' => 'G34'},
            {'id' => 10, 'name' => 'G25'}
        ]
    end

    def overview
        check_auth
        @form = get_form


    end

    def add
        check_auth
        @form = get_form

    end

    def sign
        check_auth
        @form = get_form

    end
end