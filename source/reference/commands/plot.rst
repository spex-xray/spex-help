.. _sec:plot:

Plot: Plotting data and models
==============================

Overview
~~~~~~~~

The plot command cause the plot to be (re)drawn on the graphics device.
Multiple graphics devices can be defined in one SPEX session. For
example, a plot can be sent to both a postscript and a xs device.

A user can also set the number of plot frames in the currently active
device(s), e.g. the data and model can be displayed in one frame while
the residuals can be displayed in a frame below. The user has to specify
what is to be plotted in in each frame.

In each plot frame, there can be different sets that can be specified by
the "set" keyword in the plot command. For example, for the plot type
data, each set corresponds to the spectrum of an instrument or region;
with this option it is therefore possible to give different instruments
different colours or plot symbols, etc., or just to omit one of the
instruments from the plot.

The plot command is also used to select the axis plot units and scales
as well as character commands like font style, line weights, plot
colours, etc. Finally, the plot command can also be used to dump the
data to an ascii file.

.. warning:: To make a plot, always start with a ``plot device`` command
   to open any plot device you wish. Next select a plot type using ``plot
   type``. After this you can give any plot commands to modify or display
   the plot.

.. warning:: Some of the more fancy plotting options, like adding
   labels to a plot, are broken. To make more sophisticated plots, it is
   advisable to save the plot to a QDP file with ``plot adum`` and adapt them
   through QDP (Ftools). We intent to update the plotting system in a
   future version of SPEX.

Syntax
~~~~~~

The following syntax rules apply for plot:

| ``plot`` : (Re)draws the plot on the graphics device. Take care to
  open at least one device first (with a "plot dev" command)
| ``plot frame new`` : Creates a new additional plot frame, where an
  other plot type can be displayed (or the same plot type but with
  different units). Take care to position the viewport of the new and
  old frames to the desired locations.
| ``plot frame #i`` : Sets frame number #i to be the currently active
  frame. After this command has been issued, all plot commands will only
  affect the currently active frame.
| ``plot frame delete #i`` : Deletes frame number #i.
| ``plot type #a`` : Specifies what is to be plotted in the selected
  frame. #a can be any of the plot types specified in
  :ref:`sect:plottypes`.
| ``plot device #a1 [#a2]`` : Selects a graphics device #a1 and optional
  file name #a2 (in the case of a postscript or gif device). File
  extensions (for example .ps) should be specified. For valid devices,
  see :ref:`sect:plotdevices`.
| ``plot close #i`` : Close graphics device number #i. Note, always
  close a postscript device before quiting /spex, otherwise the contents
  may be corrupted.
| ``plot hlan`` : Make a hardcopy in landscape orientation and send it
  to the standard printer. Use is made of the unix command ``lp -c
  filename``.
| ``plot hpor`` : As above, but for portrait orientation
| ``plot x lin`` : Plot the x-axis on a linear scale
| ``plot x log`` : Plot the x-axis on a log scale
| ``plot y lin`` : Plot the y-axis on a linear scale
| ``plot y log`` : Plot the y-axis on a log scale
| ``plot y mix #r1 #r2`` : Plot the y-axis on a mixed linear/logarithmic
  scale; for y-values below #r1 the data will be plotted linear, and for
  y-values above #r1 the data will be plotted logarithmically; the
  linear part occupies the fraction of the total frame height given by
  #r2. See also :ref:`sect:plotscales`.
| ``plot z lin`` : Plot the z-axis on a linear scale. The z-axis is
  defined for two-dimensional plots like contour plots.
| ``plot z log`` : As above, but using a log scale.
| ``plot ux #a`` : Set the plot units on the x-axis, #a can be Å, keV,
  eV, or whatever unit that is allowed. The allowed values depend upon
  the plot type. See :ref:`sect:plotaxes` for
  allowed units for each plot type.
| ``plot ux vel #r #a`` : Plot the x-axis in velocity units
  (:math:`\mathrm{km}` :math:`\mathrm{s}^{-1}`), with reference energy provided as #r if #a is
  "keV" or reference wavelength provided as #r if #a is "Ang". Note that
  the same zero scale will be set for all plot windows.
| ``plot uy #a`` : Same as above, but for the y-axis
| ``plot uz #a`` : Same as above, but for the z-axis
| ``plot rx #r1:#r2`` : set the plot range on the x-axis from #r1 to #r2
| ``plot ry #r1:#r2`` : Same as above, but for the y-axis
| ``plot rz #r1:#r2`` : Same as above, but for the z-axis
| ``plot view default #l`` : For #l is true, the default viewport is
  used. For #l is false, the default viewport is overruled and you can
  specify your own viewport limits with the ``set view x`` and ``set view
  y`` commands. Useful for stacking different plot frames.
