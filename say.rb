#!/usr/bin/env ruby

module Voice
  class << Voice
    def choice
      voices = Dir.entries("/System/Library/Speech/Voices/")
      voices.shift(2)
      voices.map!{|v| v.sub(/.SpeechVoice/,'') }
      filter(voices.sample)
    end

    private
    def filter(voice)
      case voice
      when 'GoodNews'
        'Good'
      when 'BadNews'
        'Bad'
      when 'Organ'
        'Pipe'
      else
        voice
      end
    end
  end
end

class Say
  include Voice

  def initialize(word='',n=1)
    @word = word
    @n = n.to_i
  end

  def call()
    @n.times do
      command = "say -v #{Voice.choice()} #{@word}"
      `#{command}`
      puts command
    end
  end
end

if __FILE__ == $0
  say = Say.new(*ARGV)
  say.call()
end
