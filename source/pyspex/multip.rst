.. _pyspex_multip:

Multiprocessing with PYSPEX
===========================

As described in :ref:`pyspex_session`, a PYSPEX session can only be started once, at least per process or thread. This
can be an annoying limitation if you want to run several SPEX sessions at once. This problem can be partly circumvented
by using the ``multiprocessing`` module of Python. This module is able to run functions in parallel with different
input parameters.

So, if you have a problem that requires you to run SPEX multiple times with a very similar setup, but different input
parameters, then this thread may be helpful to you.

The following script calculates the spectrum emitted by a CIE plasma for four different temperatures. This is
just a simple example. This particular problem can be calculated more efficiently in a different way, but this shows
the potential of the ``multiprocessing`` module if you need to do more complicated calculations.

First, we show the full script::

    #!/usr/bin/env python

    from multiprocessing import Pool
    from pyspex.spex import Session

    # Define the function that calls pyspex
    # and does the calculation and/or
    # analysis that you want

    def ciecalc(kt):
        # Start the SPEX session
        s = Session()

        # Load a CIE model and choose
        # the SPEXACT version 3 database
        s.com('cie')
        s.var_calc(True)

        # Set the temperature of the plasma
        s.par(1,1,'t',kt[0])

        # Calculate the model
        s.calc()

        # Save the output spectral model
        # to a FITS file
        (pl, plt) = s.plot_model(show=False)
        pl.sector[0].tabmodel.write('cie_{0}.fits'.format(kt[0]),
                                    format='fits', overwrite=True)

        # Close this SPEX session gently
        s.__del__()


    # The function below is executed when this
    # script is executed from the terminal:

    if __name__ == "__main__":

        # Maximum number of processes to
        # create at once
        nproc = 2

        # The temperatures for which to
        # calculate the CIE spectrum
        kt = (0.5, 1.0, 2.0, 4.0)

        # Pack the input parameters into one
        # iterable variable
        arg = zip(kt)

        # Create a new pool of processes (nproc)
        pool = Pool(processes=nproc, maxtasksperchild=1)

        # Call the ciecalc function with each argument
        pool.map(ciecalc, arg)

        # Close the pool
        pool.close()
        pool.join()

Next, we will discuss the details of each part of this script.

Needed Python modules
---------------------

For this script, PYSPEX is obviously needed and is imported as usual. The other module is ``multiprocessing.Pool``,
which will handle the multiprocessing for us (see also `Python multiprocessing
<https://docs.python.org/3/library/multiprocessing.html>`_)::

    from multiprocessing import Pool
    from pyspex.spex import Session

The ciecalc function
--------------------

The function ``ciecalc`` is our worker function here. This means that this function will start a PYSPEX session,
executes a number of SPEX commands (based on the input arguments), and produces a result. In this case, we
add one CIE component, set a temperature read from the function input arguments, and calculate the spectrum.
In the last step, we get the calculated spectrum from a model plot and save it to FITS format. The temperature
value is included in the output filename.

It is important here to have the start of the PYSPEX session ``s=Session()`` inside the function. Remember that
you can only have one Session per process, so this needs to be defined in each process separately to make PYSPEX
run in parallel.

In this example, we just vary the temperature in each calculation, but this can be expanded to more variables
or options. There are multiple ways of approaching this:

1. You create a worker function with multiple arguments (see `starmap
   <https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool.starmap>`_).
2. You pack the variables in an object such that you can pass that object to the function. This object could be
   a Python list or dictionary, or a custom object that you define. The function should be able to read the
   variables and instructions from the input object.
3. You pass a filename of a SPEX ``.com`` file or other configuration file at each iteration.

Make sure to call the ``s.__del__()`` at the very end of your function to close SPEX gently at the end. This
will delete all the ``*.dum`` files as well.

Set up multiprocessing
----------------------

The ``nproc`` variable specifies the number of processes to run at the same time. Choose this parameter wisely
based on the number of processors and amount of RAM memory in your computer. Also keep in mind that one PYSPEX
session may also use multiple processors at the same time.

  .. warning:: Please take care that you do not set ``nproc`` too high. A PYSPEX run can use between 1 and 4 GB
               of RAM memory. If you do not have a lot of RAM, then these processes can make your system extremely
               slow or even crash.

It may be helpful to limit the number of cores used for each process. This can be done by setting the environment
variable `OMP_NUM_THREADS`. For example, if you have a computer with 16 cores and 32 GB of RAM memory, the optimal
setting would be ``nproc=4`` and ``export OMP_NUM_THREADS=4``. Or::

    import os
    os.environ["OMP_NUM_THREADS"] = "4"

Having 4 processes which can use 4 cores each gives you 16 cores at maximum, which is exactly the processor
specification. Assuming that each of the 4 processes uses 4 GB of memory at maximum, the total memory usage of 16GB
should fit easily on the available RAM memory chips.

The line that creates the pool of processes (``pool = Pool(processes=nproc, maxtasksperchild=1)``) needs a very
important option. The ``maxtasksperchild=1`` option tells the pool that each function needs to be performed in a
separate process. This ensures that the ``s = Session()`` command is only given once in each process.

The ``pool.map(ciecalc, arg)`` line divides the tasks over the different processes and passes the arguments (``arg``)
to the ``ciecalc`` function. The ``arg`` variable needs to contain an iterable list or array. The ``zip`` function
can help to create a multi-dimensional array with input arguments if necessary. See also the `starmap
<https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool.starmap>`_ function to pass multiple
arguments to the worker function.

The ``pool.close()`` and ``pool.join()`` functions make sure that the processes are properly closed and that their
output is merged (if applicable).

The script above can be saved as ``pyspexmp.py`` and executed from the command line::

    python pyspexmp.py

You should see multiple welcome messages from SPEX on your screen indicating that multiple instances of
SPEX are running.

Final thoughts
--------------

The method above is especially suitable for repeating long and more complicated PYSPEX sessions. Since the SPEX
is restarted each time a process starts, you will lose a couple of seconds. Therefore, this is only efficient if
the runtime of one iteration is much longer than a couple of seconds.

The ``multiprocessing`` module has many more options which may serve your needs. As long as you have only one SPEX
session per process, everything should run well.
