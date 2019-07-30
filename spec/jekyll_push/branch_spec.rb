# frozen_string_literal: true

describe JekyllPush::Branch do
  before(:each) { Test.reset }
  let(:target) { 'test_branch' }
  let(:local_branch) do
    ENV['CI'] = nil
    JekyllPush::Branch.new target
  end

  describe '#new' do
    context 'when given an arbitrary branch name' do
      it 'initializes a JekyllPush::Site' do
        expect(local_branch).to be_a JekyllPush::Branch
      end
    end
  end

  describe '#on_travis?' do
    context 'for a local branch' do
      it 'is false' do
        expect(local_branch.on_travis?).to be false
      end
    end
  end

  describe '#local?' do
    context 'for a local branch' do
      it 'is true' do
        expect(local_branch.local?).to be true
      end
    end
  end

  describe '#git_commands' do
    it 'returns an array of commands' do
      expect(local_branch.git_commands).to be_an(Array)
    end
  end
end
