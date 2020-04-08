require_relative('../lib/scraper.rb')

RSpec.describe(Scraper) do
  let(:scraper) { Scraper.new('https://www.womenwhocode.com/digital', false) }
  let(:scraper_empty_dates) { Scraper.new('./spec/examples/empty_events.html', true) }
  let(:scraper_one_event) { Scraper.new('./spec/examples/one_event.html', true) }
  describe '#parse_events' do
    context 'search events on a list' do
      it 'returns arraylist with all events when no param is given' do
        events = scraper.parse_events
        expect(events).to(be_an(Array))
      end
      it 'returns arraylist with matched events when a param is given' do
        events = scraper.parse_events('Java')
        expect(events.all? { |e| e.name.upcase.include?('Java'.upcase) }).to(eql(true))
      end
    end
  end
  describe '#display_events' do
    context 'display events found from search' do
      it 'returns string with events information' do
        scraper.parse_events('Javascript')
        result = scraper.display_events
        expect(result.include?('NAME')).to(eql(true))
      end
      it 'returns text No matches found!' do
        scraper.parse_events('Colima')
        result = scraper.display_events
        expect(result.include?('No matches found!')).to(eql(true))
      end
    end
  end
  describe '#result' do
    context 'parse events on an array' do
      it 'returns arraylist with parsed events' do
        scraper.parse_events
        expect(scraper.result).to(be_an(Array))
      end
    end
  end
  describe '#create_csv' do
    context 'create a new csv file from a list of events' do
      it 'saves an events.csv file with the info from the list' do
        scraper.parse_events
        scraper.create_csv
        results = []
        CSV.foreach('events.csv') do |row|
          results.push(row)
        end
        expect(results.count).to(eql(scraper.result.count))
      end
    end
  end
  describe '#empty_date?' do
    context 'from a given list of events parse only the event where date is not empty' do
      it 'returns zero events from an invalid list' do
        events = scraper_empty_dates.parse_events
        expect(events.count).to(eql(0))
      end
      it 'returns one event from a list of one valid event' do
        events = scraper_one_event.parse_events
        expect(events.count).to(eql(1))
      end
    end
  end
end
