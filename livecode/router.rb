class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    puts "Welcome to the Food Delivery app 🚚"
    loop do
      puts "What do you want to do:"
      puts "1. List meals"
      puts "2. Add meals"
      puts "3. List customers"
      puts "4. Add customers"

      choice = gets.chomp.to_i
      case choice
      when 1 then @meals_controller.list
      when 2 then @meals_controller.add
      when 3 then @customers_controller.list
      when 4 then @customers_controller.add
      else
        puts "Wrong command"
      end
    end
  end
end