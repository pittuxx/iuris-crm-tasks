require 'spec_helper'

module Iuris::Tasks
	describe Task do
		it 'has a valid factory' do
			expect(FactoryGirl.build(:task, contact_id: 1)).to be_valid
		end

		it 'user_id is not nil' do
			task = FactoryGirl.create(:task, contact_id: 1)
			expect(task.user_id).to_not be_nil
			expect(task.user_id).to eq(1)
		end

		it 'should be raise error without user_id' do
			expect {FactoryGirl.create(:task, user_id: nil, contact_id: 1)}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it 'save task is valid' do
			FactoryGirl.create(:task, contact_id: 1)
			expect(Task.count).to eq(1)
		end
	end
end