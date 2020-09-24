class HomeController < Admin::AdminTemplateController
  def index
    @title = t("menu_title.home")
    @years = (2019..Date.today.year).to_a
  end
end
