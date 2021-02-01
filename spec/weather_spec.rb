require 'weather'

describe Weather do
 it 'decides if weather is stormy' do
   expect(subject.stormy?).not_to be_empty 
 end
end