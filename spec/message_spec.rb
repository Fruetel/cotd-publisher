require 'message'
require 'oj'

RSpec.describe Message do
  data =
    Oj.load(
      '{"data":{"id":".et","type":"countries","attributes":{"name":"Ethiopia","geography":{"capital":"Addis Ababa","area":1104300},"population":108386391}}}',
      symbol_keys: true
    )

  subject(:message) { Message.new(data) }

  describe '#to_s' do
    it 'returns a text about the country' do
      expect(message.to_s).to eq(
        "Today's Country Of The Day is Ethiopia. The capital is Addis Ababa. Ethiopia has a population of 108,386,391 people, who live in a total area of 1,104,300 square kilometers"
      )
    end
  end
end
