require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times {@items << title}
        @prices << [price, quantity]
    end

    def apply_discount
        @total = total - (total * @discount).to_i/100
        if @discount == 0

            "There is no discount to apply."
        else
        "After the discount, the total comes to $#{self.total}."

        end

    end
    
    def void_last_transaction
        @last = @prices.last
        @total = @total - (@last[0] * @last[1])
        @prices.pop
    end

end
