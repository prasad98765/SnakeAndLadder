#!/bin/bash -x

echo "Welcome : To Sanke and Ladder Smulator Game"

#Constant

START_POSITION=0
END_POSITION=100

#variable 

position=0
noPlay=0
ladder=1
snake=2
count=0
 
function checkWinOrNot()
{

   if [[ $position -eq $END_POSITION ]]
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
			if [[ $playerPosition -gt $END_POSITION ]]
			then
				nextMoves
			else
				position=$(( $position + $playerRoll ))
				echo $position
				checkWinOrNot
	   	fi;;
		$snake)
			position=$(( $position - $playerRoll ))
			if [[ $position -lt $START_POSITION ]]
			then
				position=0
				nextMoves
			else
				checkWinOrNot
			fi;;
	esac

}

nextMoves
