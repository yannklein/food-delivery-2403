require "csv"

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def create(patient)
    # patient.id #=> nil
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id","name","blood_type","cured","room_id"]

      @patients.each do |patient|
        # patient is an instance of Patient
        csv << [patient.id, patient.name, patient.blood_type, patient.cured?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # p attributes
      # attributes => {id: "1", name: "Tristan", blood_type: "A-", "cured": "false", room_id: "1" }
      attributes[:id] = attributes[:id].to_i
      # attributes =>  {id: 1, name: "Tristan", blood_type: "A-", "cured": "false", room_id: "1" }
      attributes[:cured] = attributes[:cured] == "true"
      #  attributes => {id: 1, name: "Tristan", blood_type: "A-", "cured": false, room_id: "1" }
      attributes[:room] = @room_repository.find(attributes[:room_id].to_i)
      # {id: 1, name: "Tristan", blood_type: "A-", "cured": false, room: <Room 0x003240234>}
      patient = Patient.new(attributes)
      @patients << patient
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end