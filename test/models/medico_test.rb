require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'criando medico corretamente' do
    medico = Medico.new nome: 'Rodrigo Andrade', cpf: '706.508.980-01', email: 'rodrigo@rodrigo.com',
                        especialidade: 'Reumatologista', crm: '123456'
    assert medico.save
  end

  test "não deve salvar medico com campo CRM vazio" do
    medico = Medico.new(nome: 'Medico Teste', cpf: '11111111112', email: 'medico@gmail.com', especialidade: 'cardiologista', crm: '')
    assert_not medico.save
  end

  test "não deve salvar Paciente com campo cpf vazio" do
    medico = Medico.new(nome: 'Medico Teste', cpf: '', email: 'medico@gmail.com', especialidade: 'cardiologista', crm: '210637SP')
    assert_not medico.save
  end
end
