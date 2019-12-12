class CashRegister
  attr_accessor :total, :discount, :title, :price, :quantity, :item_arr

  def initialize(discount = 0.0) 
    @total = 0.0
    @quantity = 0.0
    @discount = discount
    @item_arr = []
  end


  def add_item(title, price, quantity = 1.0)
    self.quantity += quantity
    self.total += price * quantity
    self.item_arr.fill({title => price}, self.item_arr.size, quantity)
    
    
  end

  def apply_discount
    total = self.total -= (self.total * (discount * (0.01)))
    if discount > 0
      "After the discount, the total comes to $#{total.floor}."
    else 
      "There is no discount to apply."
    end
  end

# events.map do |hash|
#   { id: hash[:id], start: hash[:start] }
# end

  def items
    item_arr.map do |item| 
      item.keys[0]
    end 
  end

  def void_last_transaction
      # if at least one item subtract price of last item from total
      if !item_arr.empty?
        @total = @total - item_arr[-1].values[0]# remove price hash
        item_arr.pop
        if item_arr.empty?
           @total = 0.0
        end
      else 
        @total = 0.0
      # remove the hash with price from price arr
      end
      # reset total to 0.0 if empty arr
      
  end

end