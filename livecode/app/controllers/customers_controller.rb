require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    # 1. asking for name (view)
    name = @customers_view.ask_for(:name)
    # 2. asking for address (view)
    address = @customers_view.ask_for(:address)
    # 3. create customer
    customer = Customer.new(name: name, address: address)
    # 4. storing into the repo
    @customer_repository.create(customer)
  end

  def list
    # 1. get customers from the repo
    customers = @customer_repository.all
    # 2. Display them
    @customers_view.display_list(customers)
  end
end