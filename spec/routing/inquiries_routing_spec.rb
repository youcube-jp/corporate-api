require 'rails_helper'

RSpec.describe InquiriesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/inquiries').to route_to 'inquiries#create'
    end
  end
end
