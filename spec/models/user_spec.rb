require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @user = User.create(name: 'Emmanuel', email: 'balix@gmail.com', password: '123456')
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should have a correct value' do
    expect(subject.name).to eql 'Emmanuel'
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'email should have a correct value' do
    expect(subject.email).to eql 'balix@gmail.com'
  end
end
