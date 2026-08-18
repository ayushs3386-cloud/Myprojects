#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

TRUNCATE_TABLES=$($PSQL "TRUNCATE TABLE games,teams")

tail -n +2 games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

#if not found
if [[ -z $WINNER_ID ]]
then
WIN_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")


#get winner_id
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

fi

#get opponent_id
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

#if not found

if [[ -z $OPPONENT_ID ]]
then
OPP_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

#get opponent_id
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
fi
#insert into games

GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR ,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")




done
