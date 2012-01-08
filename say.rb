#!/usr/bin/env ruby

class Say
  def initialize(word='',n=1)
    @word = word
    @n = n.to_i
  end

  def call()
    @n.times do
      `say -v #{Voice.choice()} #{@word}`
    end
  end
end

class Voice
  def Voice.choice
    voices = Dir.entries("/System/Library/Speech/Voices/")
    voices.shift(2)
    voices.map!{|v| v.sub(/.SpeechVoice/,'') }
    self.filter(voices.sample)
  end

  def Voice.filter(voice)
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

if __FILE__ == $0
  say = Say.new(*ARGV)
  say.call()
end
