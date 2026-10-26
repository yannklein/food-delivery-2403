# HOSPITAL APP
# 
# Patient
# - name (String)
# - cured (Booolean)
# 
# Room
# - capacity (Integer)
# - patients (Array of instances of Patient)

require_relative "app/models/patient"
require_relative "app/models/room"
require_relative "app/repositories/patient_repository"
require_relative "app/repositories/room_repository"

patients_csv_file_path = "data/patients.csv"
rooms_csv_file_path = "data/rooms.csv"

august = Patient.new(name: "August", cured: true)
tristan = Patient.new(blood_type: "A-", name: "Tristan")
angad = Patient.new(name: "Angad")

# p august
# p tristan
# p angad
# p angad.cured?
# angad.cure
# p angad.cured?
# p tristan.name

vip_room = Room.new(capacity: 2)
# p vip_room
# p vip_room.patients

vip_room.add(tristan)
vip_room.add(angad)
# p vip_room

# angad.room = vip_room
# p angad
# 
room_repo = RoomRepository.new(rooms_csv_file_path)
# p room_repo

patient_repo = PatientRepository.new(patients_csv_file_path, room_repo)

orlando = Patient.new(
  name: "Orlando",
  blood_type: "O-"
  )

patient_repo.create(orlando)

p patient_repo