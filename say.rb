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

  def Voice.filter(v)
    case v
    when 'GoodNews'
      'Good'
    when 'BadNews'
      'Bad'
    when 'Organ'
      'Pipe'
    else
      v
    end
  end
end
