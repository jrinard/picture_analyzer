# class Message < ActiveRecord::Base
#   before_create :send_sms
#
# private
#   def send_sms
#     begin
#     response = RestClient::Request.new(
#       :method => :post,
#       :url => 'https://api.twilio.com/2010-04-01/Accounts/AC92343d189fc553f58a92f9895da8ced5/Messages.json',
#       :user => ENV['Twilio_Acc_Sid'],
#       :password => ENV['Twilio_Auth_Token'],
#       :payload => { :Body => body,
#                     :From => from,
#                     :To => to}
#     ).execute
#     rescue RestClient::BadRequest => error
#       message = JSON.parse(error.response)['message']
#       errors.add(:base, message)
#       throw(:abort) #helping it not crash if it fails to save
#     end
#   end
# end
