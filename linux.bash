#                             Online Bash Shell.
#                 Code, Compile, Run and Debug Bash script online.
# Write your code in this editor and press "Run" button to execute it.

while true; do
echo "University Venue Management Menu"
echo ""
echo ""

echo "A - Register New Staff"
echo "B - Search Staff Details" m
echo "C - Add New Venue"
echo "D - List Venue"
echo "E - Book Venue"
echo ""
echo "Q - Exit from Program"
echo ""
echo "Please select a choice: "
read choice
case $choice in
A)
 echo ""
 echo ""
 echo "Register Staff Screen"
 echo "====================="
 echo "Staff ID: "
 #read id
 echo "Full Name (Ad per NRIC): "
 #read name
 echo "Faculty: "
 #read faculty
 echo "Contact Number: "
 #read contact
 echo "TAR UC Email Address: "
 #read email
 echo ""
 echo "Register Another Staff? (y)es or (q)uit: "
 while true; do
  read register
  case $register in
  y)
  echo "Register Another Staff"
  break;;
  q)
  echo "Exiting..."
  exit 0
 break;;
 esac
 done;;
 
B)
echo "Search" break;;
C)
echo "Add" break;;
D)
echo "List"break;;
E)
echo "Book"break;;
Q)
echo "Exit"break;;
*)
echo "Invalid choice. Please enter in uppercase!"
echo ""
echo "";;
esac
done
