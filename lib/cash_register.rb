class CashRegister
    attr_accessor :total, :discount, :void


    def initialize(discount = 0)
        @total = 0 
        @discount = discount
        @cart = []
    end

    def add_item(title, price, quantity = 1)
        # binding.pry
        @total += price * quantity
        @void = price * quantity
        quantity.times do
            @cart << title
        end
    end

    def apply_discount
        if discount == 0 
            return "There is no discount to apply."
        else
            @total -= total*discount / 100
            return "After the discount, the total comes to $#{@total}."
        end

    end

    def items
        @cart
    end

    def void_last_transaction
        @total -= void
    end
end