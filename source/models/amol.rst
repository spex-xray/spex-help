Amol: interstellar dust absorption model
============================================

This model calculates the transmission of various molecules considering both 
absorption and scattering. The extinction models are evaluated for grains 
with a standard MRN size distribution (`Mathis & Rumpl & Nordsieck, 1977
<https://ui.adsabs.harvard.edu/abs/1977ApJ...217..425M/abstract>`_): 
:math:`n(a)\\propto a^{−3.5}` with *a* the grain size and 
:math:`a_{min}=0.005\ \\mu`\ m and :math:`a_{max}=0.25\ \\mu`\ m. 
Most of the extinction profiles are based on laboratory measurements. For 
further details see `Zeegers et al. (2017)
<https://ui.adsabs.harvard.edu/abs/2017A%26A...599A.117Z/abstract>`_,
`Rogantini et al. (2018)
<https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_, 
`Costantini et al. (2019)
<https://ui.adsabs.harvard.edu/abs/2019A%26A...629A..78C/abstract>`_,
`Zeegers et al. (2019)
<https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_ 
and `Rogantini et al. (2019)
<https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_.
  

The following compounds are presently taken into account (see
Table :ref:`xride-table`). 

.. |Fe7S8| replace:: Fe\ :sub:`7`\ S\ :sub:`8`
.. |SiO2| replace:: SiO\ :sub:`2`

.. _xride-table:

