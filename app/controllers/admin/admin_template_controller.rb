class Admin::AdminTemplateController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_locale

    private

        def set_locale
            if current_user.language == 3
                I18n.locale = 'my'
            elsif current_user.language == 2
                I18n.locale = 'ja'
            else
                I18n.locale = 'en'
            end
        end
end
