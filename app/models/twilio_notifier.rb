require 'twilio-ruby'

class TwilioNotifier
  def initialize(order)
    @order = order

  end

  def ordered_item_titles
    @order.items.pluck(:title).to_sentence
  end

  def notify
    client.messages.create(
      from: '+19495372518',
      to: '+16082392471', # 12026817334 test number
      body: "Thank you for placing an order at Droply. Your supplies #{ordered_item_titles} will delivered to #{@order.user.shipping_address}.
      The total cost of your order was $#{@order.order_total_cost.round(2)}"
    )
  end

  private

  def client
     @client ||= Twilio::REST::Client.new(ENV['twilio_account_sid'], ENV['twilio_auth_token'])
  end
end

