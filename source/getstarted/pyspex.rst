.. _sec:installpyspex:

Install the SPEX Python interface
---------------------------------

.. highlight:: none

The SPEX python interface depends on a quite specific python environment. Using `conda
<https://docs.conda.io/en/latest/miniconda.html>`_, you can create this environment pretty
quickly. Please make sure you have (mini)conda installed and initialized on your machine before you continue.

Binary installation
^^^^^^^^^^^^^^^^^^^

The easiest option to install the Python interface for SPEX is by downloading the SPEX binary
version for your platform. See and follow the instruction in :ref:`sec:install`.

Once the standard SPEX environment is set up using the ``spexdist.sh`` or ``spexdist.csh`` files,
it is time to build the conda environment. This can be done using the ``spex.yml`` file provided in the SPEX directory.
Please enter the following command::

    (base) unix:~/SPEX> conda env create -f $SPEX90/python/spex.yml

This creates the ``spex`` conda environment for you. This step should only be done once.

.. Note:: If you installed SPEX through the Mac package installer, then ``spex.yml`` is not located in a writeable
   directory. Please copy ``spex.yml`` first to your home directory (``cp /opt/spex/python/spex.yml ~/``) and then
   create the conda environment like: ``conda env create -f ~/spex.yml``.

If successful, you can from now on activate the environment with the command::

    (base) unix:~/SPEX> conda activate spex

And from now on, you can use the python interface in SPEX::

    (spex) unix:~/SPEX> python
    Python 3.5.6 |Anaconda, Inc.| (default, Aug 26 2018, 21:41:56)
    [GCC 7.3.0] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> from pyspex.spex import Session
    >>> s=Session()
     Welcome user to SPEX version 3.06.01

     NEW in this version of SPEX:
    22-07-2020 Bugfix: neij gives line emission while abundance is zero.
    18-08-2020 Changed reference density from electron density to hydrogen density.
    04-09-2020 Added pyroxene back to the amol model.
    23-10-2020 Update of H I collision strengths (IMPORTANT)
    24-11-2020 Added ascdump and par_show functions for the Python interface.

     Currently using SPEXACT version 2.07.00. Type `help var calc` for details.
    >>>

If you need other python packages for your project, you can install them through conda in
your new ``spex`` environment.

Compile Python interface for SPEX
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you do not want to use conda, you can also compile the Python interfaces for SPEX. This can be done
either through a compile script called ``compile.py`` or manually with CMake by adding the option ``-DPYTHON=2`` or
``-DPYTHON=3`` depending on the python version. The use of Python 3 is strongly recommended. See :ref:`sec:compile`
for details.

Integration into iPython and Jupyter Notebook
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Next to the dependencies installed in the conda environment ``spex``, the Python interface also depends on the SPEX
environment variables set with the spexdist.(c)sh files. So before running iPython or Jupyter notebook, it is
necessary to source the SPEX environment (also make sure the conda ``spex`` environment is activated)::

    (spex) unix:~> source /opt/spex/spexdist.sh

(replace /opt/spex in this path with the location of SPEX on your machine, or $SPEX90 if this variable is already set).

It may be that iPython and Jupyter are not yet installed in your conda environment. If not, please install them using
the command::

    (spex) unix:~> conda install jupyter_client ipykernel

With iPython and Jupyter notebook, it can be helpful to install the spex conda environment explicitly for your project::

    (spex) unix:~> ipython kernel install --user --name=spex

In your Jupyter notebook, you can now select ``spex`` from the drop-down menu if you are creating a new project. The
``spex`` conda environment should now be linked to your Jupyter project.