| ``plot view x #r1:#r2`` : Set the x viewport range from #r1 to #r2,
  where #r1 and #r2 must be in the range 0–1.
| ``plot view y #r1:#r2`` : Same as above, but for the y-range.
| ``plot view back #i`` : Set the viewport background colour to value
  #i. See Section :ref:`sect:plotcolours` for the
  allowed plot colours.
| ``plot view transp #l`` : If true, set the viewport background to to
  transparent, the plot frame will be shown with the background colour
  selected by the ``plot view back`` command. Default is false.
| ``plot box disp #l`` : Display a box around the viewport, true/false
| ``plot box edge #a #l`` : If true (default), display the edges of the
  plot box, #a should be one of the following keywords: top, bottom,
  left, right. Note that whether you see the edges or not also depends
  on the settings defined by the ``plot box disp`` command.
| ``plot box axis x #l`` : Plots an x-axis with tick marks at the line
  :math:`y=0`. You only see this of course if your y-range includes the
  value 0.
| ``plot box axis y #l`` : As above, but for the y-axis
| ``plot box grid x #l`` : Plot a grid for the x-axis
| ``plot box grid y #l`` : Plot a grid for the y-axis
| ``plot box numlab bottom #l`` : Show the tick number labels at the
  bottom of the plot, true/false
| ``plot box numlab top #l`` : Same as above, but for the top
| ``plot box numlab left #l`` : Same as above, but for the left
| ``plot box numlab right #l`` : Same as above, but for the right
| ``plot box numlab vert #l`` : Plot the tick number labels on the
  y-axis vertically or horizontally, set #l to true for vertical
  tnumbers and false for horizontal numbers.
| ``plot box numlab xscal #i`` : Way to denote the numerical numbers
  along the x-axis. Three values are allowed: 0=automatic, 1=forced
  decimal labeling, 2=forced exponential labeling. Default is 0.
| ``plot box numlab yscal #i`` : As above, but for the y-axis
| ``plot box tick invert x #l`` : Draw the tick marks on the x-axis on
  the inside or outside the box, set #l to true for outside and false
  for inside (default).
| ``plot box tick invert y #l`` : Same as above, but for the y-axis.
| ``plot box tick minor x #l`` : Draw minor tick marks on the x-axis,
  true/false
| ``plot box tick minor y #l`` : Same as above, but for the y-axis
| ``plot box tick major x #l`` : Draw major tick marks on the x-axis,
  true/false
| ``plot box tick major y #l`` : Same as above, but for the y-axis
| ``plot box tick distance x #r`` : Set the distance between the
  major/labelled tick marks on the x-axis to #r
| ``plot box tick distance y #r`` : Same as above, but for the y-axis
| ``plot box tick subdiv x #i`` : Draw #i minor tick marks between each
  major tick mark on the x-axis
| ``plot box tick subdiv y #i`` : Same as above, but for the y-axis
| ``plot box col #i`` : Set the box colour to colour number #i. See
  :ref:`sect:plotcolours` for the allowed plot colours.
| ``plot box lt #i`` : Set the box line type to #i. See
  :ref:`sect:plotlines` for allowed line types.
| ``plot box lw #i`` : Set the box line weight to number #i. See
  :ref:`sect:plotlines` for more about line
  weights.
| ``plot box fh #r`` : Set the box font height to number #i.
| ``plot box font #i`` : Set the box font to number #i. See
  :ref:`sect:plottext` for more details about text
  fonts.
| ``plot cap #a disp #l`` : If #l is true, display the caption
  (default). For more about captions see
  :ref:`sect:plotcaptions`. Here and below, #a
  can be x, y, z, id, lt or ut.
| ``plot cap #a col #i`` : Plot caption #a in colour number #i. See
  :ref:`sect:plotcolours` for valid colour
  indices.
| ``plot cap #a back #i`` : Set the background colour for caption #a to
  #i.
| ``plot cap #a lw #i`` : Set the font line weight for caption #a to #i.
| ``plot cap #a fh #r`` : Set the font height for caption #a to value
  #r.
| ``plot cap #a font #i`` : Set the font type for caption #a to #i.
| ``plot cap #a1 text #a2`` : Set the text for caption #a1 to #a2. Note
  that the caption text should be put between quotation marks, like "best
  fit results" if you want to see the text: best fit results.
| ``plot cap #a1 side #a2`` : Plot caption #a1 (which can be x, y, z,
  id, lt, ut) at the side of the frame specified by #a2, which may stand
  for t (top), b (bottom), lh (left, horizontal), rh (right,
  horizontal), lv (left, vertical) and rv (right, vertical).
