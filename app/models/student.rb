class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_validation :new_student
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

 def new_student   
   if !state.nil?
      if name.length < 3 or name.length > 25
        errors.add(:name,"no debe contener menos de 3 y mas de 25 carácteres")
      end
      if lastname.length < 3 or lastname.length > 25
        errors.add(:lastname,"no debe contener menos de 3 y mas de 25 carácteres")
      end
      if university.length < 3 or university.length > 35
        errors.add(:university,"no debe contener menos de 3 y mas de 35 carácteres")
      end
      if year.nil?
        errors.add(:year,"no debe ser vacio")
      elsif (year < 1)
        errors.add(:year,"no debe ser menor a 1")
      end
      if phono.length < 9 or phono.length > 12
        errors.add(:phono,"no debe contener menos de 9 y mas de 12 números")
      end
      if commune.empty?
        errors.add(:commune,"no debe estar vacio.")
      end
      if region.empty?
        errors.add(:region,"no debe estar vacio.")
      end
   end 
 end  

end  
