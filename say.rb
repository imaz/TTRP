#!/usr/bin/env ruby
def say(word='m',n=1)
  n.times do
    `say -v #{Voice.choice()} #{word}`
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

case ARGV.length
when 0
  say()
when 1
  say(ARGV)
else
  word, n = ARGV
  say(word, n.to_i)
end

