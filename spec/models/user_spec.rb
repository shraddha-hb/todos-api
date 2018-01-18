require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # Association test
  # ensure User model has a 1:m relationship with the Todo model
  it { should have_many(:todos) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }



  context 'validation tests' do
    # let (:user) {build(:user)} #same as User.new does not save untill user.save
    # let (:user {build(:randome_user)}) #will use randome_user factory to generate randome users
    let (:user) { build(:randome_user,name: 'Shraddha',email: "shraddha@gmail.com",password: "password1")} # can pass extra parameter as well
    it 'ensure first name is present' do
      # let (:user) {create(:user)} #User.create
  		# user = User.new(:name => 'Shraddha',:email => 'abc@gmail.com').save
      user.name = nil
  		expect(user.save).to eq(false)
  	end
  	
  	it 'ensure email name is present' do
  		# user = User.new(:last_name => 'Shraddha',:password => "password1").save
      user.email = nil
  		expect(user.save).to eq(false)
  	end
  	it 'ensure user get validated' do
  		# user = User.new(:name => 'Shraddha',:email => 'abc@gmail.com',:password => "password1").save
  		expect(user.save).to eq(true)
  	end
  end

  context 'scope tests' do
  	# let (:params) { {:name => 'First', last_name => 'Last',:email => 'abc@gmail.com',:password => "password"} }

  	# before(:each) do 
  	# 	User.new(params).save
  	# 	User.new(params).save
  	# 	User.new(params.merge(:active => true)).save
  	# 	User.new(params.merge(:active => false)).save
  	# 	User.new(params.merge(:active => false)).save
  	# 	User.new(params.merge(:active => false)).save
  	# end

    let(:users) {create_list(:randome_user,6)}
    before(:each) do
      users.last(3).map {|u| u.update(:active => false)} 
    end
  	it 'should retuen all active users' do
  		expect(User.active_user.size).to eq(3)
  	end

  	it 'should retuen all in-active users' do
  		expect(User.inactive_user.size).to eq(3)
  	end
  end 

end
