.. _sec:menu:

Menu: Menu settings
===================

Overview
~~~~~~~~

When command lines are typed, it frequently happens that often the first
keywords are identical for several subsequent lines. This may happen for
example when a plot is edited. SPEX offers a shortcut to this by using
the menu command.

Syntax
~~~~~~

The following syntax rules apply:

| ``menu none`` : Quit the current menu text settings (i.e., return to
  the default spex prompt).
| ``menu text #a`` : For all following commands, the text string #a will
  be appended automatically before the following commands.

Examples
~~~~~~~~

| ``menu text plot`` : All following commants will get the "plot"
  keyword put in front of them. So if the next commant would be "plot
  dev xs" it is sufficient to type "dev xs" instead.
| ``menu none`` : Return to the normal SPEX prompt.
| ``menu text "par 1 2"`` : All following commands wil get the "par 1 2"
  keywords put in front of them. The next command could be "t val 4.",
  which will be expanded to the full "par 1 2 t val 4." to set the
  temperature of sector 1, component 2 to 4 keV. Note that here the text
  has three keywords (par, 1, 2) and hence it has to be put between "",
  to indicate that it is a single text string. If there is only one
  keyword, these "" are not necessary.
