!/bin/bash -x
echo "Welcome : To Sanke and Ladder Smulator Game"

#variable 

position=0
noPlay=0
ladder=1
snake=2

playerRoll=$((RANDOM%6+1))

function nextMoves()
{
positionMoves=$((RANDOM%3))

case $positionMoves in
	$noPlay)
				echo "No play"
				;;
	$ladder)
				position=$(( $position + $playerRoll ))
				;;
	$snake)
				position=$(( $position - $playerRoll ))
				if [[ $position -lt 0 ]]
				then
						position=0
				fi
				;;
esac
}
nextMoves
echo $position			 


