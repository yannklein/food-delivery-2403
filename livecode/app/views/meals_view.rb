class MealsView
  def ask_for(something)
    puts "What #{something}?"
    gets.chomp
  end

  def display_list(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} | #{meal.price}€"
    end
  end
end