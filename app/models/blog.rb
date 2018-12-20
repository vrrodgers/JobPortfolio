class Blog < ApplicationRecord
    enum status: {draft: 0, published: 1}
    extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  belongs_to :topic
  has_many :comments, dependent: :destroy

   acts_as_taggable
   rails_admin do 
    field :title
    field :body, :simplemde
    field :created_at
    field :updated_at
    field :slug
    field :status
    field :topic_id
   end
  def self.feature_blogs
    limit(2)
  end

  def self.recent
    order(" created_at DESC")
  end
  scope :latest, -> { order("Id DESC") }
  def topic_name
    topic.try(:title)
  end

  def topic_name=(name)
    self.topic = Topic.find_or_create_by(title: name) if title.present?
  end
  
  def blog_status
    if logged_in?(:user) || !current_user
      @status = published
    else
      @status = all
    end
  end
end
