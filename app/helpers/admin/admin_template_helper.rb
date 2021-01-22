module Admin::AdminTemplateHelper
    def user_management_links
        options = [
            {condition: has_permission("account_read"), path: accounts_path, icon_class: "far fa-circle", label: t("sub_sidebar.user_management.account")},
            {condition: has_permission("role_read"), path: roles_path, icon_class: "far fa-circle", label: t("sub_sidebar.user_management.role")},
        ]
        main_dropdown_link(t("main_sidebar.user_management"), "fas fa-user", "userSubmenu", options)
    end

    def business_links
        options = [
            {condition: has_permission("product_sale_read"), path: product_sales_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.product_sale")},
            {condition: has_permission("sale_list_read"), path: sale_lists_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.sale_list")},
            {condition: has_permission("product_sale_list_read"), path: product_sale_lists_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.product_sale_list")},
            {condition: has_permission("debt_capital_read"), path: capitals_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.capital")},
            {condition: has_permission("capital_read"), path: debt_capitals_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.debt_capital")},
            {condition: has_permission("general_expense_read"), path: general_expenses_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.general_expense")},
            {condition: has_permission("business_category_read"), path: categories_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.category")},
            {condition: has_permission("product_read"), path: business_types_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.product")},
            {condition: has_permission("customer_read"), path: customers_path, icon_class: "far fa-circle", label: t("sub_sidebar.business.customer")},
        ]
        main_dropdown_link(t("main_sidebar.business"), "fas fa-briefcase", "businessSubmenu", options)
    end

    def expense_links
        options = [
            {condition: has_permission("expense_category_read"), path: expense_categories_path, icon_class: "far fa-circle", label: t("sub_sidebar.expense.category")},
            {condition: has_permission("payment_mode_read"), path: payment_modes_path, icon_class: "far fa-circle", label: t("sub_sidebar.expense.payment_mode")},
            {condition: has_permission("income_read"), path: incomes_path, icon_class: "far fa-circle", label: t("sub_sidebar.expense.income")},
            {condition: has_permission("expense_read"), path: expenses_path, icon_class: "far fa-circle", label: t("sub_sidebar.expense.expense")},
        ]
        main_dropdown_link(t("main_sidebar.expense")+" (#{ current_user.user_name })", "fas fa-wallet", "expenseSubmenu", options)
    end

    def site_setting_links
        options = [
            {condition: has_permission("theme_read"), path: themes_path, icon_class: "far fa-circle", label: t("sub_sidebar.setting.theme")},
        ]
        main_dropdown_link(t("main_sidebar.setting"), "fas fa-cog", "settingSubmenu", options)
    end

    def page_setting_links
        options = [
            {condition: false, path: new_theme_path, icon_class: "far fa-circle", label: "Pages"},
            {condition: false, path: edit_theme_path(1), icon_class: "far fa-circle", label: "Pages 2"},
            {condition: false, path: new_page_path, icon_class: "far fa-circle", label: "Pages 3"},
        ]
        main_dropdown_link(t("main_sidebar.setting"), "fa fa-user", "pagesettingSubmenu", options)
    end

    def main_dropdown_link(label = "", icon_class = "", submenu_id = "", options = {})
        option_count = 0
        condition = options.any? do |option|
            option_count += 1 if option[:condition]
            request.path.include? option[:path]
        end

        return if option_count == 0
        
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
        if request.path.include? path
            classActive = 'active'
        else
            classActive = ''
        end
        content_tag(:li, class: classActive) do
            link_to path do
                "<i class='#{icon_class}'></i> #{label}".html_safe
            end
        end
    end

    def full_language(lang_id)
        if lang_id == 3
            language_name = "Myanmar"
        elsif lang_id == 2
            language_name = "Japanese"
        else
            language_name = "English"
        end
    end

    def has_permission(name)
        role = current_user.role
        if role.id == 1
            return true
        else
            role.permissions.pluck(:name).include? name
        end
    end

    def has_permission_checked(role, name)
        (role.permissions.pluck(:name).include? name) ? 'checked' : ''
    end

    def number_with_precision_format(number)
        number_with_precision(number, :precision => 1)
    end
end
