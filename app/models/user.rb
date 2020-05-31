class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :email, presence: true, uniqueness: true
        validates :encrypted_password, presence: true, format: /\A[a-zA-Z0-9]+\z/
        validates :family_name, presence: true
        validates :first_name, presence: true
        validates :family_name_alphabet, presence: true, format:/\A[a-zA-Z]+\z/
        validates :first_name_alphabet, presence: true, format: /\A[a-zA-Z]+\z/
        validates :nickname, presence: true
        validates :birthday, presence: true
        
end
