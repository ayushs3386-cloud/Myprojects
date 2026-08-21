#!/bin/bash

SECRET_NUMBER=$((($RANDOM % 1000)+1))


PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"

read USER_NAME_ENTERED

USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME_ENTERED'")

if [[ -z $USER_ID ]]
then
echo "Welcome, $USER_NAME_ENTERED! It looks like this is your first time here."

USER_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME_ENTERED')")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME_ENTERED'")

else

GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM gamesdata WHERE user_id = $USER_ID")
BEST_GUESS=$($PSQL "SELECT MIN(no_of_guesses_to_win) FROM gamesdata LEFT JOIN users USING(user_id) WHERE user_id=$USER_ID")
if [[ -z GAMES_PLAYED ]]
then
echo "Welcome back, $USER_NAME_ENTERED! You have played 0 games, and your best game took 0 guesses."
else
echo "Welcome back, $USER_NAME_ENTERED! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."

fi
fi

echo "Guess the secret number between 1 and 1000:"
COUNT=0
function GUESS_NUMBER_FUNC {
read GUESS_NUMBER

((COUNT++))

if [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
then
if [[ $GUESS_NUMBER == $SECRET_NUMBER ]]
then
echo "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

FINAL_RESULT=$($PSQL "INSERT INTO gamesdata(no_of_guesses_to_win,user_id) VALUES($COUNT,$USER_ID)")
else

if [[ $GUESS_NUMBER -gt $SECRET_NUMBER ]]
then
echo "It's lower than that, guess again:"
GUESS_NUMBER_FUNC;

else
echo "It's higher than that, guess again:"
GUESS_NUMBER_FUNC;

fi
fi

else
echo "That is not an integer, guess again:"
GUESS_NUMBER_FUNC;
fi

}

GUESS_NUMBER_FUNC





