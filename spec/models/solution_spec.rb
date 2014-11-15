require 'rails_helper'

RSpec.describe Solution, :type => :model do
  let(:path) { Rails.root.join('spec', 'fixtures', 'CD_sample.cpp')}
  let(:solution) { Solution.new(source_code: File.open(path)) }

  it { expect belong_to(:user) }
  it { expect belong_to(:problem) }
  it { expect validate_presence_of([ :user, :problem, :explanation, :source_code ]) }

  describe "#highlight_lang" do
    it "gets the right language for highlighting" do
      expect(solution.highlight_lang).to eql('c')
    end
  end

  describe "#source_code_content" do
    it "gets the content of the source code file" do
      allow(solution).to receive(:source_code_url) { path }
      expect(solution.source_code_content).to eql(File.read(path))
    end
  end
end
