require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_path)
    
    # if @meals.empty?
    #   @next_id = 1
    # else
    #   @next_id = @meals.last.id + 1
    # end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, header_converters: :symbol, headers: :first_row) do |row|
      # row => {id: "1", name: "burger", price: "8"}
      row[:id] = row[:id].to_i
      # row => {id: 1, name: "burger", price: "8"}
      row[:price] = row[:price].to_i
      # row => {id: 1, name: "burger", price: 8}
      meal = Meal.new(row)
      @meals << meal
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end