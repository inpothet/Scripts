# Title: OTP Login Script
# Author: Marcel Haazen - https://github.com/inpothet
# Started 02-04-2018 - Finished TBA

#Importing required modules
#import-module activedirectory


# Setting the main CLI passed paramters to mandatory.
param (
    [Parameter(Mandatory=$true)][string]$number,
    [Parameter(Mandatory=$true)][string]$data
 )



# Check if the user send the correct request for password.
function check_passprase{
 $request -ieq $data
 }


#finds the user based on the phone number in Active Directory and if found passes it to check_user_status
function find_user {
 
 }