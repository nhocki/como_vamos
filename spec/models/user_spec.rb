require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do
    it { expect validate_uniqueness_of([ :username, :email, :provider_uid ]) }
    it { expect validate_presence_of([ :username, :name, :provider, :email, :provider_uid ]) }
  end
end
