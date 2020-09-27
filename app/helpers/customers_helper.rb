module CustomersHelper

    def customer_name(id)
        Customer.find(id).name
    end
end
