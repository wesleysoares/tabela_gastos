require 'rails_helper'

RSpec.describe Receipt do
  it { is_expected.to validate_presence_of(:date) }
  it {is_expected.to validate_presence_of(:description) }
  it {is_expected.to validate_presence_of(:value) }
end
