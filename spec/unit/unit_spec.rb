require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'Hello World')
    end
end

# Next, you need to write more tests on your own for new attributes – author (String), price (Number), and published date (Date). For each new attribute, you need to write a unit test and integration test. After you write all the tests, run these tests. Your tests should not pass at this moment because you haven’t started coding for these other attributes yet. Take a screenshot (2) of the results. You’ll need to put the screenshot into your report later.

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'Hello World', author: 'John Doe', price: 10, published: Date.today)
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a title' do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without an author' do
        subject.author = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
        subject.price = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a published date' do
        subject.published = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid with a non-date published date' do
        subject.published = 'abc'
        expect(subject).to_not be_valid
    end

    it 'is valid with a future published date' do
        subject.published = Date.tomorrow
        expect(subject).to be_valid
    end
end
