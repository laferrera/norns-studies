# aconnect rtpmidi_client_id:port virtualRawMidiclient:port
# aconnect -lio 

#get the rtpmidi client id
RTP_CLIENT_ID=`aconnect -lio | grep "rtpmidi norns" | awk  '{print $2}' | sed 's/.$//'`
#get the rtpmidi client id
# $RTP_PORT = aconnect -lio | grep -A 1 "rtpmidi norns" | awk  '{print $1}'
RTP_PORT=`aconnect -lio | grep "Jason’s MacBook Pro" | awk  '{print $1}' | head -1`

#get the raw midi client id
RAW_MIDI_CLIENT_ID=`aconnect -lio | grep -B 1 "Virtual RawMIDI" | head -1 | awk  '{print $2}' | sed 's/.$//'`
RAW_MIDI_PORT=`aconnect -lio | grep -A 1 "Virtual RawMIDI" | awk  '{print $1}'`

if [[ -z $RTP_PORT ]]; then
  echo "Jason's Laptop Cannot be Found"
elif [[ -n $RTP_PORT ]]; then
    echo "Jason's Laptop  Found"
    echo "Running: "
    echo aconnect $RTP_CLIENT_ID:$RTP_PORT $RAW_MIDI_CLIENT_ID:$RAW_MIDI_PORT
  `aconnect $RTP_CLIENT_ID:$RTP_PORT $RAW_MIDI_CLIENT_ID:$RAW_MIDI_PORT`
fi
