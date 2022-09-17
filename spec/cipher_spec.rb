# frozen_string_literal: true

require './lib/cipher'

describe Cipher do
  cipher = Cipher.new
  describe '#caesar_cipher' do
    it 'Deals with all lower case' do
      expect(cipher.caesar_cipher('testabc', 6)).to eql('zkyzghi')
    end
    it 'Deals with caps and spaces' do
      expect(cipher.caesar_cipher('What a string', 5)).to eql('Bmfy f xywnsl')
    end
    it 'Deals with caps and spaces, ignores punctionation' do
      expect(cipher.caesar_cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
    end
    it 'Deals with caps and spaces, ignores numbers' do
      expect(cipher.caesar_cipher('What a string75', 5)).to eql('Bmfy f xywnsl75')
    end
    it 'Deals with shifts over 26' do
      expect(cipher.caesar_cipher('testabc', 32)).to eql('zkyzghi')
    end
    it 'Deals with negative shifts' do
      expect(cipher.caesar_cipher('testabc', -5)).to eql('oznovwx')
    end
  end
  describe '#get_shift' do
    it 'Returns "done" when done is input' do
      expect(cipher.get_shift('done')).to eql('done')
    end
    it 'returns integer when integer is input' do
      expect(cipher.get_shift('6')).to eql(6)
    end
    it 'returns gets when bad input' do
      expect(cipher).to receive(:get_shift).with('blah').and_return(:get_shift)
      cipher.get_shift('blah')
    end
  end
end
