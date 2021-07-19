#!/usr/bin/env sh

copyright() {
cat << EOF

Equation Editor Copyright (C) 2021 José Hernández

This program comes with ABSOLUTELY NO WARRANTY; for details type '$0 --warranty'.
This is free software, and you are welcome to redistribute it
under certain conditions; type '$0 --conditions' for details.

EOF
}

warranty() {
cat << EOF

Disclaimer of Warranty.

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR OR CORRECTION.

EOF
}

conditions() {
cat << EOF

For terms and conditions please visit this link:

  https://www.gnu.org/licenses/gpl-3.0.en.html

EOF
}

# Display copyright notice
copyright

echo Starting Equation Editor...
echo

# Start the server
cd equation-editor || exit
ng serve --verbose --watch --live-reload --base-href "/"
