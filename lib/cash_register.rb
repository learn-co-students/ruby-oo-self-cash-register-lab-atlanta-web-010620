class CashRegister
    attr_accessor :total
    attr_accessor :discount
    attr_accessor :item

   

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @item = []
        @price = []
    end

    def add_item(item, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times do @item << item
        quantity.times do @price << price
            end
        end  
    end

    def apply_discount
        if discount
        self.total *= (100 - discount).to_f/100
        return "After the discount, the total comes to $#{self.total.to_i}."
        else 
            return "There is no discount to apply." 
        end    
    end

    def items
        @item
    end

    def void_last_transaction
        if @price.detect{|n| @price.count(n) > 1}
        self.total -= (@price.pop()) * 2
    else
        self.total -= @price.pop()
        end
    end

end
