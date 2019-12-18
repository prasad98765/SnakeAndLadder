#!/bin/bash -x

echo "Welcome : To Sanke and Ladder Smulator Game"

#constant
START_POSITION=0
WINNING_POSITION=100

#variable 

noPlay=0
ladder=1
snake=2
player1=0
player2=0
flag=0
position=0
count=0
function nextMoves()
{

	position=$1
	playerRoll=$((RANDOM%6+1)) 
	positionMoves=$((RANDOM%3))

	case $positionMoves in
		$noPlay)
			echo $position
			;;
		$ladder)
			playerPosition=$(( $position + $playerRoll ))
			if [[ $playerPosition -gt $WINNING_POSITION ]]
			then
				echo $position
			else
				echo $playerPosition
			fi;;
   	$snake)
			playerPosition=$(( $position - $playerRoll ))
			if [[ $playerPosition -lt $START_POSITION ]]
			then
				echo $position
			else
				echo $playerPosition
			fi;;
	esac

}

function getWinner()
{

	while [[ $player1 -le $WINNING_POSITION && $player2 -le $WINNING_POSITION ]]
	do
		if [ $flag -eq 0 ]
		then
			player1=$(nextMoves $player1)
         flag=1
        	echo "Player1 Position: " $player1
        	if [[ $player1 -eq $WINNING_POSITION ]]
         then
         	echo "Player1 win" $count
            break;
         fi
		fi
      if [ $flag -eq 1 ]
      then
      	flag=0
        	player2=$(nextMoves $player2)
         echo "Player2 position : "$player2
         if [[ $player2 -eq $WINNING_POSITION ]]
        	then
         	echo "Player2 win !! " $count
            break;
         fi
       fi
       count=$(( $count + 1 ))
	done

}

function main()
{

	getWinner

}

main
