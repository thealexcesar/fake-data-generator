require 'faker'
require 'clipboard'

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
    if generator_method == 'valid'
      quantity.times { data << Faker::IDNumber.valid }
    elsif generator_method == 'email'
      quantity.times { data << Faker::Internet.email }
    elsif generator_method == 'phone_number'
      data << "#{Faker::Number.number(digits: 2)}99#{Faker::Number.number(digits: 7)}"
    elsif generator_method == 'pf'
      quantity.times { data << Faker::IDNumber.brazilian_citizen_number }
    elsif generator_method == 'pj'
      quantity.times { data << Faker::Company.brazilian_company_number }
    else
      quantity.times { data << Faker::Lorem.send(generator_method) }
    end
    display_data(data)
  else
    puts 'Invalid data type specified.'
    puts "Valid types: #{types.join(', ')}.\nVisit Documentation: https://github.com/thealexcesar/fake"
  end
end

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

data_type = ARGV[0]
quantity = (ARGV[1] || 1).to_i

if data_type
  generate_fake_data(data_type, quantity)
else
  puts 'Usage: ruby fake.rb <data_type> <quantity>'
end
