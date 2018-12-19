class Skill < ApplicationRecord
    validates_presence_of :title, :persent_utilized
end
