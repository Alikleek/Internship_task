for the task of creating mygrep

Requirments:
1.  The script must be executable and accept input as:
2.  It must handle invalid input (e.g., missing file, too few arguments).
3.  Output must mimic grep's style as closely as possible.

Testing: (Check attached screenshot)

Reflection:
-The script first analyzes the command given to know if it has the help command or not the right syntax it will show the help message
-Based on the option a variable is then changed to later be used in the script based on the option, if an option is found and variables are set the enviroment variable is shifted to start the actual search algorithm
-To make the script case insensitive the search word is forced to lower case
-we use read command to read through the text file and save line number on each line, each line is also forced to lowercase to compare to search word
-depending on the options set in the beginning of the script it'll show the output of the script
-hardest implementation was the error handling to make sure all use cases are handled and without any alteration the the original execution of the script