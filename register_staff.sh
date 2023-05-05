#!/bin/bash

echo "You selected option A: Register New Staff"
while true; do
    # Prompt the user for staff details
    echo "Register Staff Screen"
    echo "======================="
    while true; do
        read -p "Staff ID: " staff_id
        if [[ -z "$staff_id" ]]; then
            echo "Please do not leave the staff ID empty."
        elif [[ ! "$staff_id" =~ ^[0-9]{4}$ ]]; then
            echo "Invalid staff ID. 4-digit number only!"
        else
            break
        fi
    done
    while true; do
    read -p "Full Name (As per NRIC): " full_name
    if [[ -z "$full_name" ]]; then
        echo "Your name cannot be empty!"
    else
        break
    fi
done
    while true; do
    read -p "Faculty: " faculty
    if [[ ! "$faculty" =~ ^[A-Z]{4}$ ]]; then
        echo "Invalid input. Please enter 4 uppercase letters!"
    else
        break
    fi
done
    while true; do
        read -p "Contact Number: " contact_num
        if [[ -z "$contact_num" ]]; then
            echo "Please do not leave the contact number empty."
        elif [[ ! "$contact_num" =~ ^[0-9]{10}$ ]]; then
            echo "Invalid contact number. 10-digit number only!"
        else
            break
        fi
    done
    while true; do
        read -p "TAR UC Email Address: " email
        if [[ -z "$email" ]]; then
            echo "Please do not leave the email address empty."
        elif [[ ! "$email" =~ @tarc.edu.my$ ]]; then
            echo "Please enter a valid TAR UC email address with @tarc.edu.my!"
        else
            break
        fi
    done

    # Write the staff details to staff.txt
    echo "$staff_id:$full_name:$faculty:$contact_num:$email" >> staff.txt

    read -p "Register Another Staff? (y)es or (q)uit: " choice
    case $choice in
        y)
            # continue to register another staff member
	    clear
            ;;
        q)
            # exit the loop and return to main menu
	    clear
            sh ./main_menu.sh
            ;;
        *)
            # handle invalid input
            echo "Invalid input. Please enter (y)es or (q)uit."
            ;;
    esac
done
