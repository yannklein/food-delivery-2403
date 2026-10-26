class Room
  attr_reader :patients
  attr_accessor :id

  class Fullroom < Exception
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity]
    @patients = []
  end

  def add(patient)
    if @patients.count >= @capacity
      fail Fullroom, "The room is full!"
    else
      @patients << patient
      # patient is angad (patient instance)
      # self is the vip_room instance
      patient.room = self
    end
  end
end