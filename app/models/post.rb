class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  has_one :summary
  
  default_scope { order('created_at DESC') }
  
  before_save :populate_summary
  
  private 
  
  def populate_summary
    if summary.nil? and @body.present?
      summary = @body.slice(0,50)
    end
  end
end
