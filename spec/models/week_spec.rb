require 'rails_helper'

describe Week do
  it { should validate_presence_of :description }
  it { should validate_presence_of :timeframe }
  it { should belong_to :course }
end
