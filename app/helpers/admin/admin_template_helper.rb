module Admin::AdminTemplateHelper
    def site_setting_links
        options = [
            {condition: true, path: themes_path, icon_class: "far fa-circle", label: "Themes"},
            ]
            main_dropdown_link(t("menu.admin.site_settings"), "fas fa-cog", "settingSubmenu", options)
        end
        
        def page_setting_links
            options = [
            {condition: true, path: new_theme_path, icon_class: "far fa-circle", label: "Pages"},
            {condition: true, path: edit_theme_path(1), icon_class: "far fa-circle", label: "Pages 2"},
            {condition: true, path: new_page_path, icon_class: "far fa-circle", label: "Pages 3"},
            ]
            main_dropdown_link(t("menu.admin.page_settings"), "fa fa-user", "pagesettingSubmenu", options)
        end
        
        def main_dropdown_link(label = "", icon_class = "", submenu_id = "", options = {})
            condition = options.any? do |option|
                request.path.include? option[:path]
            end
            
            html = <<-EOT
            <li class="#{condition ? 'dropup open active' : 'dropdown' }" id="#{ icon_class }" >
                <a data-toggle="collapse" aria-expanded="false" class="dropdown-toggle" id="main-menu" href="##{ submenu_id }">
                <i class='#{icon_class}'></i> #{ label }
                </a>
                <ul class="collapse list-unstyled submenu #{condition ? 'show' : '' }" id="#{ submenu_id }">
                #{
                options.map{|option|
                    sub_dropdown_option(option[:condition], option[:path] || "#", option[:icon_class], option[:label])
                }.join
                }
                </ul>
            </li>
            EOT
            html.html_safe
        end
        
        def sub_dropdown_option(condition, path = "#", icon_class = "", label = "")
            condition = true if condition == nil
            return unless condition
            path == request.path ? classActive = 'active' : classActive = ''
            content_tag(:li, class: classActive) do
            link_to path do
                "<i class='#{icon_class}'></i> #{label}".html_safe
            end
        end
    end
end
