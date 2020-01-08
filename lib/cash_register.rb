class CashRegister
    attr_reader :discount
    attr_accessor :total, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @before_total = @total
        @before_items = @items
        i = 0
        while i < quantity
            @items << title
            i += 1
        end
        @total += (price * quantity)
    end

    def apply_discount
        if @discount > 0
            @total *= 1 - (@discount.to_f/100)
            string = "After the discount, the total comes to $#{@total.to_i}."
        else
            string = "There is no discount to apply."
        end
        puts string
        return string
    end

    def void_last_transaction
        @items = @before_items
        @total = @before_total
    end
end

