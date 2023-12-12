require_relative 'fake_data_generator'

data_type = ARGV[0]
quantity = (ARGV[1] || 1).to_i
fake = FakeDataGenerator.new
if data_type
  fake.generate_fake_data(data_type, quantity)
else
  puts "Usage: ruby fake.rb <data_type> <quantity>#{fake.docs_url}"
end
