require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    # 1. asking for name (view)
    name = @meals_view.ask_for(:name)
    # 2. asking for price (view)
    price = @meals_view.ask_for(:price).to_i
    # 3. create meal
    meal = Meal.new(name: name, price: price)
    # 4. storing into the repo
    @meal_repository.create(meal)
  end

  def list
    # 1. get meals from the repo
    meals = @meal_repository.all
    # 2. Display them
    @meals_view.display_list(meals)
  end
end