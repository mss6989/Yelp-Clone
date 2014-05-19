require 'spec_helper'

describe 'Restaurants index page' do
	context 'Day 1: No Restaurants to show on the page' do
		it 'should display a message if no restaurants' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants yet')
		end
	end
end

describe 'Creating a restaurant' do
	it 'adds a restaurant to the restaurant index' do
		visit '/restaurants/new'
		fill_in 'Name', with: 'McDonalds'
		fill_in 'Cuisine', with: 'Fast food'
		click_button 'Add'
		expect(current_path).to eq('/restaurants')
		expect(page).to have_content('McDonalds')
	end
end

describe 'Editing a restaurant' do
	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'Fast food')
	end
	it 'edits an existing restaurant in the restaurant index' do
		visit '/restaurants'
		expect(page).to have_content('McDonalds')
		click_on 'Edit'
		fill_in 'Name', with: 'Burger King'
		click_button 'Add'
		expect(page).to have_content('Burger King')
	end
end

describe 'Delete a restaurant' do
	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'Fast food')
	end
	it 'deletes an existing restaurant in the restaurant index' do
		visit '/restaurants'
		expect(page).to have_content('McDonalds')
		click_on 'Delete'
		expect(page).to_not have_content('McDonalds')
		expect(page).to have_content("Successfully deleted!")
	end
end