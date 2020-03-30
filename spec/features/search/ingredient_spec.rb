require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'I can search ingredients' do
		it 'And recieve dishes with the ingredient in it' do

			visit '/'

			fill_in :search_form, with: 'sweet potatoes'

			click_on "search"

			expect(current_path).to eq(foods_path)

			expect(page).to have_content("32,696 results")

			within(first(".food")) do
				expect(page).to have_css(".GTIN/UPC code")
				expect(page).to have_css(".description")
				expect(page).to have_css(".Brand Owner")
				expect(page).to have_css(".ingredients")
			end
		end
	end
end
