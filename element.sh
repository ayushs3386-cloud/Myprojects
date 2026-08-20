#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]] 
then
echo "Please provide an element as an argument."
else
#checking for atomic number
NAME="$($PSQL "SELECT name FROM elements WHERE atomic_number=$1 ;")"
#if not checking for symbol
if [[ -z $NAME ]]
then
NAME="$($PSQL "SELECT name FROM elements WHERE symbol='$1' ;")"
fi
#if not checking for name
if [[ -z $NAME ]]
then
ATOMIC_NUMBER="$($PSQL "SELECT atomic_number FROM elements WHERE name='$1' ;")"
fi

if [[ -n $NAME && -z $ATOMIC_NUMBER ]]
then
ATOMIC_NUMBER="$($PSQL "SELECT atomic_number FROM elements WHERE name='$NAME' ;")"
fi
#if not then not a valid id
if [[ -z $ATOMIC_NUMBER ]]
then
echo "I could not find that element in the database."
else
NAME="$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER ;")"

ATOMIC_NUMBER="$($PSQL "SELECT atomic_number FROM elements WHERE name='$NAME' ;")"
ATOMIC_MASS="$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")"
BOILING_POINT="$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")"
MELTING_POINT="$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")"
SYMBOL="$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")"
TYPE_ID="$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")"
TYPE="$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID;")"

echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi
fi

