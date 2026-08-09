class DashboardController < ApplicationController
  def index
    @localities_count = Locality.count
    @schools_count = School.count
    @projects_count = Project.count
    @active_projects_count = Project.active.count
    @recent_projects = Project.includes(school: :locality).order(created_at: :desc).limit(5)
  end
end
