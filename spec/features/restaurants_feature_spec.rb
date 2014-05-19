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
	end
end