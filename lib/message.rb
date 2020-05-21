class Message
  def initialize(data)
    @data = data
  end

  def to_s
    "Today's Country Of The Day is #{name}. The capital is #{capital}. #{
      name
    } has a population of #{population} people, who live in a total area of #{
      area
    } square kilometers"
  end

  private

  attr_reader :data

  def name
    @name ||= data.dig(:data, :attributes, :name)
  end

  def capital
    @capital ||=
      raw_capital = data.dig(:data, :attributes, :geography, :capital)
    raw_capital.split(';').first
  end

  def population
    @population ||= data.dig(:data, :attributes, :population)
  end

  def area
    @area ||= data.dig(:data, :attributes, :geography, :area)
  end
end
