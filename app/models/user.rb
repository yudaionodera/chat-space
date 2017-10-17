class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         has_many :group_users
         has_many :groups, :through => :group_users
         has_and_belongs_to_many :groups

end
