require "test_helper"

class ConsultaTest < ActiveSupport::TestCase
  test "deve salvar consulta corretamente" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555-555')
    paciente = Paciente.new(nome: 'Paciente Teste', data_nascimento: '10-10-1980', cpf: '123797525352', email: 'pacienteteste@gmail.com')
    paciente.endereco = endereco

    assert paciente.save

    medico = Medico.new nome: 'Rodrigo Andrade', cpf: '706.508.980-01', email: 'rodrigo@rodrigo.com',
                        especialidade: 'Reumatologista', crm: '123456'
    assert medico.save

    consulta = Consulta.new(data: '10-10-2022', horario: '10:00', medico_id: medico.id, paciente_id: paciente.id)
    assert consulta.save()
  end

  test "Nao deve salvar uma consulta sem paciente" do

    medico = Medico.new nome: 'Rodrigo Andrade', cpf: '706.508.980-01', email: 'rodrigo@rodrigo.com',
                        especialidade: 'Reumatologista', crm: '123456'
    assert medico.save

    consulta = Consulta.new(data: '10-10-2022', horario: '10:00', medico_id: medico.id)
    assert_not consulta.save()

  end
end
