module Vaultify

  module EdtfHelper

    def scrub str
      str.strip.downcase.gsub(/[\|,.\[\]'"]/, ' ').gsub(/(\d+)\s*(st|nd|rd|th)\b/, '\\1')
    end

    def clean_words str
      cleaned_string = str.strip.downcase
      months.each do |month, value|
        cleaned_string = cleaned_string.gsub(Regexp.new(month), value)
      end
      seasons.each do |season, value|
        cleaned_string = cleaned_string.gsub(Regexp.new(season), value)
      end
      descriptors.each do |descriptor, value|
        cleaned_string = cleaned_string.gsub(Regexp.new(descriptor), value)
      end
      cleaned_string
    end

    def machine_clean str
      clean_input = str.gsub(/open/, '*').gsub(/unknown/, '').gsub(/[^\du]u[^\du]/, '')
      clean_input.gsub(/u/, 'X')
    end

    def clean_extra_words str
      str.strip.gsub(/[a-z]/, '').gsub(/ +/, ' ')
    end

    def add_zeroes str
      str.strip.gsub(/\b(\d)\b/, '0\\1').gsub(/\b([\dX][\dX][\dX])[^\dX]/, '\\1X')
    end

    def d4
      '[\\dX][\\dX][\\dX][\\dX][?~]?'
    end

    def d2
      '[\\dX][\\dX][?~]?'
    end

    def add_separators str

      str.gsub(/([\dX?~])\s+([\dX?~])/, '\\1-\\2')
          .gsub(' ', '').gsub(/([\dX?~])\/([\dX?~])/, '\\1-\\2')
          .gsub(Regexp.new('(' + d2 + '-' + d4 + ')-(' + d2 + '-' + d4 + ')'), '\\1/\\2')
          .gsub(Regexp.new('(' + d2 + '-' + d4 + ')-(' + d2 + '-' + d2 + '-' + d4 + ')'), '\\1/\\2')
          .gsub(Regexp.new('(' + d4 + ')-(' + d4 + ')'), '\\1/\\2')
          .gsub(Regexp.new('(' + d4 + '-' + d2 + ')-(' + d4 + ')'), '\\1/\\2')
          .gsub(Regexp.new('(' + d4 + '-' + d2 + '-' + d2 + ')-(' + d4 + ')'), '\\1/\\2')
    end

    def arrange str
      if Regexp.new(d4 + '-' + d2 + '-' + d2, 'g').match(str)
        str
      elsif Regexp.new(d2 + '-' + d2 + '-' + d4, 'g').match(str)
        str.gsub(Regexp.new('(' + d2 + ')-(' + d2 + ')-(' + d4 + ')'), '\\3-\\2-\\1')
      elsif Regexp.new(d2 + '-' + d4 + '-' + d2, 'g').match(str)
        str.gsub(Regexp.new('(' + d2 + ')-(' + d4 + ')-(' + d2 + ')'), '\\2-\\1-\\3')
      elsif Regexp.new(d4 + '-' + d2, 'g').match(str)
        str
      elsif Regexp.new(d2 + '-' + d4, 'g').match(str)
        str.gsub(Regexp.new('(' + d2 + ')-(' + d4 + ')'), '\\2-\\1')
      else
        str
      end
    end

    def rearrange str
      if str.include? '/'
        split_string = str.split('/')
        arrange(split_string[0]) + '/' + arrange(split_string[1])
      else
        arrange(str)
      end
    end

    def dirty str
      clean_input = str.gsub(/^\*|\*$/, 'open').gsub(/^\//, 'unknown/').gsub(/\/$/, '/unknown')
      clean_input.gsub(/X/, 'u')
    end

    def convert_date input
      return input if Date.edtf(input)
      clean_date = clean_extra_words(machine_clean(clean_words(scrub(input))))
      clean_date = dirty(rearrange(add_separators(add_zeroes(clean_date))))
      Date.edtf(clean_date) ? clean_date : nil
    end

    def months
      {
          'january|jan' => '01',
          'february|feb' => '02',
          'march|mar' => '03',
          'april|apr' => '04',
          'may' => '05',
          'june|jun' => '06',
          'july|jul' => '07',
          'august|aug' => '08',
          'september|sep' => '09',
          'october|oct' => '10',
          'november|nov' => '11',
          'december|dec' => '12'
      }
    end

    def seasons
      {
          'spring|spr' => '21',
          'summer|summ|sum' => '22',
          'autumn|aut|fall|fal' => '23',
          'winter|wint|win' => '24'
      }
    end

    def descriptors
      {
          '(\\d.*)to(.*\\d)' => '\\1/\\2',
          '\\s*(around|about|abt|estimated|est|circa|approximately|approx)\\s*' => '~'
      }
    end

  end
end