require 'rails_helper'

describe PhoneFormatterService do
  describe ".class methods" do
    describe ".format(number)" do
      context "with a valid number input (10 digits and no country code)"
        it 'returns a number with hyphens formatted as +1XXXXXXXXXX' do
          phone_input = '205-555-5555'
          formatted = PhoneFormatterService.format_number(phone_input)
          expect(formatted).to eq '+12055555555'
        end

        it 'returns a number with periods formatted as +1XXXXXXXXXX' do
          phone_input = '205.555.5555'
          formatted = PhoneFormatterService.format_number(phone_input)
          expect(formatted).to eq '+12055555555'
        end

        it 'returns a number formatted as +1XXXXXXXXXX' do
          phone_input = '2055555555'
          formatted = PhoneFormatterService.format_number(phone_input)
          expect(formatted).to eq '+12055555555'
        end

      context "with an invalid number" do
        it 'returns an error' do
          phone_input = '1235'
          actual = PhoneFormatterService.format_number(phone_input)
          expected = 'Error. Number is not in the correct format. xxx-xxx-xxxx'
          expect(actual).to eq expected
        end
      end
    end
  end
end
