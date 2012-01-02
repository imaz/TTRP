def say(word,n)
  n.times do
    `say -v #{voice()} #{word}`
  end
end

def voice()
  voices = Dir.entries("/System/Library/Speech/Voices/")
  voices.shift(2)
  voices.map!{|v| v.sub(/.SpeechVoice/,'') }
  voices.sample
end
