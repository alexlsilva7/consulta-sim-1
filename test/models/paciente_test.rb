require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "deve salvar paciente corretamente" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555-555')
    paciente = Paciente.new(nome: 'Paciente Teste', data_nascimento: '10-10-1980', cpf: '123797525352', email: 'pacienteteste@gmail.com')
    paciente.endereco = endereco

    assert paciente.save
  end

  test "não deve salvar Paciente com campo data_nascimeto vazio" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555-555')
    paciente = Paciente.new(nome: 'Paciente Teste', data_nascimento: '', cpf: '123797525352', email: 'pacienteteste@gmail.com')
    paciente.endereco = endereco

    assert_not paciente.save
  end
end
