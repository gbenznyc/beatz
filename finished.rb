use_bpm 80

live_loop :idm_bb do
  with_fx :lpf, cutoff: 80, pre_amp: 2.5 do
    sample :drum_heavy_kick
  end
  sleep 0.5
end

live_loop :da_chords do
  4.times do
    play chord(:A3, :minor)
    sleep 0.75
  end
  play chord(:G3, :major)
  sleep 1.25
  3.times do
    play chord(:A3, :minor)
    sleep 0.75
  end
  play chord(:A3, :minor)
  sleep 0.5
  play chord(:G3, :major)
  sleep 1.0
  4.times do
    play chord(:D3, :minor)
    sleep 0.75
  end
  play chord(:C3, :major)
  sleep 1.25
  3.times do
    play chord(:D3, :minor)
    sleep 0.75
  end
  play chord(:D3, :minor)
  sleep 0.5
  play chord(:C3, :major)
  sleep 1.0
end

live_loop :slappy do
  with_fx :reverb do
    sample :perc_snap
    sleep 7.5
    sample :perc_snap2
    sleep 0.5
    sample :perc_snap
    sleep 8
  end
end

live_loop :sinestro do
  sleep 16
  sample :ambi_choir, sustain: 60 * 60 * 2
end


live_loop :synth_bass do
  with_fx :distortion do
    32.times do
      play :A1
      sleep 0.25
    end
    32.times do
      play :C2
      sleep 0.25
    end
  end
end

# HIHAT
define :hihat do
  use_synth :pnoise
  with_fx :hpf, cutoff: 120 do
    play release: 0.01, amp: 13
  end
end

live_loop :hihat_loop do
  divisors = ring 2, 2, 2, 2, 2, 2, 2, 2
  divisors.tick.times do
    hihat
    sleep 1.0 / divisors.look
  end
end

live_loop :snare_loop do
  sleep 1.0
  play sample :drum_snare_soft, amp:1
  sleep 1.25
  play sample :drum_snare_soft, amp:1
  sleep 0.75
  play sample :drum_snare_soft, amp:1
  sleep 1.0
  
end