| ``plot cap #a off #r`` : Offset caption #a by #r from the edge of the
  viewport, where #r is in units of the character height. Enter negative
  values to write inside the viewport.
| ``plot cap #a coord #r`` : Plot caption #a along the specified edge of
  the viewport, in units of the viewport length, where
  :math:`0.0 \le\mathrm{\#r}\le 1.0`.
| ``plot cap #a fjust #r`` : Controls justification of the caption #a
  parallel to the specified edge of the viewport. If #r = 0.0, the left
  hand of #a will be placed at the position specified by "coord" above;
  if #r = 0.5, the center of the string will be placed at "coord", if #r
  = 1.0 the right hand of #a will be placed at "coord". Other values can
  be used but are less useful.
| ``plot string new #r1 #r2 #a`` : Plot a new string with text as
  specified in #a at x=#r1 and y = #r2. See
  :ref:`sect:plottext` for more details about text
  strings. Also do not forget to put #a between "" if it consists of
  more than one word (i.e., if it contains spaces).
| ``plot string del #i:`` : Delete string numbers specified by the range
  #i from the plot.
| ``plot string #i: disp #l`` : If true (default), display the strings
  specified by the range #i:.
| ``plot string #i: text #a`` : Change the text of strings #i: to #a
| ``plot string #i1: col #i2`` : Set the colours of strings #i1: to #i2
| ``plot string #i1: back #i2`` : Set the background colour for the
  strings #i1: to the value #i2.
| ``plot string #i1: lw #i2`` : Set the line weight of strings #i1: to
  #i2.
| ``plot string #i: fh #r`` : Set the font height of strings #i to #r.
| ``plot string #i1: font #i2`` : Set the font style of strings #i1 to
  #i2.
| ``plot string #i: x #r`` : Set the x position of strings #i: to #r.
| ``plot string #i: y #r`` : Set the y position of string #i: to #r.
| ``plot string #i: angle #r`` : Set the angle of strings #i: to #r.
| ``plot string #i: fjust #r`` : Controls justification of the strings
  #i: parallel to the specified edge of the viewport. If #r = 0.0, the
  left hand of the strings will be placed at the position specified by
  "x y" above; if #r = 0.5, the center of the strings will be placed at
  "x y", if #r = 1.0 the right hand of #i: will be placed at "x y".
  Other values can be used but are less useful.
| ``plot string #i: box #l`` : If #l is true, plot a box around the text
  strings #i:. The default value is false (no box).
| ``plot string #i1: box lt #i2`` : Set the line style of the box around
  the strings #i1: to the value #i2.
| ``plot string #i1: box lw #i2`` : As above, but for the line weight
  specified by #i2.
| ``plot string #i1: box col #i2`` : As above, but for the colour index
  for the box specified by #i2.
| ``plot set #i:`` : Selects data set numbers as specified by #i:.
  Afterwards most plot commands will only affect data sets #i:
| ``plot set all`` : Selects all data sets that are present. All
  subsequent plot commands will be executed for all data sets.
| ``plot line disp #l`` : If #l is true, plots a connecting line through
  the data points, (default is false).
| ``plot line col #i`` : Set the colour of the connecting line to #i.
| ``plot line lt #i`` : Set the line style of the connecting line to #i.
| ``plot line lw #i`` : Set the line weight of the connecting line to
  #i.
| ``plot line his #l`` : If #l is true, plot the connecting line in
  histogram format (default is true).
| ``plot elin disp #l`` : If #l is true, plots a connecting line through
  the end points of the error bars, (default depends upon the plot
  type).
| ``plot elin col #i`` : Set the colour of the connecting line through
  the end points of the error bars to #i.
| ``plot elin lt #i`` : Set the line style of the connecting line
  through the end points of the error bars to #i.
| ``plot elin lw #i`` : Set the line weight of the connecting line
  through the end points of the error bars to #i.
| ``plot elin his #l`` : If #l is true, plot the connecting line through
  the end points of the error bars in histogram format (default is
  true).
| ``plot model disp #l`` : If #l is true, plot the current model
  corresponding to the relevant data set (default is true).
| ``plot model col #i`` : Set the colour of the model to number #i.
| ``plot model lt #i`` : Set the line style of the model to number #i.
| ``plot model lw #i`` : Set the line weight of the model to number #i.
| ``plot model his #l`` : If #l is true, plot the model in histogram
  format (default is true).
| ``plot back disp #l`` : If #l is true, plot the subtracted background
  (default is true).
| ``plot back col #i`` : Set the colour of the subtracted background to
  number #i.
| ``plot back lt #i`` : Set the line style of the subtracted background
  to number #i.
