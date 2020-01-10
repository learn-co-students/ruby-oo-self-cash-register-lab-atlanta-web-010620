
class CashRegister
attr_accessor :total, :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item(title, price, quantity=1)
        @title = title
        @price = price
        @total += (price * quantity)
        quantity.times {@items << @title}
        @prices << [price, quantity]
    end

    def apply_discount
        @total = total - (total * discount.to_f / 100)
        if discount > 0
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @last_item = @prices[-1]
        @total = total - (@last_item[0] * @last_item[1])
        @prices.pop
    end
end