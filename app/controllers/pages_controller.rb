class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @project_type = ProjectType.type_project
    @skills =Skill.all
    @contact = Contact.new
    @project = Project.where(project_type: @project_type.id)
    @education = Education.all

  end

  def contact
  end
  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
