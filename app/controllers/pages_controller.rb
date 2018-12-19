class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills =Skill.all
    @contact = Contact.new
    @project = Project.where(project_type: 1)

  end

  def contact
  end
  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
