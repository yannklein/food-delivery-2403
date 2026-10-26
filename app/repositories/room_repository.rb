class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms.find do |room|
      room.id == id
    end
    # returns an instance of room of this `id`
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # p attributes
      attributes[:id] = attributes[:id].to_i
      attributes[:capacity] = attributes[:capacity].to_i
      room = Room.new(attributes)
      @rooms << room
    end
  end
end