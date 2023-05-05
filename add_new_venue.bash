#!/bin/bash

    while true; do
        echo "Add New Venue Screen"
        echo "===================="
        read -p "Block Name: " block_name
        read -p "Room Number: " room_number
        read -p "Room Type: " room_type
        read -p "Capacity: " capacity
        read -p "Remarks: " remarks

        echo "$block_name:$room_number:$room_type:$capacity:$remarks" >> venue.txt

        read -p "Add Another New Venue? (y)es or (q)uit : " choice
        case $choice in
            [Qq]) break;;
            *) continue;;
        esac
    done

