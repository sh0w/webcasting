class User < ActiveRecord::Base
  acts_as_messageable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :description, :city, :country, :name, :image, :university_name

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "60x60#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

#  attr_accessor :university_name

  has_many :posts

  def university_name
    university.name if university
  end

  def university_name(name)
    self.university = University.find_or_create_by_name(name) unless name.blank?
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return nil
    #if false
    #return nil
  end
end
