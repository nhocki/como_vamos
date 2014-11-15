require 'rails_helper'

RSpec.describe Solution, :type => :model do
  it { expect belong_to(:user) }
  it { expect belong_to(:problem) }
  it { expect validate_presence_of([ :user, :problem, :explanation, :source_code ]) }

  describe "#highlight_lang" do
    let(:path) { Rails.root.join('spec', 'fixtures', 'CD_sample.cpp')}
    let(:solution) { Solution.new(source_code: File.open(path)) }

    it "gets the right language for highlighting" do
      expect(solution.highlight_lang).to eql('c')
    end
  end
end