.. table:: Extinction models implemented in amol.

   =========  ===================== ====================================================================== ============= ==================== ===============================================
   index      Name                  formula                                                                Form          Edge                 Source        
   =========  ===================== ====================================================================== ============= ==================== ===============================================
   115        c-silicon             Si                                                                     crystalline   Si 1s                `Chang et al. (1999) <https://ui.adsabs.harvard.edu/abs/1999JAP....86.5609C/abstract>`_      
   127        metallic iron         Fe                                                                     crystalline   Fe 1s                `exafsmaterials.com <http://exafsmaterials.com/Ref_Spectra_0.4MB.pdf>`_
   129        metallic nickel       Ni                                                                     crystalline   Ni 1s                `Van Loon et al. (2015) <https://www.ncbi.nlm.nih.gov/pubmed/25859648>`_    
   130        a-carbon              C                                                                      amorphous     C 1s                 `Albella et al. (1998) <https://digital.library.unt.edu/ark:/67531/metadc668006/>`_    
   131        diamond               C                                                                      crystalline   C 1s                 `Albella et al. (1998) <https://digital.library.unt.edu/ark:/67531/metadc668006/>`_    
   132        graphite              C                                                                      crystalline   C 1s                 `Albella et al. (1998) <https://digital.library.unt.edu/ark:/67531/metadc668006/>`_    
   2111       c-silicon carbide     SiC                                                                    crystalline   Si 1s                `Chang et al. (1999) <https://ui.adsabs.harvard.edu/abs/1999JAP....86.5609C/abstract>`_      
   2230       troilite              FeS                                                                    crystalline   S 1s; Fe 1s          `esrf.eu <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_, `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_     
   2231       pyrrhotite            |Fe7S8|                                                                crystalline   S 1s; Fe 1s          `esrf.eu <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_, `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_     
   2232       a-quartz              |SiO2|                                                                 amorphous     Si 1s                `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_    
   2233       c-quartz              |SiO2|                                                                 crystalline   Si 1s                `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_     
   2234       a-quartz              |SiO2|                                                                 disorder      Si 1s                `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   2235       c-silicon nitride     Si\ :math:`_3`\ N\ :math:`_4`                                          crystalline   Si 1s                `Chang et al. (1999) <https://ui.adsabs.harvard.edu/abs/1999JAP....86.5609C/abstract>`_      
   2236       magnesia              MgO                                                                    crystalline   Si 1s                `Fukushi et al. (2017) <https://ui.adsabs.harvard.edu/abs/2017GeCoA.213..457F/abstract>`_     
   2237       aluminium oxide       Al\ :math:`_2`\ O\ :math:`_3`                                          crystalline   Al 1s                `Costantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...629A..78C/abstract>`_    
   2238       alabandite            MnS                                                                    crystalline   S 1s                 `esrf.eu <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_           
   2239       pyrite                FeS\ :math:`_2`                                                        crystalline   S 1s                 `esrf.eu <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_             
   2240       titanium dioxide      TiO\ :math:`_2`                                                        crystalline   Ti 1s                `Shin et al. (2013) <https://pubs.rsc.org/en/content/articlelanding/2013/EE/C2EE22739H#!divAbstract>`_          
   2241       a-hydrocarbon         CH                                                                     amorhpous     C 1s                 `Bonnin-Mosbah et al. (2002) <https://ui.adsabs.harvard.edu/abs/2002AcSpe..57..711B/abstract>`_  
   3230       c-forsterite          Mg\ :math:`_2`\ SiO\ :math:`_4`                                        crystalline   Mg 1s; Si 1s         `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_    
   3231       a-enstatite           MgSiO\ :math:`_3`                                                      amorphous     Mg 1s; Si 1s         `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   3232       a-enstatite           MgSiO\ :math:`_3`                                                      crystalline   Mg 1s; Si 1s         `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   3233       c-spinel              MgAl\ :math:`_2`\ O\ :math:`_4`                                        crystalline   Mg 1s; Al 1s         `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Costantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...629A..78C/abstract>`_
   3270       calcium aluminate     CaAl\ :math:`_2`\ O\ :math:`_4`                                        crystalline   Ca 1s                `Neuville et al. (2007) <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_
   3271       tri-Ca aluminate      Ca\ :math:`_3`\ Al\ :math:`_2`\ O\ :math:`_6`                          crystalline   Ca 1s                `Neuville et al. (2007) <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_    
   3302       c-fayalite            Fe\ :math:`_2`\ SiO\ :math:`_4`                                        crystalline   Si 1s; Fe 1s; Fe 2p  `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `Lee et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_, `Lee et al. (2009) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_     
   4230       a-olivine             MgFeSiO\ :math:`_4`                                                    amorphous     Mg 1s; Si 1s         `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_    
   4231       c-olivine             Mg\ :math:`_1.56`\ Fe\ :math:`_0.4`\ Si\ :math:`_0.91`\ O\ :math:`_4`  crystalline   Mg 1s; Si 1s; Fe 1s  `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4232       c-En60Fe40            Mg\ :math:`_0.6`\ Fe\ :math:`_0.4`\ SiO\ :math:`_3`                    crystalline   Mg 1s; Si 1s; Fe 1s  `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4233       a-En60Fe40            Mg\ :math:`_0.6`\ Fe\ :math:`_0.4`\ SiO\ :math:`_3`                    amorphous     Mg 1s; Si 1s; Fe 1s  `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4234       a-En75Fe25            Mg\ :math:`_0.75`\ Fe\ :math:`_0.25`\ SiO\ :math:`_3`                  amorphous     Mg 1s; Si 1s         `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   4235       a-En90Fe10            Mg\ :math:`_0.9`\ Fe\ :math:`_0.1`\ SiO\ :math:`_3`                    amorphous     Mg 1s; Si 1s; Fe 1s  `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4236       c-En90Fe10            Mg\ :math:`_0.9`\ Fe\ :math:`_0.1`\ SiO\ :math:`_3`                    crystalline   Mg 1s; Si 1s; Fe 1s  `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4237       c-hypersthene         Mg\ :math:`_1.502`\ Fe\ :math:`_0.498`\ Si\ :math:`_2`\ O\ :math:`_6`  crystalline   Mg 1s; Si 1s; Fe 1s  `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_ 
   4270       c-diopside            MgCaSi\ :math:`_2`\ O\ :math:`_6`                                      crystalline   Ca 1s                `Neuville et al. (2007) <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_    
   4271       a-diopside            MgCaSi\ :math:`_2`\ O\ :math:`_6`                                      amorphous     Ca 1s                `Neuville et al. (2007) <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_   
   4272       c-anorthite           CaAl\ :math:`_2`\ Si\ :math:`_2`\ O\ :math:`_8`                        crystalline   Ca 1s                `Neuville et al. (2007) <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_
   =========  ===================== ====================================================================== ============= ==================== ===============================================
     
Additional molecules are listed in Table :ref:`additional-compounds`. 
These older model do not included scattering and were not integrate over a size 
distribution. These models will be updated in future versions.

.. _additional-compounds:

.. table:: Additional compounds present in the amol model.

   ========== =================== ========================================================================================================================================= =============== =====
   108        molecular oxygen    O\ :math:`_2`                                                                                                                             O 1s            `Barrus et al. (1979) <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_
   126        metallic iron       Fe                                                                                                                                        Fe 2p           `Lee et al. (2009) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2001       water               H\ :math:`_2`\ O                                                                                                                          O 1s            `Hiraya et al. (2001) <https://ui.adsabs.harvard.edu/abs/2001PhRvA..63d2705H/abstract>`_
   2002       crystalline ice     H\ :math:`_2`\ O                                                                                                                          O 1s            `Parent et al. (2002) <https://ui.adsabs.harvard.edu/abs/2002JChPh.11710842P/abstract>`_
   2003       amorphous ice       H\ :math:`_2`\ O                                                                                                                          O 1s            `Parent et al. (2002) <https://ui.adsabs.harvard.edu/abs/2002JChPh.11710842P/abstract>`_
   2010       carbon monoxide     CO                                                                                                                                        O 1s            `Barrus et al. (1979) <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_
   2011       carbon dioxide      CO\ :math:`_2`                                                                                                                            O 1s            `Barrus et al. (1979) <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_
   2020       laughing gas        N\ :math:`_2`\ O                                                                                                                          O 1s            `Barrus et al. (1979) <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_, `Wight et al. (1974) <https://doi.org/10.1016/0368-2048(74)80010-1>`_
   2102       silicon monoxide    SiO                                                                                                                                       Si 1s           `Lee et al. (2010) <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_
   2200       eskolaite           Cr\ :math:`_2`\ O\ :math:`_3`                                                                                                             O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   2300       iron monoxide       FeO                                                                                                                                       Fe 1s           `Lee et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2301       iron oxide          Fe\ :math:`_{1-x}`\ O                                                                                                                     O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   2302       magnetite           Fe\ :math:`_3`\ O\ :math:`_4`                                                                                                             O, Fe 1s        `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_, `Lee et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2303       hematite            Fe\ :math:`_2`\ O\ :math:`_3`                                                                                                             O, Fe 1s; Fe 2p `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_, `Lee et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_, `Lee et al. (2009) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2304       iron sulfite        FeS\ :math:`_2`                                                                                                                           Fe 1s           `Lee et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2400       nickel monoxide     NiO                                                                                                                                       O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   2500       cupric oxide        CuO                                                                                                                                       O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   3001       adenine             C\ :math:`_5`\ H\ :math:`_5`\ N\ :math:`_5`                                                                                               O 1s            `Fujii et al. (2003) <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   3103       pyroxene            MgSiO\ :math:`_3`                                                                                                                         O 1s            `Lee et al. (2008) <https://www.pnas.org/content/105/23/7925>`_
   3200       calcite             CaCO\ :math:`_3`                                                                                                                          Ca 1s           `Hayakawa et al. (2008) <https://www.jstage.jst.go.jp/article/analsci/24/7/24_7_835/_article/-char/ja>`_
   3201       aragonite           CaCO\ :math:`_3`                                                                                                                          Ca 1s           `Hayakawa et al. (2008) <https://www.jstage.jst.go.jp/article/analsci/24/7/24_7_835/_article/-char/ja>`_
   3202       vaterite            CaCO\ :math:`_3`                                                                                                                          Ca 1s           `Hayakawa et al. (2008) <https://www.jstage.jst.go.jp/article/analsci/24/7/24_7_835/_article/-char/ja>`_
   3203       perovskite          CaTiO\ :math:`_3`                                                                                                                         O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   3300       hercynite           FeAl\ :math:`_2`\ O\ :math:`_4`                                                                                                           O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   3301       lepidocrocite       FeO(OH)                                                                                                                                   Fe 2p           `Lee et al. (2009) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   3303       iron sulfate        FeSO\ :math:`_4`                                                                                                                          Fe 2p           `Lee et al. (2009) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   3304       ilmenite            FeTiO\ :math:`_3`                                                                                                                         O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   3305       chromite            FeCr\ :math:`_2`\ O\ :math:`_4`                                                                                                           O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4001       guanine             C\ :math:`_5`\ H\ :math:`_5`\ N\ :math:`_5`\ O                                                                                            O,N 1s          `Fujii et al. (2003) <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   4002       cytosine            C\ :math:`_4`\ H\ :math:`_5`\ N\ :math:`_3`\ O                                                                                            O,N 1s          `Fujii et al. (2003) <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   4003       thymine             C\ :math:`_5`\ H\ :math:`_6`\ N\ :math:`_2`\ O\ :math:`_2`                                                                                O,N 1s          `Fujii et al. (2003) <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   4004       uracil              C\ :math:`_4`\ H\ :math:`_4`\ N\ :math:`_2`\ O\ :math:`_2`                                                                                O,N 1s          `Fujii et al. (2003) <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   4100       andradite           Ca\ :math:`_3`\ Fe\ :math:`_2`\ Si\ :math:`_3`\ O\ :math:`_{12}`                                                                          O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4101       acmite              NaFeSi\ :math:`_2`\ O\ :math:`_6`                                                                                                         O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4102       franklinite         Zn\ :math:`_{0.6}`\ Mn\ :math:`_{0.8}`\ Fe\ :math:`_{1.6}`\ O\ :math:`_4`                                                                 O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4103       olivine             Mg\ :math:`_{1.6}`\ Fe\ :math:`_{0.4}`\ SiO\ :math:`_4`                                                                                   O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4104       almandine           Fe\ :math:`_3`\ Al\ :math:`_2`\ (SiO\ :math:`_4`)\ :math:`_3`                                                                             O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4105       hedenbergite        CaFeSi\ :math:`_2`\ O\ :math:`_6`                                                                                                         O 1s            `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   6001       montmorillonite     Na\ :math:`_{0.2}`\ Ca\ :math:`_{0.1}`\ Al\ :math:`_2`\ Si\ :math:`_4`\ O\ :math:`_{10}`\ (OH\ :math:`_2`)\ (H\ :math:`_2`\ O)\       
                                  :math:`_{10}`                                                                                                                             Si 1s           `Lee et al. (2010) <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_
   6002       nontronite          Na\ :math:`_{0.3}`\ Fe\ :math:`_2^{3+}`\ Si\ :math:`_3`\ AlO\ :math:`_{10}`\ (OH)\ :math:`_2` :math:`\bullet` (H\ :math:`_2`\ O)          Si 1s           `Lee et al. (2010) <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_
   7001       enstatite_paulite   Ca\ :math:`_2`\ Mg\ :math:`_4`\ Al\ :math:`_{0.75}`\ Fe\ :math:`_{0.25}`\ (Si\ :math:`_7`\ AlO\ :math:`_{22}`)(OH)\ :math:`_2`              Si 1s         `Lee et al. (2010) <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_
   ========== =================== ========================================================================================================================================= =============== =====

