require_relative('../lib/scraper.rb')

RSpec.describe(Scraper) do
  let(:scraper) { Scraper.new('https://www.womenwhocode.com/digital') }
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
  describe '#empty_date?' do
    context 'compare string param to determine whether it is empty or not' do
      it 'returns true if param is empty or size == 1' do
        expect(scraper.empty_date?('')).to(eql(true))
      end
      it 'returns false if param is not empty or size == 1' do
        expect(scraper.empty_date?('APR 8')).to(eql(false))
      end
    end
  end
  describe '#clear' do
    context 'clean string from useless caracteres' do
      it 'returns string without character Â' do
        expect(scraper.clear('APR 8 ÂÂÂ')).to(eql('APR 8'))
      end
      it 'returns string without white spaces at the end' do
        expect(scraper.clear('APR 10   ')).to(eql('APR 10'))
      end
    end
  end
end
