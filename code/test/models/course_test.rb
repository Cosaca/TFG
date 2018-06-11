require 'test_helper'
require 'rails_helper'

class CourseTest < ActiveSupport::TestCase
  RSpec.describe Course, :type => :model do
    it "is valid with valid attributes"
    it "is not valid without a title"
    it "is not valid without a description"
    it "is not valid without a start_date"
    it "is not valid without a end_date"
  end
end
