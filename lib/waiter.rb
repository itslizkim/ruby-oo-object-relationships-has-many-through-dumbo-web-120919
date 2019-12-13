require 'pry'
class Waiter
    attr_accessor :name, :years

    @@all = []

    def initialize (name, years)
        @name = name
        @years = years

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |all_meals|
            all_meals.waiter == self 
        end
    end
    
    # def customers
    #     meals.map do |customer_instance|
    #       customer_instance.customer
    #     end
    # end


    def best_tipper
        highest_tip = meals.max do |meal_a,meal_b|
            meal_a.tip <=> meal_b.tip
        end
        highest_tip.customer
    end

    
end