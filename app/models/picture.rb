class Picture < ApplicationRecord
  belongs_to :user
  acts_as_votable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

# before_create :get_task
 after_save :get_task
  def get_task
    begin
    response = RestClient::Request.new(
      :method => :get,
      :url => "https://api.deepomatic.com/v0.6/detect/weapons/?url=#{self.url}",
      :headers => {
        'X-APP-ID' => '413134115772',
        'X-API-KEY' => 'a521ecad9baa4eadad13c82f56d0d9ff'
      }
    ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      throw(:abort) #helping it not crash if it fails to save
    end
    JSON.parse(response)["task_id"].to_i

  end


  def get_details

    begin
    response = RestClient::Request.new(
      :method => :get,
      :url => "https://api.deepomatic.com/v0.6/tasks/#{self.task_id}/",
      :headers => {
        'X-APP-ID' => '413134115772',
        'X-API-KEY' => 'a521ecad9baa4eadad13c82f56d0d9ff'
      }
    ).execute
    rescue RestClient::BadRequest => error
      errors.add(:base, message)
      throw(:abort) #helping it not crash if it fails to save
    end
    JSON.parse(response)
  end
end
