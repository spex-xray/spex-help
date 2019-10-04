Import UV/Optical data
======================

For some applications it would be helpful to include non-X-ray data into
the spectral fit. For example, this can be an optical/UV spectrum that
the user wants to fit simultaneously with the X-ray spectrum using the
models of SPEX.

For some instruments, namely the photometric filters of XMM-Newton's OM
and Swift's UVOT, the data products are available in the same format as
the X-ray data (i.e. the OGIP-standard PHA and response files). Therefore,
for OM and UVOT filters, the user is recommended to convert the PHA and
response files to SPEX format using TRAFO as normally done for the X-ray
data.

Information about the instrumental response files of OM and UVOT filters
can be found here:

https://www.cosmos.esa.int/web/xmm-newton/om-response-files

https://swift.gsfc.nasa.gov/proposals/swift_responses.html

However, for some other instruments the user may not know, or have access,
to the counts and instrumental response information. For example, the user
obtained optical/UV fluxes from NED or a table in a paper. In such cases
the user is recommended to first use the FTOOLS program called ``ftflx2xsp``
to convert their data to the OGIP-standard PHA and response files. The
webpage of ``ftflx2xsp`` provides all the instructions with some useful examples:

https://heasarc.nasa.gov/lheasoft/ftools/fhelp/ftflx2xsp.html

This program reads a text file containing the spectrum with the specified units,
and creates the corresponding PHA and RSP files. These files can be then converted
to SPEX format using TRAFO as usual.