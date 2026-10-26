# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb


require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
meals_csv_path = "data/meals.csv"
customers_csv_path = "data/customers.csv"

require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"

require_relative "router"

meal_repository = MealRepository.new(meals_csv_path)
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new(customers_csv_path)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)
router.run

# SINGULAR
# For Model and Repository

# PLURAL
# For everything else (controller, view, csv)