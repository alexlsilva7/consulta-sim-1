Given('o medico com nome {string}, cpf {string}, email {string}, especialidade {string} e crm {string} existe') do |nome, cpf, email, especialidade, crm|
  visit '/medicos/new'
  fill_in 'medico[nome]', :with => nome
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[especialidade]', :with => especialidade
  fill_in 'medico[crm]', :with => crm
  click_button 'Create Medico'
  visit '/medicos'
end

Given('estou na pagina de criar uma nova consulta') do
  visit "/consultas/new"
end

When('When eu preencho os campos de data {string}, horario {string}, medico {string} e paciente {string}') do |data, horario, medico, paciente|
  fill_in 'consulta[data]', :with => data
  # select 'consulta[horario]', :from => horario
  find_by_id("consulta_horario").find("option[value='#{horario}']").click
  select medico, from: "consulta_medico_id"
  select paciente, from: "consulta_paciente_id"
  # find_by_id("consulta_medico_id").find("option[value='#{medico}']").click
  # find_by_id("consulta_paciente_id").find("option[value='#{paciente}']").click

end

When('clico em criar consulta') do
  click_button 'Create Consulta'
end

Then('eu vejo uma mensagem que a consulta foi criada com sucesso') do
  page.has_content?('Consulta was successfully created.')
end

Then('eu vejo uma mensagem de que a data é requerida') do
  page.has_content?("Data can't be blank")
end
