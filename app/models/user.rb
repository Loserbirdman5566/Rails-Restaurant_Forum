class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def admin?
    self.role == "admin"
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
