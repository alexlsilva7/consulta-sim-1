Feature: Marcar consulta
  As usuario
  I want to registrar uma consulta
  So that o usuario possa marcar com o paciente e o medico desejados


  Scenario: marcar uma consulta
    Given O paciente de nome: 'Paciente01', data_nascimeto: '04-01-1999', cpf: '12345679568', email: 'paciente01@gmail.com', cidade: 'Recife',logradouro: 'rua zero',complemento: 'casa',bairro: 'Boa Viagem',cep: '55555-555' existe
    And o medico com nome 'Emily Souza', cpf '014.945.910-65', email 'emily@gmail.com', especialidade 'Pediatra' e crm '12333' existe
    And estou na pagina de criar uma nova consulta
    When When eu preencho os campos de data '06/09/2022', horario '08:00', medico 'Emily Souza' e paciente 'Paciente01'
    And clico em criar consulta
    Then eu vejo uma mensagem que a consulta foi criada com sucesso

  Scenario: marcar uma consulta sem definir a data
    Given O paciente de nome: 'Paciente01', data_nascimeto: '04-01-1999', cpf: '12345679568', email: 'paciente01@gmail.com', cidade: 'Recife',logradouro: 'rua zero',complemento: 'casa',bairro: 'Boa Viagem',cep: '55555-555' existe
    And o medico com nome 'Emily Souza', cpf '014.945.910-65', email 'emily@gmail.com', especialidade 'Pediatra' e crm '12333' existe
    And estou na pagina de criar uma nova consulta
    When When eu preencho os campos de data '', horario '08:00', medico 'Emily Souza' e paciente 'Paciente01'
    And clico em criar consulta
    Then eu vejo uma mensagem de que a data é requerida