#!/bin/bash -x

#variable 

position=0
noPlay=0
ladder=1
snake=2
count=0
 
function checkWinOrNot()
{

   if [[ $position -eq 100 ]]
   then
      echo "Win"
		echo "Total Die Roll Count" $count
   else
      nextMoves
   fi

}


function nextMoves()
{
	playerRoll=$((RANDOM%6+1))
	count=$(( $count + 1))
	positionMoves=$((RANDOM%3))

	case $positionMoves in

		$noPlay)
			echo "No Play"
			nextMoves
			;;
   	$ladder)
			playerPosition=$(( $position + $playerRoll ))
			if [[ $playerPosition -gt 100 ]]
			then
				nextMoves
			else
				position=$(( $position + $playerRoll ))
				echo $position
				checkWinOrNot
	   	fi;;
   	$snake)
			position=$(( $position - $playerRoll ))
			if [[ $position -lt 0 ]]
			then
				position=0
				nextMoves
			else
				checkWinOrNot
			fi;;
	esac
}

nextMoves
