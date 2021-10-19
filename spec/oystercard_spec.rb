# frozen_string_literal: true

require 'Oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end
  
  context 'can top up and deduct from card' do
    describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }
      it 'balance changes when card is topped up' do
        expect { subject.top_up 10 }.to change {
          subject.balance
        }.by(10)
      end

      it 'raises an error when maximum balance is exceeded' do
        amount_capacity = Oystercard::MAX_CARD_BALANCE
        subject.top_up(amount_capacity)
        error_message = 'Maximum balance exceeded'
        expect { subject.top_up 1 }.to raise_error error_message
      end
    end
  end

   describe '#Journey' do 
    let (:station_double) { double('London bridge') }
    let (:station_double_exit) { double('Bank') }
    
    it 'report journey status ' do 
    expect(subject.journey?).to eq(false)
    end 

    it 'responds to touch in' do 
      subject.top_up(Oystercard::MIN_CHARGE) 
      expect(subject.touch_in(station_double)).to eq(true)
    end 

    it 'responds to touch_out' do 
      expect(subject.touch_out(:station_double_exit)).to eq(false)
    end 

    it 'raise error if funds are insufficent' do 
      expect{ subject.touch_in(station_double) }.to raise_error 'not enough funds'
    end 

    it 'deducts the right amount when touched out' do 
      expect{ subject.touch_out(:station_double_exit) }.to change { subject.balance }.by(- Oystercard::MIN_CHARGE)
    end 
   end 

   describe '#double' do 
    it 'card remembers the entry station ' do 
      subject.top_up(Oystercard::MIN_CHARGE) 
      subject.touch_in(:station_double)
      expect(subject.entry_station).to eq(:station_double)

    end 

    it 'card forgets entry station ' do 
      subject.top_up(Oystercard::MIN_CHARGE) 
      subject.touch_in(:station_double)
      subject.touch_out(:station_double_exit)
      expect(subject.entry_station).to eq(nil)
    end 
   end 

   it 'stores exit station' do
    subject.top_up(Oystercard::MIN_CHARGE) 
    subject.touch_in(:station_double)
    subject.touch_out(:station_double_exit)
    expect(subject.exit_station).to eq(:station_double_exit)
  end



   describe '#list of journeys' do 
    it 'see the array of journeys' do 
    expect(subject.journeys).to be_an(Array)
    end 

    #checking if the array is empty 
    it 'has an empty lists of journeys by default' do 
      expect(subject.journeys.empty?).to eq(true) # .to be_empty
    end 

    it 'checks that touch in and touch out create one journey' do 
      subject.top_up(Oystercard::MIN_CHARGE) 
      subject.touch_in(:station_double)
      subject.touch_out(:station_double_exit)
      expect(subject.journeys.length).to eq(1)
   end 

   let(:journey){ {'entry' => :station_double, 'exit' => :station_double_exit } }

   it 'stores a journey' do 
   subject.top_up(Oystercard::MIN_CHARGE) 
   subject.touch_in(:station_double)
   subject.touch_out(:station_double_exit)
   expect(subject.journeys).to include journey

   end 




  end 
  
   






end

