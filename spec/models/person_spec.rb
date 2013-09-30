require 'spec_helper'

describe Person do

	before do
		@person = Person.new(name: "Sue Chew", password: "blowfish", password_confirmation: "blowfish")
	end

	subject { @person }

	it { should respond_to(:name) }
	it { should respond_to(:password) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }

	describe "when person's name is empty" do
		before { @person.name = " "}
		it { should_not be_valid }
	end

	describe "when person's name is too long" do
		before { @person.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			person_with_same_name = @person.dup
			person_with_same_name.name = @person.name.upcase
			person_with_same_name.save
		end

		it { should_not be_valid }
	end

	describe "when password does not match confirmation" do
		before { @person.password_confirmation = "bluefish" }
		it { should_not be_valid }
	end
	
	describe "when password or password confirmation is blank" do
		before { @person.password = @person.password_confirmation = " " }
		it { should_not be_valid }
	end

	describe "when password_confirmation is nil" do
		before { @person.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @person.password = @person.password_confirmation = "1234567" }
		it { should_not be_valid }
	end


	it { should be_valid }

end
