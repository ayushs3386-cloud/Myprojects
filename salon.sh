#!/bin/bash

echo -e "\n~~~ Welcome to the Salon Shop ~~~\n"

echo -e "\nWelcome to the Salon Shop, How can I help you?.\n"
function SHOP_MENU() {
if [[ $1 ]]
then 
echo -e "\n$1"
fi

psql --username=freecodecamp --dbname=salon -A -t -c "SELECT * FROM services" | while IFS='|' read -r SERVICE_ID SERVICE_NAME
do

echo "$SERVICE_ID) $SERVICE_NAME"

done
read SERVICE_ID_SELECTED ;

if [[ ! -z $SERVICE_ID_SELECTED ]]
then
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
SHOP_MENU "I could not find that service. What would you like today?"
else


if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
SERVICE_NAME=$(psql --username=freecodecamp --dbname=salon -A -t -c "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
if [[ -z $SERVICE_NAME ]]
then
SHOP_MENU "I could not find that service. What would you like today?"



else

echo -e "\nWhat is your phone number?"
read CUSTOMER_PHONE

CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon -A -t -c "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_ID ]] 
then
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME

psql --username=freecodecamp --dbname=salon -c "INSERT INTO customers (phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')"
echo -e "\nnew customer_id generated."
echo -e "\nplease enter the time for appointment."
read SERVICE_TIME;

CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon -A -t -c "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
psql --username=freecodecamp --dbname=salon -A -t -c "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')"


echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."



else

CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon -A -t -c "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

echo -e "\nplease enter the time for appointment."
read SERVICE_TIME;

CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon -A -t -c "SELECT CUSTOMER_ID FROM customers WHERE phone='$CUSTOMER_PHONE'")

psql --username=freecodecamp --dbname=salon -A -t -c "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')"


echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."


fi
fi
fi
fi
fi
}

SHOP_MENU;

