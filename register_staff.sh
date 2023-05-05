#!/bin/bash

    echo "You selected option A: Register New Staff"
    while true; do
        # Prompt the user for staff details
        echo "Register Staff Screen"
        echo "======================="
        read -p "Staff ID: " staff_id
        read -p "Full Name (As per NRIC): " full_name
        read -p "Faculty: " faculty
        read -p "Contact Number: " contact_num
        read -p "TAR UC Email Address: " email

        echo "$staff_id:$full_name:$faculty:$contact_num:$email" >> staff.txt

         read -p "Register Another Staff? (y)es or (q)uit: " choice
        case $choice in
            y)
                # continue to register another staff member
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
