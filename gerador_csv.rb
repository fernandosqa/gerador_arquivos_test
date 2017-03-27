# encoding: UTF-8

require "csv"
require "faker"
require "documentos_br"

$lines = 5
$count = 0

cad_filename = '20170106_CAD_1.csv'
cred_filename = '20170106_CRED_1.csv'
temp_cad_filename = 'temp_cad.csv'
temp_cred_filename = 'temp_cred.csv'

gender = ["M","F"]
birth_day_date = "1980-12-31"
address = "AVENIDA PAULISTA"
district = "CENTRO"
city = "SAO PAULO"
state = "SP"
postal_code = "06555100"

cpf_list = []


CSV.open(temp_cad_filename, "wb") do |csv|
    while $count < $lines  do
        cpf_user = DocumentosBr.cpf
        cpf_list.push($documento)
        user_name = "#{Faker::Name.first_name} #{Faker::Name.first_name} #{Faker::Name.last_name}"       
        csv << ["CAD",cpf_user,"F",nil,user_name.upcase,gender.sample,birth_day_date,address,nil,nil,district,city,state,postal_code,nil,nil,nil,nil]
        $count +=1
    end
end

CSV.open(temp_cred_filename, "wb") do |csv|
    cpf_list.each do |cpf_user|
       csv << ["CRED",Faker::Number.number(10),cpf_user,nil,0,"2016-11-12","00:00:00",nil,nil,"R$ 100,00"]
    end
end

temp_file_cad = CSV.read(temp_cad_filename)

CSV.open(cad_filename, 'w', col_sep: '|') do |csv|
  temp_file_cad.each do |row|
    csv << row
  end
end

temp_cred_file = CSV.read(temp_cred_filename)

CSV.open(cred_filename, 'w', col_sep: '|') do |csv|
  temp_cred_file.each do |row|
    csv << row
  end
end
