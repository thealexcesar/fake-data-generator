require 'faker'
require 'clipboard'

class FakeDataGenerator
  attr_reader :docs_url
  # -------------------------------------------------------------------------------------
  def initialize
    @docs_url = "\n\nSee Documentation: https://github.com/thealexcesar/fake"
  end
  # -------------------------------------------------------------------------------------
  def generate_fake_data(type, quantity)
    data = []

    type = type.downcase

    types = {
      'p' => 'paragraph',
      'w' => 'word',
      'm' => 'email',
      'n' => 'name',
      'ph' => 'phone_number',
      'id' => 'valid',
      'pf' => 'cpf',
      'pj' => 'cnpj'
    }

    if types.key?(type)
      generator_method = types[type]
      case generator_method
      when 'valid'
        quantity.times { data << Faker::IDNumber.valid }
      when 'email'
        quantity.times { data << Faker::Internet.email }
      when 'phone_number'
        data << "#{Faker::Number.number(digits: 2)}99#{Faker::Number.number(digits: 7)}"
      when 'pf'
        quantity.times { data << Faker::IDNumber.brazilian_citizen_number }
      when 'pj'
        quantity.times { data << Faker::Company.brazilian_company_number }
      when 'name'
        quantity.times { data << Faker::Name.name }
      when 'paragraph'
        quantity.times { data << Faker::Lorem.paragraph }
      when 'word'
        quantity.times { data << Faker::Lorem.word }
      else
        display_invalid_type_message(types)
        return
      end

      display_data(data)
    else
      display_invalid_type_message(types)
    end
  end

  private
  # -------------------------------------------------------------------------------------
  def display_data(data)
    if data.empty?
      puts 'No data generated.'
      return
    end

    max_length = data.max_by(&:length).length
    horizontal_line = "+#{'-' * (max_length + 2)}+"

    puts horizontal_line
    data.each do |item|
      puts "| #{item.center(max_length)} |"
    end
    puts horizontal_line

    formatted_text = data.join("")

    Clipboard.copy(formatted_text)
    puts "#{data.length} items of fake data have been generated"
  end
  # -------------------------------------------------------------------------------------
  def display_invalid_type_message(types)
    valid_types = types.keys.join(', ')
    puts "Invalid data type specified.\nValid types: #{valid_types}.#{@docs_url}"
  end
end
