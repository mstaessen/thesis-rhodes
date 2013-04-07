module BrowserHelper

    def placeholder(label=nil)
        "placeholder='#{label}'" if platform == 'apple'
    end

    def platform
        System::get_property('platform').downcase
    end

    def selected(option_value, object_value)
        'selected="yes"' if option_value == object_value
    end

    def checked(option_value, object_value)
        'checked="yes"' if option_value == object_value
    end

    def is_bb6
        platform == 'blackberry' && (System::get_property('os_version').split('.')[0].to_i >= 6)
    end

    def get_orientation
        System::get_property('screen_orientation')
    end

    def get_width
        System::get_property('screen_width')
    end

    def get_height
        System::get_property('screen_height')
    end

    def is_portrait?
        get_orientation == 'portrait'
    end

    def is_landscape?
        get_orientation == 'landscape'
    end

    def is_tablet?
        # FIXME: Quickfix because of top bar, maybe try devlog#15
        (is_portrait? and get_width >= 720) or (is_landscape? and get_height >= 552)
    end

    def is_phone?
        # FIXME: Same Quickfix
        (is_portrait? and get_width < 720) or (is_landscape? and get_height < 552)
    end
end