# Patient
# - name (String)
# - cured (Boolean)

class Patient
  attr_reader :name, :blood_type
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @blood_type = attributes[:blood_type]
    # if attributes[:cured] != nil
    #   @cured = attributes[:cured]
    # else
    #   @cured = false
    # end
    # @cured = (attributes[:cured] != nil) ? attributes[:cured] : false

    # @cured takes attributes[:cured] value, or false if it doesn't exist
    @cured = attributes[:cured] || false
    @room = attributes[:room]
  end

  def cure
    @cured = true
  end

  # customized cured? attr_reader
  def cured?
    @cured
  end


end

