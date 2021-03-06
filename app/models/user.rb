class User < ActiveRecord::Base
  acts_as_messageable
  acts_as_votable
  acts_as_voter

  has_and_belongs_to_many :universities
  accepts_nested_attributes_for :universities

  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :skills

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :description, :city, :country, :name, :image, :university_name, :birthdate, :sex, :looking_for, :moreskills, :website, :recent_projects
  attr_accessible :university_ids, :skill_ids

  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "60x60#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

#  attr_accessor :university_name

  has_many :posts

  def university_name
    university.name if university
  end

  def university_name(name)
    self.university = University.find_or_create_by_name(name) unless name.blank?
  end

  def skill_name
    skill.name if skill
  end

  def skill_name(name)
    self.skill = Skill.find_or_create_by_name(name) unless name.blank?
  end

  #Returning any kind of identification you want for the model
  def name
    #return "You should add method :name in your Messageable model"
    read_attribute(:name)
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    #return "define_email@on_your.model"
    email
    #if false
    #return nil
  end

  before_destroy :delete_likes
  def delete_likes
    self.likes.delete_all
  end

end
