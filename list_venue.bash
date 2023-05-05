#!/bin/bash

# Function to print table header
print_header() {
  printf "| %-15s | %-12s | %-20s | %-8s | %-30s | %-10s |\n" "Block Name" "Room Number" "Room Type" "Capacity" "Remarks" "Status"
  printf "|%-17s|%-14s|%-22s|%-10s|%-32s|%-12s|\n" "-----------------" "--------------" "----------------------" "--------" "------------>"
}

# Function to print table row
print_row() {
  printf "| %-15s | %-12s | %-20s | %-8s | %-30s | %-10s |\n" "$1" "$2" "$3" "$4" "$5" "$6"
}

# Loop until user chooses to quit
while true; do
  # Get search block name from user
  read -p "Enter block name to search (type 'quit' to exit): " search_block_name

  # Check if user wants to quit
  if [[ "$search_block_name" == "quit" ]]; then
    echo "Returning..."
    ./main_menu.sh
    exit 0
  fi

  # Check if search block name is empty
  if [[ -z "$search_block_name" ]]; then
    echo "Error: Block name cannot be empty."
    continue
  fi

  # Check if venue list file exists
  if [ ! -f "venue.txt" ]; then
    echo "Error: venue.txt file not found."
    exit 1
  fi

  # Check if booking file exists
  if [ ! -f "booking.txt" ]; then
    echo "Error: booking.txt file not found."
    exit 1
  fi

  # Set flag to indicate if record is found
  record_found=false
  clear
  # Print table header
  print_header
  
  # Loop through each line in VenueList.txt
  while IFS=: read -r block_name room_number room_type capacity remarks; do
    # Check if the current line contains the search block name
    if [[ "$block_name" == "$search_block_name" ]]; then
      # Initialize status as "Available"
      status="Available"

      # Check if the room is booked
      while IFS=: read -r staff_id staff_name booking_room_number booking_date booking_time_from booking_time_to booking_reason; do
        # Concatenate block name and room number from the booking file
        booking_room_number="$search_block_name$booking_room_number"

        # Check if the current venue's room number matches the booking room number
        if [[ "$room_number" == "$booking_room_number" ]]; then
          status="Unavailable"
          break
        fi
      done < "booking.txt"

      # Print table row
      print_row "$block_name" "$room_number" "$room_type" "$capacity" "$remarks" "$status"

      # Set flag to indicate that record is found
      record_found=true
    fi
  done < venue.txt

  # Check if record is not found
  if [ "$record_found" == false ]; then
    echo "No record found for block name: $search_block_name"
  fi
done