The chemical composition of these minerals was mainly taken from the
Mineralogy Database of David Barthelmy [1]_. We
take the cross-sections from the references as listed in
`the table above <#tab:amol>`__ in the energy interval where these
are given, and use the cross section for free atoms `Verner & Yakovlev (1995)
<https://ui.adsabs.harvard.edu/abs/1995A%26AS..109..125V/abstract>`_
outside this range.

`Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
do not list the precise composition of iron oxide. We assume here that :math:`x=0.5`.

Some remarks about the data from `Barrus et al. (1979)
<https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_: not
all lines are given in their tables, because they suffered from
instrumental effects (finite thickness absorber combined with finite
spectral resolution). However, `Barrus et al. (1979)
<https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_ have
estimated the peak intensities of the lines based on measurements with
different column densities, and they also list the FWHM of these
transitions. We have included these lines in the table of cross sections
and joined smoothly with the tabulated values.

For N\ :math:`_2`\ O, the fine structure lines are not well resolved by
`Barrus et al. (1979) <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_.
Instead we take here the relative peaks
from `Wight et al. (1974) <https://doi.org/10.1016/0368-2048(74)80010-1>`_,
that have a relative ratio of 1.00
: 0.23 : 0.38 : 0.15 for peaks 1, 2, 3, and 4, respectively. We adopted
equal FWHMs of 1.2 eV for these lines, as measured typically for line 1
from the plot of Wight. We scale the intensities to the peak listed by
`Barrus et al. (1979) <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_.

Further, we subtract the C and N parts of the cross section as well as
the oxygen 2s/2p part, using the cross sections of `Verner & Yakovlev (1995)
<https://ui.adsabs.harvard.edu/abs/1995A%26AS..109..125V/abstract>`_.
At low energy, a very small residual
remains, that we corrected for by subtracting a constant fitted to the
510–520 eV range of the residuals. The remaining cross section at 600 eV
is about 10 % above the Verner cross section; it rapidly decreases; we
approximate the high-E behaviour by extrapolating linearly the average
slope of the ratio between 580 and 600 eV to the point where it becomes
1. The remaining cross section at 600 eV is about 10% above the
`Verner & Yakovlev (1995) <https://ui.adsabs.harvard.edu/abs/1995A%26AS..109..125V/abstract>`_
cross section; it rapidly decreases; we
approximate the high-E behaviour therefore by extrapolating linearly the
average slope of the ratio between 580 and 600 eV to the point where it
becomes 1.

