class User < ApplicationRecord
    has_secure_password
    # has_signed_id
    validates :email, presence: true, format: { with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must be a valid email address" }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }

   def generate_password_reset_token!
    self.reset_password_token = SecureRandom.urlsafe_base64
    self.reset_password_sent_at = Time.current
    save!
  end

    def password_reset_token_valid?
    (reset_password_sent_at + 15.minutes) > Time.current
  end

  # Invalidate the token after use
  def invalidate_password_reset_token!
    update(reset_password_token: nil, reset_password_sent_at: nil)
  end





end
