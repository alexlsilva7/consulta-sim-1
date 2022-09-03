class Consulta < ApplicationRecord
  belongs_to :medico
  belongs_to :paciente

  validate :data_consulta_futuro
  validate :horarios_validos

  def data_consulta_futuro
    if data.present? && data < Date.today
      errors.add(:data, "nao pode ser no passado")
    end
  end

  def horarios_validos
    if %w[08:00 09:00 10:00 11:00 14:00 15:00 16:00 17:00].exclude? horario
      errors.add(:horario, "horario invalido")
    end
  end
end