.. Warning:: The normalisation is the total *molecular* column density.
   Thus, a value of :math:`10^{-7}` for CO\ :math:`_2` means
   :math:`10^{21}` CO\ :math:`_2` molecules :math:`\mathrm{m}^{-2}`, but of course
   :math:`2\times 10^{21}` O atoms :math:`\mathrm{m}^{-2}`, because each
   CO\ :math:`_2` molecule contains 2 oxygen atoms.

.. Warning:: The Tables above shows for which edges and atoms the XAFS
   are taken into account. For all other edges and atoms not listed there,
   we simply use the pure atomic cross-section (without absorption lines).
   Note that for almost all constituents this may give completely wrong
   cross sections in the optical/UV band, as at these low energies the
   effects of chemical binding, crystal structure etc. are very important
   for the optical transmission constants. This is contrary to the
   SPEX models for pure atomic or ionised gas, where our models can be used
   in the optical band.

.. Warning:: It is possible to change the values of the output atomic
   column densities of H–Zn, that are shown when you issue the "show par"
   command of SPEX. However, SPEX completely ignores this and when you
   issue the "calc" or "fit" commands, they will be reset to the proper
   values. Morale: just read of those parameters, don’t touch them!

The parameters of the model are:

| ``n1--n4`` : Molecular column density in
  :math:`10^{28}` :math:`\mathrm{m}^{-2}` for molecules 1–4. Default value:
  :math:`10^{-6}` for molecule 1, and zero for the others.
| ``i1--i4`` : the molecule numbers for molecules 1–4 in the list
  (:ref:`xride` and :ref:`additional-compounds`). Default value: 108 (O\ :math:`_2`)
  for molecule 1, zero for the others. A value of zero indicates that
  for that number no molecule will be taken into account. Thus, for only
  1 molecule, keep *i2–i4* :math:`=0`.

| The following parameters are common to all our absorption models:

- ``f`` : The covering factor of the absorber. Default value: 1 (fullcovering)
- ``zv`` : Average systematic velocity :math:`v` of the absorber

| The following parameters are *only* output parameters:

- ``h--zn`` : The column densities in :math:`10^{28}` :math:`\mathrm{m}^{-2}` for
  all *atoms* added together for the all molecules that are present in
  this component.

| *Recommended citation:* `Pinto et al. (2010) <https://ui.adsabs.harvard.edu/abs/2010A%26A...521A..79P/abstract>`_.


.. [1]
   http://webmineral.com/
