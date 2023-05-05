#!/bin/bash
echo "You selected option B: Search Staff Details"
while true; do
    # Prompt the user for the staff ID to search for
    echo "Search Staff Screen"
    echo "======================="
    read -p "Enter Staff ID: " staff_id
    clear
    # Search for the staff details in staff.txt
    staff_info=$(grep "^$staff_id:" staff.txt)

    if [[ -z $staff_info ]]; then
        # If the staff ID is not found, display an error message
        echo "Staff ID $staff_id not found."
    else
        # If the staff ID is found, display the staff details
        full_name=$(echo $staff_info | cut -d: -f2)
        faculty=$(echo $staff_info | cut -d: -f3)
        contact_num=$(echo $staff_info | cut -d: -f4)
        email=$(echo $staff_info | cut -d: -f5)

        echo "Full Name (auto display): $full_name"
        echo "Faculty & Programme (Auto Display): $faculty"
        echo "Contact Number (auto display): $contact_num"
        echo "Email Address (auto display): $email"
    fi

    # Prompt the user to search for another staff member or quit
    read -p "Search Another Staff? (y)es or (q)uit: " choice
    case $choice in
        y)
            # continue to search for another staff member
            ;;
        q)
            # exit the loop and return to main menu
	    clear
            exit
            ;;
        *)
            # handle invalid input
            echo "Invalid input. Please enter (y)es or (q)uit."
            ;;
    esac
done
