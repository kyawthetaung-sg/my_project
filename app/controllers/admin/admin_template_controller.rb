class Admin::AdminTemplateController < ActionController::Base
    before_action :authenticate_user!
end
