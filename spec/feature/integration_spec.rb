require 'rails_helper'

# Create a new book through new_book_path
RSpec.describe 'Creating a book', type: :feature do
    scenario 'create a new book' do
        visit new_book_path
        fill_in 'Title', with: 'Hello World'
        fill_in 'Author', with: 'John Doe'
        fill_in 'Price', with: 10
        fill_in 'Published', with: Date.today
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('Hello World')
    end
end