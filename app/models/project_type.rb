class ProjectType < ApplicationRecord
    has_many :projects

    scope :type_project, -> { where(name: 'project').last}
 
end
