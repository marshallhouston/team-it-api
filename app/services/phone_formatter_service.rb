class PhoneFormatterService

  def self.format_number(number)
    phone_number = Phony.normalize(number)
    if phone_number.length == 10
      '+1'.concat(phone_number)
    else
      'Error. Number is not in the correct format. xxx-xxx-xxxx'
    end
  end
end
