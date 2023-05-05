#!/bin/bash

# Define a function for the main menu
show_menu() {
    clear
    echo "University Venue Management Menu"
    echo "A – Register New Staff"
    echo "B -- Search Staff Details"
    echo "C -- Add New Venue"
    echo "D -- List Venue"
    echo "E – Book Venue"
    echo "Q – Exit from Program"
}

register_staff(){
    clear
    echo "Navigating to Staff_Menu."
    sleep 1
    clear
    echo "Navigating to Staff_Menu.."
    sleep 1
    clear
    echo "Navigating to Staff_Menu..."
    sleep 1
    clear
    ./register_staff.sh
}


search_staff() {
    clear
    echo "You selected option B: Search Staff Details"
    sleep 0.5
    clear
    ./search_staff.bash
}

add_venue() {
    echo "You selected option C: Add New Venue"
    ./add_new_venue.bash
}

list_venues() {
    clear 
    echo "Navigating to List_venues.."
    sleep 1
    clear
    echo "Navigating to List_venues.."
    sleep 1
    clear
    echo "Navigating to List_venues..."
    sleep 1
    clear
    ./list_venue.bash
}

book_venue() {
    echo "You selected option E: Book Venue"
    sleep 1
    ./booking
}

# Loop through the menu until the user selects "Q"
while true; do
    show_menu  # Call the main menu function
    read -p "Please select a choice: " choice

    # Call the appropriate function based on the user's choice
    case $choice in
        A) register_staff ;;
        B) search_staff ;;
        C) add_venue ;;
        D) list_venues ;;
        E) book_venue ;;
        Q) break ;;
        *) echo "Invalid option. Please select a valid choice." ;;
    esac
done

echo "Exiting from the program."
