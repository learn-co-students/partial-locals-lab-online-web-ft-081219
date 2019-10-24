# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null


class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  @@search_result = []
  def self.search(arg)
    array = Student.all.map do |s|
      s if s.name.include?(arg.capitalize)

    end
    
    array.delete_if{|s| s == nil}
    @@search_result = array
    
  end

  def self.search_result
    @@search_result
  end
  
end
