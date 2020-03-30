require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'I can search ingredients' do
		it 'And recieve dishes with the ingredient in it' do

			visit '/'

			select 'sweet potatoes', from: :ingredients

			click_on "search"

			expect(current_path).to eq(search_path)

			expect(page).to have_content("7 results")
			expect(page).to have_css(".food", count: 7)

			within(first(".food")) do
				expect(page).to have_css(".GTIN/UPC code")
				expect(page).to have_css(".description")
				expect(page).to have_css(".Brand Owner")
				expect(page).to have_css(".ingredients")
			end
		end
	end
end
