class Event < ActiveRecord::Base
  validates_presence_of :start, :end, :title
end
