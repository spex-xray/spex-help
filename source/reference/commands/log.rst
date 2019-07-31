.. _sec:log:

Log: Making and using command files
===================================

Overview
~~~~~~~~

In many circumstances a user of SPEX wants to repeat his analysis for a
different set of parameters. For example, after having analysed the
spectrum of source A, a similar spectral model and analysis could be
tried on source B. In order to facilitate such analysis, SPEX offers the
opportunity to save the commands that were used in a session to an
ascii-file. This ascii-file in turn can then be read by SPEX to execute
the same list of commands again, or the file may be edited by hand.

The command files can be nested. Thus, at any line of the command file
the user can invoke the execution of another command file, which is
executed completely before execution with the current command file is
resumed. Using nested command files may help to keep complex analyses
manageable, and allow the user easy modification of the commands.

In order to facilitate the readability of the command files, the user
can put comment lines in the command files. Comment lines are recognized
by the first character, that must be #. Also blank lines are allowed in
the command file, in order to enhance (human) readability.

Saving commands to file
~~~~~~~~~~~~~~~~~~~~~~~

After the command ``log save #a`` is given on the SPEX command line
(``#a`` is the file name), all the following commands entered by the
user (NOT the ones before) are stored on the command file until the
``log close out`` command is given. Exceptions are the commands read
from a nested command file (it is not necessary to save these commands,
since they are already in the nested command file). Also, help calls and
the command to open the file ("log save #a") are not stored.

All commands are expanded to the full keywords before they are saved in
the file. However, for execution this is not important, since the
interpreter can read both abbrevated and full keywords.

Saving the commands to the command file can be stopped by giving the
command ``log close save``. The file with the saved commands is closed
and remains at the specified path. SPEX will automatically append the
extension ".com" to the filename.

Saving output to file
~~~~~~~~~~~~~~~~~~~~~

It is also possible to store all the output that is printed on the
screen to a file. This is usefull for long sessions or for computer
systems with a limited screen buffer. The output saved this way could be
inspected later by (other programs of) the user. It is also useful if
SPEX is run in a kind of batch-mode. The command to save the output is
``log out #a``, where ``#a`` should be the filename without extension.
SPEX will automatically append the extension ".out" to the filename.

Executing commands from file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ASCII files with the .com extension containing SPEX commands can be
executed in SPEX using the command ``log execute #a``, where ``#a``
stands for the file name without the ".com" extension. When a command
file is read and the end of file is reached, the text "Normal end of
command file encountered" is printed on the screen, and execution of the
calling command file is resumed, or if the command file was opened from
the terminal, control is passed over to the terminal again.

For example, the user may have a command file named *run* which does his
entire analysis. This command file might start with the line "log exe
mydata" that will run the command file *mydata* that contains all
information regarding to the data sets read, further data selection or
binning etc. This could be followed by a second line in *run* like "log
exe mymodel" that runs the command file *mymodel* which could contain
the set-up for the spectral model and/or parameters. Also, often used
plot settings (e.g. stacking of different plot types) could easily
placed in separate command files.

Syntax
~~~~~~

The following syntax rules apply for command files:

| ``log exe #a`` : Execute the commands from the file #a. The suffix
  ".com" will be automatically appended to this filename.
| ``log save #a [overwrite] [append]`` : Store all subsequent commands
  on the file #a. The suffix ".com" will be automatically appended to
  this filename. The optional argument "overwrite" will allow to
  overwrite an already existing file with the same name. The argument
  "append" indicates that if the file already exists, the new commands
  will be appended at the end of this file.
| ``log close save`` : Close the current command file where commands are
  stored. No further commands will be written to this file.
| ``log out #a [overwrite] [append]`` : Store all subsequent screen
  output on the file #a. The suffix ".out" will be automatically
  appended to this filename. The optional argument "overwrite" will
  allow to overwrite an already existing file with the same name. The
  argument "append" indicates that if the file already exists, the new
  output will be appended at the end of this file.
| ``log close output`` : Close the current ascii file where screen
  output is stored. No further output will be written to this file.

Examples
~~~~~~~~

| ``log save myrun`` : writes all subsequent commands to a new file
  named "myrun.com". However, in case the file already exists, nothing
  is written but the user gets a warning instead.
| ``log save myrun append`` : as above, but appends it to an existing
  file
| ``log save myrun overwrite`` : as above, but now overwrites without
  warning any already existing file with the same name.
| ``log close save`` : close the file where commands are stored.
| ``log exe myrun`` : executes the commands in file myrun.com.
| ``log output myrun`` : writes all subsequent output to file myrun.out.
| ``log close output`` : closes the file above.
