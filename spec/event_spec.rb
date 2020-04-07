require_relative('../lib/event.rb')

RSpec.describe(Event) do
  describe '#initialize' do
    context 'create new events' do
      it 'returns total_events quals to one' do
        Event.clear
        Event.new('Introduction to Javascript', '10AM to 2PM', 'meetup.com/codificadas')
        expected = Event.total_events
        expect(expected).to(eql(1))
      end
      it 'returns total_events quals to two' do
        Event.clear
        Event.new('Introduction to Javascript', 'April 6 10AM to 2PM', 'meetup.com/codificadas')
        Event.new('Introduction to Ruby', 'April 8 10AM to 2PM', 'meetup.com/codificadas')
        expected = Event.total_events
        expect(expected).to(eql(2))
      end
    end
  end
  describe '#list events' do
    context 'list current events' do
      it 'returns enumerator' do
        Event.clear
        Event.new('Introduction to Javascript', 'April 6 10AM to 2PM', 'meetup.com/codificadas')
        Event.new('Introduction to Ruby', 'April 8 10AM to 2PM', 'meetup.com/codificadas')
        Event.new('Introduction to HTML5', 'April 2 10AM to 2PM', 'meetup.com/codificadas')
        expected = Event.all
        expect(expected).to(be_an(Array))
      end
    end
  end
  describe '#clear' do
    context 'clear events from the list' do
      it 'returns total_events quals to zero' do
        Event.clear
        Event.new('Introduction to Javascript', 'April 6 10AM to 2PM', 'meetup.com/codificadas')
        Event.new('Introduction to Ruby', 'April 8 10AM to 2PM', 'meetup.com/codificadas')
        Event.new('Introduction to HTML5', 'April 2 10AM to 2PM', 'meetup.com/codificadas')
        Event.clear
        expected = Event.total_events
        expect(expected).to(eql(0))
      end
    end
  end
  describe '#total_events' do
    context 'add events to the list' do
      it 'returns total_events quals to three' do
        Event.clear
        Event.new('Introduction to Javascript', 'April 6 10AM to 2PM', 'meetup.com/codificadas')
        Event.new('Introduction to Ruby', 'April 8 10AM to 2PM', 'meetup.com/codificadas')
        Event.new('Introduction to HTML5', 'April 2 10AM to 2PM', 'meetup.com/codificadas')
        expected = Event.total_events
        expect(expected).to(eql(3))
      end
    end
  end
end
