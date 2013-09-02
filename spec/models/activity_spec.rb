require 'spec_helper'

describe Activity do
	before { @activity = Activity.new( name: "Example Activity", category: "chore", points: 4 ) }

	subject { @activity }

	it { should respond_to(:name) }
	it { should respond_to(:category) }
	it { should respond_to(:points) }

	it { should be_valid }

	describe "when name is empty" do
		before { @activity.name = " "}
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @activity.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			activity_with_same_name = @activity.dup
			activity_with_same_name.name = @activity.name.upcase
			activity_with_same_name.save
		end

		it { should_not be_valid }
	end

	describe "when points is empty" do
		before { @activity.points = " "}
		it { should_not be_valid }
	end

	describe "when points is not number" do
		before { @activity.points = "a"}
		it { should_not be_valid }
	end

	describe "when points is not positive number" do
		before { @activity.points = -5 }
		it { should_not be_valid }
	end

	describe "when points is not number in range 0-100" do
		before { @activity.points = 101}
		it { should_not be_valid }
	end

	describe "when category is empty" do
		before { @activity.category = " "}
		it { should_not be_valid }
	end
end
