#!/bin/bash
# This command converts the latex tables for the ascii-dump documentation into RST format.

pandoc -f latex -t rst -o tabel.rst tabel.tex