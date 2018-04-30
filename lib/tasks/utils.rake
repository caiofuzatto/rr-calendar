namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do

  puts "Gerando os contatos..."
  10.times do |i|
      Contact.create!(nome: Faker::Name.name,
                      email: Faker::Internet.email, 
                      kind: Kind.all.sample, 
                      rmk: Faker::Lorem.paragraph([1,2,3].sample))
  end
  puts "Gerando os contatos... [OK]"

  puts "Gerando os endereços..."
  Contact.all.each do |contact|
    Address.create!(street: Faker::Address.street_address,
                    city: Faker::Address.city,
                    state: Faker::Address.state_abbr,
                    contact: contact)
  end
  puts "Gerando os endereços... [OK]"

  puts "Gerando os telefones..."
  Contact.all.each do |contact|
    Random.rand(1..3).times do |i|
      Phone.create!(phone: Faker::PhoneNumber.phone_number,
                    contact: contact)
    end
  end
  puts "Gerando os telefones... [OK]"
  end

end
