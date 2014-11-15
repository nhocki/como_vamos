require 'rails_helper'

RSpec.describe User, :type => :model do
  it { expect have_many(:problems) }
  it { expect have_many(:solutions) }

  describe "validations" do
    it { expect validate_uniqueness_of([ :username, :email, :provider_uid ]) }
    it { expect validate_presence_of([ :username, :name, :provider, :email, :provider_uid ]) }
  end

  it "changes the slug when the username changes" do
    user = create(:user, username: "foo")
    user.username = "bar"
    expect { user.save }.to change(user, :slug).from("foo").to("bar")
  end

  describe ".from_omniauth" do
    let(:omniauth_hash) do
      {
        provider: "github",
        uid: "123",
        info: {
          nickname: "nhocki",
          email: "nhocki@gmail.com",
          name: "Nicolás Hock Isaza",
          image: "https://avatars.githubusercontent.com/u/17035?v=2",
        }.stringify_keys
      }.stringify_keys
    end

    it "creates a user if it doesn't exist already" do
      expect {
        User.from_omniauth(omniauth_hash)
      }.to change(User, :count).from(0).to(1)
    end

    it "finds the user with the same provider and uid" do
      user = create(:user, provider: 'github', provider_uid: '123')
      expect(User.from_omniauth(omniauth_hash)).to eql(user)
    end
  end
end
