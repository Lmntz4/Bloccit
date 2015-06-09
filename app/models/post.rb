class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :summary
  belongs_to :user
  belongs_to :topic

  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true
  
  before_save :populate_summary
  
  def up_votes
    votes.where(value: 1).count
  end
  
  def down_votes
    votes.where(value: -1).count
  end
  
  def points
    votes.sum(:value)
  end
  
  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end
  
  def create_vote
    user.votes.create(value: 1, post: self)
  end

  private 
  
  def populate_summary
    if summary.nil? and @body.present?
      summary = Summary.create(text: @body.slice(0,50))
    end
  end

end
