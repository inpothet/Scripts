# Title: OTP Login Script
# Author: Marcel Haazen - https://github.com/inpothet
# Started 02-04-2018 - Finished TBA

#Importing required modules
#import-module activedirectory


# Setting the main CLI passed paramters to mandatory.
param (
    [Parameter(Mandatory=$false)][string]$number,
    [Parameter(Mandatory=$false)][string]$data
 )



# Check if the user send the correct request for password.
function check_passprase{
 $request -ieq $data
 }


#finds the user based on the phone number in Active Directory and if found passes it to check_user_status
function find_user {
 
 }

# Generate a 12 character password using the following characters: "!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~0123456789"
function create_password{
$Password = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
echo $Password
}

create_password