require 'users_helper'

class User < ActiveRecord::Base
  belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id'
  has_many :referrals, class_name: 'User', foreign_key: 'referrer_id'

  validates :email, presence: true, uniqueness: true, format: {
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    message: 'Invalid email format.'
  }
  validates :referral_code, uniqueness: true

  before_create :create_referral_code
  after_create :send_welcome_email, :upload_to_sendgrid

  REFERRAL_STEPS = [
    {
      'count' => 5,
      'html' => 'Shave<br>Cream',
      'class' => 'two',
      'image' =>  'refer/cream-tooltip@2x.png'
    },
    {
      'count' => 10,
      'html' => 'Truman Handle<br>w/ Blade',
      'class' => 'three',
      'image' => 'refer/truman@2x.png'
    },
    {
      'count' => 25,
      'html' => 'Winston<br>Shave Set',
      'class' => 'four',
      'image' => 'refer/winston@2x.png'
    },
    {
      'count' => 50,
      'html' => 'One Year<br>Free Blades',
      'class' => 'five',
      'image' => 'refer/blade-explain@2x.png'
    }
  ]

  private

  def create_referral_code
    self.referral_code = UsersHelper.unused_referral_code
  end

  def upload_to_sendgrid
    headers = {'Authorization' => "Bearer #{ENV['SENDGRID_API_KEY']}"}
    data = {:email => self.email}
    response = RestClient.post 'https://api.sendgrid.com/v3/contactdb/recipients', [data].to_json, headers
    if response.code == 201
      self.uploaded_sendgrid = true
      self.save
    end
  end

  def send_welcome_email
    UserMailer.delay.signup_email(self)
  end
end
