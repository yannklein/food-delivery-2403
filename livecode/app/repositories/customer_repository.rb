require "csv"
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_path)
    
    # if @customers.empty?
    #   @next_id = 1
    # else
    #   @next_id = @customers.last.id + 1
    # end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def all
    @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, header_converters: :symbol, headers: :first_row) do |row|
      row[:id] = row[:id].to_i
      customer = Customer.new(row)
      @customers << customer
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end