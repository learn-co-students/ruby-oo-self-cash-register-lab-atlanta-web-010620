class CashRegister

    attr_accessor :total, :discount, :price, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        @price = price
        @total += price * quantity
        if quantity > 1
            counter = 0
            while counter < quantity
                @items << item
                counter += 1
            end
        else 
            @items << item
        end
    end

    def apply_discount
        if @discount > 0
         @to_take_off = (total * discount).to_i/100
         @total -= @to_take_off
         return  "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."       
        end
    end
    
    def total
        @total
    end

    def void_last_transaction
        @total -= @price 
        @total == 0
        puts "returns the total to 0.0 if all items have been removed"
    end

end