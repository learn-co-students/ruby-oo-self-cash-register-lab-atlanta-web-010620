class CashRegister 
    def initialize(discount=nil)
        @total = 0 
        @discount=discount
        @items = [] 
        @last_charge = []
    end 
    attr_accessor :discount, :total

    def add_item(title, price, quantity=1) 
        @total+=price*quantity
        quantity.times do 
            @items << title 
            @last_charge << price*quantity
        end 
    end

    def apply_discount
        if discount!=nil 
            @total*=1-(@discount.to_f/100)
            @total = @total.to_i
            return "After the discount, the total comes to $#{@total}."
        end
        return "There is no discount to apply."
    end

    def items 
        return @items 
    end

    def void_last_transaction 
        if @items.length > 0 
            @total -= @last_charge[-1]
            @items.pop()
            @last_charge.pop()
        end
    end


end
