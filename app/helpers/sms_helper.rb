module SmsHelper
  require 'twilio-ruby'

  def build_message_body(username, truck_name, status, address)
    message = "Hi, #{username}, your order at #{truck_name} is #{status}! "
    if status == 'READY'
      message += "Please go to #{address} to pickup!"
    elsif status == 'COMPLETED'
      message += 'Enjoy your meal! Feel free to order on Feedr next time!'
    end

    message
  end

  def send_message(to, body)
    account_sid = 'AC9b7373d448f1841bbfc586983d5a2eb5'
    auth_token = '7f7d8737fd2856adc2d3e5bad1b75f24'
    from = '+19284408498' # Your Twilio number
    to = "+1#{to}"
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(from: from, to: to, body: body)
  end
end
