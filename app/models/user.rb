class User < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many :user_weights, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy
  has_secure_password

  before_save :downcase_email, :capitalize_first_name, :capitalize_last_name


	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :first_name, presence: true, length: {minimum: 3, maximum: 25}
	validates :last_name, presence: true, length: {minimum: 2, maximum: 25}
	validates :email, presence: true, length: {maximum: 105},
										uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: {minimum: 6, maximum: 10}

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
           BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attributes(:remember_digest, User.digest(remember_token))
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def capitalize_first_name
  	self.first_name = first_name.capitalize
  end

  def capitalize_last_name
  	self.last_name = last_name.capitalize
  end

end
