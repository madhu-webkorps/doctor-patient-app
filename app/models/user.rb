class User < ApplicationRecord
  # after_initialize :set_default_role, :if => :new_record?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enum role: [:admin, :patient, :doctor]
  has_many :user_roles
  has_many :roles, through: :user_roles
 
end
