#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi  
  echo -e "\nWelcome to My Salon, how can I help you?"

  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  # display available services
  if [[ -z $AVAILABLE_SERVICES ]]
    then
      echo -e "\nWe do not have any service available"
    else
      echo -e "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
      do
        echo "$SERVICE_ID) $NAME"
      done
     # get user imput
    read SERVICE_ID_SELECTED
    # if input is not a valid number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]+$ ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    else
     # get service id from user input
    VALID_SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    # get customer info
    echo -e "\nWhat's your phone number?\n"
    read CUSTOMER_PHONE
    # check if customer exists
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # get services name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$VALID_SERVICE_ID")
    if [[ -z $CUSTOMER_NAME ]]
      then
        echo "\nI don't have a record for that phone number, what's your name?\n"
        read CUSTOMER_NAME
      # insert customer details name and phone into customers table
      INSERT_CUSTOMER_NAME_PHONE=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')") 
      # get time
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $CUSTOMER_NAME?"
      read SERVICE_TIME
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # insert appointment
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME')")
      else
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # get time
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
      read SERVICE_TIME
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
      fi 
    fi
  fi
}
MAIN_MENU
  # if service is not available
  
  
  # if [[ -z $AVAILABLE_SERVICES ]]
  # then
  #   # send to main menu
  #   MAIN_MENU "I could not find that service. What would you like today?"
  # else
  #   # display available services
  #   echo -e "\nWelcome to My Salon, how can I help you?"
  #   echo -e "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  #   do
  #     echo "$SERVICE_ID) $NAME"
  #   done
  #   read SERVICE_SELECTION
  #   # if input is not a number
  #   if [[ ! $SERVICE_SELECTION =~ ^[0-9]+$ ]]
  #   then
  #     # send to main menu
  #     MAIN_MENU "I could not find that service. What would you like today?"
  #   else
  #     # get services id
  #     echo -e "\nWhat's you phone number?"
  #     read PHONE_NUMBER
  #     CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone ='$PHONE_NUMBER'")
  #     # if not available
  #     if [[ -z $CUSTOMER_NAME ]]
  #     then
  #       # send to main menu
  #       echo "I don't have a record for that phone number, what's your name?"
  #       echo -e "\nWhat's your name?"
  #       read CUSTOMER_NAME
  #       # inser new customer
  #       INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$PHONE_NUMBER')")
  #       # get customer_id
  #       CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$PHONE_NUMBER'")
  #       # insert 
  #     fi
  #   fi 
  # fi