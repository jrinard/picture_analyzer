class Picture < ApplicationRecord
  belongs_to :user
  acts_as_votable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


# before_create :send_sms

private
  def analyze
    begin
    response = RestClient::Request.new(
      :method => :get,
      :url => 'https://api.deepomatic.com/v0.6/detect/weapons/?url=http://www.kimberamerica.com/media/catalog/category/pistols-hero.png',
      :headers => {
        'X-APP-ID' => '413134115772',
        'API-Key' => 'a521ecad9baa4eadad13c82f56d0d9ff'
      }
    ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      throw(:abort) #helping it not crash if it fails to save
    # end
  end
end
end
#
# ap id    413134115772
# api key  a521ecad9baa4eadad13c82f56d0d9ff
#
# https://api.deepomatic.com/v0.6/tasks/269751802/
#
# https://api.deepomatic.com/v0.6/detect/weapons/?url=http://www.kimberamerica.com/media/catalog/category/pistols-hero.png
#
#


#
# begin
# response = RestClient::Request.new(
#   :method => :post,
#   :url => 'https://api.twilio.com/2010-04-01/Accounts/AC92343d189fc553f58a92f9895da8ced5/Messages.json',
#   :user => ENV['Twilio_Acc_Sid'],
#   :password => ENV['Twilio_Auth_Token'],
#   :payload => { :Body => body,
#                 :From => from,
#                 :To => to}
# ).execute
# rescue RestClient::BadRequest => error
#   message = JSON.parse(error.response)['message']
#   errors.add(:base, message)
#   throw(:abort) #helping it not crash if it fails to save
# # end
# end
