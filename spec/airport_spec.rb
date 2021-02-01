require 'airport'

describe Airport do
  context 'when the weather is sunny' do
    let(:plane) {Plane.new}
    before do
     allow(subject).to receive(:weather).and_return('sunny')
    end
  
    describe '#land' do 
      it 'raises an error if airport it full' do
        subject.airport_capacity.times { subject.land(Plane.new) }
        expect {raise subject.land(plane)}.to raise_error('The airport is full')
      end

      it 'instructs a plane to land' do
        expect(subject.land(plane)).to eq [plane]
      end
    end

    describe '#take_off' do
      it 'instructs a plane to take off' do
        subject.land(plane)
        expect(subject.take_off(plane)).to eq plane
      end

      it 'confirms that plane is no longer at airport'do
        subject.take_off(plane)
        expect(subject.plane).not_to include(plane)
      end
    end
  end  
   
  context 'when the weather is stormy' do
    let(:plane) {Plane.new}
    
    before do
      allow(subject).to receive(:weather).and_return('sunny')
      subject.land(plane)
      allow(subject).to receive(:weather).and_return('stormy') 
    end

    describe '#land'
      it 'raises an error if landing during a storm' do
        plane2 = Plane.new
        expect { subject.land(plane2)}.to raise_error('Too stormy to land')
     end
      
    describe '#take_off' do
      it 'raises error if taking off during a storm' do
        expect { subject.take_off(plane)}.to raise_error('Cannot take off due to storm')
      end

    end
  end
  

    # describe '#stormy?' do
    #   it 'decides if weather is stormy or sunny' do
    #     expect(subject).to respond_to(:stormy?)
    #   end
    
    #   it 'will generate a random number when called' do
    #     allow(subject).to receive(:rand).and_return(3) 
    #     expect(subject.stormy?).to eq 3
    #   end
    # end

  describe '#weather' do
    it 'determines the weather' do
      expect(subject.weather).not_to be_empty
    end

  end
end