require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.create(name: 'Emmanuel', email: 'balix@gmail.com', password: '123456')
    @group = Group.create(name: 'health', icon: 'hospital.png', user: @user)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should have valid value' do
    expect(subject.name).to eql 'health'
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'should have an icon present' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end