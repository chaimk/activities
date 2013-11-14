require 'spec_helper'

describe "Authentication" do
	subject { page }

	describe "signin page" do
		before { visit signin_path }
		it { should have_selector('h1', text: 'Sign in') }
		it { should have_selector('title', text: 'Sign in') }
	end

	describe "signin" do
		before { visit signin_path }
		
		describe "with invalid information" do
			before { click_button "Sign in" }
			it { should have_selector('title', text: 'Sign in') }
			it { should have_selector('div.alert.alert-error', text: 'Invalid') }
		end

		describe "with valid information" do
			let(:person) { FactoryGirl.create(:person) }
			before do
				fill_in "Name",    with: person.name
				fill_in "Password", with: person.password
				click_button "Sign in"
			end
			it { should have_selector('title', text: person.name) }
			it { should have_link('Profile', href: person_path(person)) }
			it { should have_link('Sign out', href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }

			describe "followed by signout" do
				before { click_link "Sign out" }
				it { should have_link("Sign in") }
			end
		end
	end

	describe "authorization" do
		
		describe "for non-signed-in users" do
			let(:person) { FactoryGirl.create(:person) }
			
			describe "in the People controller" do
				
				describe "visiting the edit page" do
					before { visit edit_person_path(person) }
					it { should have_selector('title', text: 'Sign in') }
				end

				describe "submitting to the update action" do
					before { put person_path(person) }
					specify { response.should redirect_to(signin_path) }
				end 
			end
		end 

		describe "as wrong user" do
			let(:person) { FactoryGirl.create(:person) }
			let(:wrong_person) { FactoryGirl.create(:person, name: "I am the wrong user!") }
			before { sign_in person }

			describe "visiting People#edit page" do
				before { visit edit_person_path(wrong_person) }
				it { should_not have_selector('title', text: full_title('Edit person')) }
			end
			
			describe "submitting a PUT request to the People#update action" do
				before { put person_path(wrong_person) }
				specify { response.should redirect_to(root_path) }
			end 
		end
	end

end
