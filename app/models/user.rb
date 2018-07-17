class User < ApplicationRecord
  before_save {
    email.downcase!
  }

  validates :name,
            presence: true,
            length: {
      maximum: 30
            }

  VALID_EMAIL_REGIX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            length: {
      maximum: 255
            },
            format: {
                with: VALID_EMAIL_REGIX
            },
            uniqueness: true

  has_secure_password
  validetes :password_digest,
            presence: ture,
            length: {
                minimum: 6
            }
end
