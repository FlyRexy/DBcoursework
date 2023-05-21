class DataController < ApplicationController
  def shops
    uri = URI('https://randommer.io/api/Misc/Random-Address?number=250&culture=ru')
    request = Net::HTTP::Get.new(uri)
    request['X-Api-Key'] = '12646c5f1a1e4713a87da9ebc442b43b'

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
    resp = JSON.parse(response.body)
    250.times do |index|
      address = resp[index].split(', ')
      @all_info = [address[0]+', '+address[1], address[4], (rand(401).to_f / 100 + 1).round(2), "+7(9#{rand(90)+10})-#{rand(900)+100}-#{rand(90)+10}-#{rand(90)+10}"]
      sql_query = "INSERT INTO shops (address, city, rating, phone_number) VALUES ('#{@all_info[0]}', '#{@all_info[1]}', #{@all_info[2]}, '#{@all_info[3]}')"
      ActiveRecord::Base.connection.execute(sql_query)
    end
  end

  def clients
    Faker::Config.locale = :ru
    flag = 1
    statuses = %w[Платина Золото Серебро]
    6000.times do
      case flag
        when 1
          first_name = Faker::Name.male_first_name
          last_name = Faker::Name.male_last_name
          patronymic = Faker::Name.male_middle_name
          flag = 0
        when 0
          first_name = Faker::Name.female_first_name
          last_name = Faker::Name.female_last_name
          patronymic = Faker::Name.female_middle_name
          flag = 1
      end
      @all_info = {full_name: "#{last_name} #{first_name} #{patronymic}", email: "#{Faker::Lorem.characters(number: rand(5..15))}@yahoo.com",
                   phone_number: "+7(9#{rand(90)+10})-#{rand(900)+100}-#{rand(90)+10}-#{rand(90)+10}",
                   date_of_birth: Faker::Date.between(from: 53.years.ago, to: 18.years.ago), status: statuses[rand(3)]}
      sql_query = "INSERT INTO clients (full_name, email, phone_number, date_of_birth, status) VALUES('#{@all_info[:full_name]}'
      , '#{@all_info[:email]}', '#{@all_info[:phone_number]}', '#{@all_info[:date_of_birth].year}-#{@all_info[:date_of_birth].month}-#{@all_info[:date_of_birth].day}', '#{@all_info[:status]}')"
      ActiveRecord::Base.connection.execute(sql_query)
    end
  end

  def employees
    flag = 1
    500.times do
      case flag
      when 1
        first_name = Faker::Name.male_first_name
        last_name = Faker::Name.male_last_name
        patronymic = Faker::Name.male_middle_name
        flag = 0
      when 0
        first_name = Faker::Name.female_first_name
        last_name = Faker::Name.female_last_name
        patronymic = Faker::Name.female_middle_name
        flag = 1
      end
      @all_info = {full_name: "#{last_name} #{first_name} #{patronymic}",email: "#{Faker::Lorem.characters(number: rand(5..15))}@mail.ru",
                   phone_number: "+7(9#{rand(90)+10})-#{rand(900)+100}-#{rand(90)+10}-#{rand(90)+10}",
                   date_of_birth: Faker::Date.between(from: 33.years.ago, to: 18.years.ago), salary: (rand(76)+25)*1000,
                   shop_id: rand(252)+1}
      sql_query = "INSERT INTO employees (full_name, email, phone_number, date_of_birth, salary, shop_id) VALUES
                   ('#{@all_info[:full_name]}'
      , '#{@all_info[:email]}', '#{@all_info[:phone_number]}', '#{@all_info[:date_of_birth].year}-#{@all_info[:date_of_birth].month}-#{@all_info[:date_of_birth].day}',
      #{@all_info[:salary]}, #{@all_info[:shop_id]})"
      ActiveRecord::Base.connection.execute(sql_query)
    end
  end

  def purchases
    3000000.times do
      if rand(5) > 0
        @all_info = {client_id: 'null', employee_id: rand(1001)+1, date: Faker::Date.between(from: 7.years.ago, to: Date.today),
                     total_cost: (rand(40)+1)*100}
      else
        @all_info = {client_id: rand(55178)+1, employee_id: rand(1001)+1, date: Faker::Date.between(from: 7.years.ago, to: Date.today),
                     total_cost: (rand(40)+1)*100}
      end
      sql_query = "INSERT INTO purchases (client_id, employee_id, date, total_cost) VALUES (
                   #{@all_info[:client_id]}, #{@all_info[:employee_id]}, '#{@all_info[:date].year}-#{@all_info[:date].month}-#{@all_info[:date].day}',
                    #{@all_info[:total_cost]})"
    end
  end

  def cakes
  end

  def purchase_details
  end

  def reviews
  end
end