| ``plot back lw #i`` : Set the line weight of the subtracted background
  to number #i.
| ``plot back his #l`` : If true, plot the subtracted background in
  histogram format (default is true).
| ``plot fill disp #l`` : If #l is true, fill the curve below the model
  with the colour specified by the next command or the default colour.
| ``plot fill col #i`` : Change the filling colour to #i.
| ``plot fill lt #i`` : Change the line type of the filling lines to #i.
| ``plot fill lw #i`` : Change the line weight of the filling lines to
  #i.
| ``plot fill style #i`` : Change the style of the filling lines to the
  value #i. Here #i has values between 1–4, with the following meaning:
  1 = solid filling (default), 2 = outline, 3 = hatched, 4 =
  cross-hatched.
| ``plot fill angle #r`` : Set the angle for the filling lines for
  hatched filling. Default is 45 degrees.
| ``plot fill sep #r`` : Set the distance between the filling lines for
  hatched filling. The unit spacing is 1 % of the smaller of the height
  or width of the viewing surface. This should not be zero.
| ``plot fill phase #r`` : The phase between the hatch lines that fill
  the area.
| ``plot data disp #l`` : If #l is true, display the data.
| ``plot data errx #l`` : If #l is true, display the error bars in the
  x-direction.
| ``plot data erry #l`` : If #l is true, display the error bars in the
  y-direction.
| ``plot data col #i`` : Give the data colour index #i.
| ``plot data lt #i`` : Give the data line style #i.
| ``plot data lw #i`` : Give the data line weight #i.
| ``plot data fh #r`` : Give the symbols for the data font height #r.
| ``plot data symbol #i`` : Plot the data with symbol number #i. For
  symbol numbers, see :ref:`sect:plotmarkers`.
| ``plot adum #a [overwrite] [append]`` : Dump the data and model in the
  plot in an ascii file with filename #a. The extension ".qdp" will
  automatically be appended. Note that the data will be written as they
  are, i.e. if you have a logarithmic x-axis or y-axis, the logs of the
  plotted quantities will be written. If you want to replot your data
  later with for example the qdp package, take care that you plot the
  data in SPEX on a lin-lin frame before you execute the "plot adum"
  command. Also note that the data will be written in the units that
  were specified in the plot (energy, wavelength or whatever is
  applicable. If the optional "append" keyword is present, the data will
  be appended to any existing file with the name #a; if the optional
  "overwrite" keyword is present, any pre-existing file with the name #a
  will be overwritten by the new data.

Examples
~~~~~~~~

| ``plot device xs`` : Open the graphic device xs (xserver)
| ``plot device ps myplot.ps`` : Select a postscript device connected to
  the file name myplot.ps
| ``plot type data`` : Plot the data on the selected graphics device(s)
| ``plot ux angstrom`` : Set the x-axis plot units to Å
| ``plot uy angstrom`` : Set the y-axis plot units to Counts/s/Å
| ``plot frame new`` : Open a new frame in the selected graphics
  device(s)
| ``plot frame 2`` : Go to the 2nd frame, all plot commands will now
  only affect frame 2
| ``plot type chi`` : Plot the residuals in frame 2
| ``plot uy rel`` : Set the y-axis plot units in frame 2 to (Observed -
  Model)/Model
| ``plot view default f`` : Set the default viewport keyword to false so
  that new user viewport values can be specified for frame 2
| ``plot view y 0.2:0.8`` : Set the y viewport limits of frame 2 from
  0.2 to 0.8 of the full device window
| ``plot cap id disp f`` : Do not display the id caption of frame 2
| ``plot cap ut disp f`` : Do not display the upper top caption of frame
  2
| ``plot cap lt disp f`` : Do not display the lower top caption of frame
  2
| ``plot ux a`` : Set the x-axis plot units of frame 2 to Å
| ``plot ux 21.602 ang`` : Plot the x-axis as velocity in
  :math:`\mathrm{km}^{-1}` relative to a wavelength of 21.602 Å.
| ``plot ry -1:1`` : Set the y-axis plot range of frame 2 to between a
  lower limit of -1 and an upper limit of 1
| ``plot frame 1`` : Go to frame 1
| ``plot view default f`` : Set the default viewport keyword to false so
  that new user viewport values can be specified for frame 1
| ``plot view x 0.25:0.75`` : Set the x viewport limits of frame 1 from
  0.25 to 0.75 of the full device window
| ``plot de cps filename.ps`` : Open a colour postscript graphics device
  and write the output file to filename.ps
| ``plot`` : Redraw the plot on all frames and devices
| ``plot close 2`` : Close device number 2, which is the postscript
  device in this case
