require 'rails_helper'

RSpec.describe Review, type: :model do

  it {validate_presence_of(:name)}
  it {validate_presence_of(:email)}
  it {validate_presence_of(:content)}
  it {validate_presence_of(:score)}
  it {belong_to(:movie)}
end
