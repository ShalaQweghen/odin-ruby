# frozen_string_literal: true

require_relative '../caesar_cipher'

describe '#caesar_cipher' do
  context 'with a shift factor of 2' do
    context 'with a single word starting with a downcase letter' do
      it 'makes "abby" into "cdda"' do
        expect(caesar_cipher('abby', 2)).to eql('cdda')
      end
    end

    context 'with a single word starting with an upcase letter' do
      it 'turns "Abby" into "Cdda"' do
        expect(caesar_cipher('Abby', 2)).to eql('Cdda')
      end
    end

    context 'with a multiple-word sentence starting with a downcase letter and without any punctuation' do
      it 'turns "abby is a nanny" into "cdda ku c pcppa"' do
        expect(caesar_cipher('abby is a nanny', 2)).to eql('cdda ku c pcppa')
      end
    end

    context 'with a multiple-word sentence starting with an upcase letter and without any punctuation' do
      it 'turns "Abby is a nanny" into "Cdda ku c pcppa"' do
        expect(caesar_cipher('Abby is a nanny', 2)).to eql('Cdda ku c pcppa')
      end
    end

    context 'with a multiple-word sentence starting with an upcase letter and with a punctuation' do
      it 'turns "Abby is a nanny!" into "Cdda ku c pcppa!"' do
        expect(caesar_cipher('Abby is a nanny!', 2)).to eql('Cdda ku c pcppa!')
      end
    end
  end
end
