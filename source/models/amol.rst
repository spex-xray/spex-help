.. _sec:amolmodel:

Amol: interstellar dust absorption model
============================================

This model calculates the transmission of various molecules considering both 
absorption and scattering. The extinction models are evaluated for grains 
with a standard MRN size distribution (`Mathis & Rumpl & Nordsieck, 1977
<https://ui.adsabs.harvard.edu/abs/1977ApJ...217..425M/abstract>`_): 
:math:`n(a) \propto a^{-3.5}` with *a* the grain size and
:math:`a_{\mathrm{min}}=0.005\ \mu  m` and :math:`a_{\mathrm{max}}=0.25\ \mu m`.
All the extinction profiles are based on laboratory measurements. For 
further details on the lab processing see `Zeegers et al. (2017)
<https://ui.adsabs.harvard.edu/abs/2017A%26A...599A.117Z/abstract>`_,
`Rogantini et al. (2018)
<https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_, 
`Costantini et al. (2019)
<https://ui.adsabs.harvard.edu/abs/2019A%26A...629A..78C/abstract>`_,
`Zeegers et al. (2019)
<https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_ 
and `Rogantini et al. (2019)
<https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_.
  

The following compounds are presently taken into account (see Table :ref:`tab:xride-table`).

.. _tab:xride-table:

.. table:: Compounds list

   =========  ===================== ============================================================= ============= ==================== ===============================================
   index      Name                  formula                                                       Form          Edge                 Source
   =========  ===================== ============================================================= ============= ==================== ===============================================
   115        c-silicon             :math:`\mathrm{Si}`                                           crystalline   Si 1s                `[1] <https://ui.adsabs.harvard.edu/abs/1999JAP....86.5609C/abstract>`_
   127        metallic iron         :math:`\mathrm{Fe}`                                           crystalline   Fe 1s                `[2] <http://exafsmaterials.com/Ref_Spectra_0.4MB.pdf>`_
   129        metallic nickel       :math:`\mathrm{Ni}`                                           crystalline   Ni 1s                `[3] <https://www.ncbi.nlm.nih.gov/pubmed/25859648>`_
   130        a-carbon              :math:`\mathrm{C}`                                            amorphous     C 1s                 `[4] <https://digital.library.unt.edu/ark:/67531/metadc668006/>`_
   131        diamond               :math:`\mathrm{C}`                                            crystalline   C 1s                 `[4] <https://digital.library.unt.edu/ark:/67531/metadc668006/>`_
   132        graphite              :math:`\mathrm{C}`                                            crystalline   C 1s                 `[4] <https://digital.library.unt.edu/ark:/67531/metadc668006/>`_
   2111       c-silicon carbide     :math:`\mathrm{SiC}`                                          crystalline   Si 1s                `[1] <https://ui.adsabs.harvard.edu/abs/1999JAP....86.5609C/abstract>`_
   2230       troilite              :math:`\mathrm{FeS}`                                          crystalline   S 1s; Fe 1s          `[5] <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_, `[6] <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   2231       pyrrhotite            :math:`\mathrm{Fe_7 S_8}`                                     crystalline   S 1s; Fe 1s          `[5] <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_, `[6] <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   2232       a-quartz              :math:`\mathrm{Si O_2}`                                       amorphous     Si 1s                `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   2233       c-quartz              :math:`\mathrm{Si O_2}`                                       crystalline   Si 1s                `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   2234       a-quartz              :math:`\mathrm{Si O_2}`                                       disorder      Si 1s                `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   2235       c-silicon nitride     :math:`\mathrm{Si_3 N_4}`                                     crystalline   Si 1s                `[1] <https://ui.adsabs.harvard.edu/abs/1999JAP....86.5609C/abstract>`_
   2236       magnesia              :math:`\mathrm{MgO}`                                          crystalline   Si 1s                `[8] <https://ui.adsabs.harvard.edu/abs/2017GeCoA.213..457F/abstract>`_
   2237       aluminium oxide       :math:`\mathrm{Al_2 O_3}`                                     crystalline   Al 1s                `[9] <https://ui.adsabs.harvard.edu/abs/2019A%26A...629A..78C/abstract>`_
   2238       alabandite            :math:`\mathrm{MnS}`                                          crystalline   S 1s                 `[5] <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_
   2239       pyrite                :math:`\mathrm{FeS_2}`                                        crystalline   S 1s                 `[5] <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_
   2240       titanium dioxide      :math:`\mathrm{TiO_2}`                                        crystalline   Ti 1s                `[10] <https://pubs.rsc.org/en/content/articlelanding/2013/EE/C2EE22739H#!divAbstract>`_
   2241       a-hydrocarbon         :math:`\mathrm{CH}`                                           amorhpous     C 1s                 `[11] <https://ui.adsabs.harvard.edu/abs/2002AcSpe..57..711B/abstract>`_
   3230       c-forsterite          :math:`\mathrm{Mg_2 Si O_4}`                                  crystalline   Mg 1s; Si 1s         `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   3231       a-enstatite           :math:`\mathrm{Mg Si O_3}`                                    amorphous     Mg 1s; Si 1s         `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   3232       c-enstatite           :math:`\mathrm{Mg Si O_3}`                                    crystalline   Mg 1s; Si 1s         `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   3233       c-spinel              :math:`\mathrm{Mg Al_2 O_4}`                                  crystalline   Mg 1s; Al 1s         `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[9] <https://ui.adsabs.harvard.edu/abs/2019A%26A...629A..78C/abstract>`_
   3270       calcium aluminate     :math:`\mathrm{Ca Al_2 O_4}`                                  crystalline   Ca 1s                `[13] <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_
   3271       tri-Ca aluminate      :math:`\mathrm{Ca_3 Al_2 O_6}`                                crystalline   Ca 1s                `[13] <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_
   3302       c-fayalite            :math:`\mathrm{Fe_2 Si O_4}`                                  crystalline   Si 1s; Fe 1s; Fe 2p  `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `[14] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_, `[15] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   4230       a-olivine             :math:`\mathrm{Mg Fe Si O_4}`                                 amorphous     Mg 1s; Si 1s         `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   4231       c-olivine             :math:`\mathrm{Mg_{1.56} Fe_{0.4} Si_{0.91} O_4}`             crystalline   Mg 1s; Si 1s; Fe 1s  `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `[6] <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4232       c-En60Fe40            :math:`\mathrm{Mg_{0.6} Fe_{0.4} Si O_3}`                     crystalline   Mg 1s; Si 1s; Fe 1s  `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `[6] <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4233       a-En60Fe40            :math:`\mathrm{Mg_{0.6} Fe_{0.4} Si O_3}`                     amorphous     Mg 1s; Si 1s; Fe 1s  `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `[6] <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4234       a-En75Fe25            :math:`\mathrm{Mg_{0.75} Fe_{0.25} Si O_3}`                   amorphous     Mg 1s; Si 1s         `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_
   4235       a-En90Fe10            :math:`\mathrm{Mg_{0.9} Fe_{0.1} Si O_3}`                     amorphous     Mg 1s; Si 1s; Fe 1s  `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `[6] <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4236       c-En90Fe10            :math:`\mathrm{Mg_{0.9} Fe_{0.1} Si O_3}`                     crystalline   Mg 1s; Si 1s; Fe 1s  `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `[6] <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4237       c-hypersthene         :math:`\mathrm{Mg_{1.502} Fe_{0.498} Si_2 O_6}`               crystalline   Mg 1s; Si 1s; Fe 1s  `[12] <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_, `[7] <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_, `[6] <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_
   4270       c-diopside            :math:`\mathrm{Mg Ca Si_2 O_6}`                               crystalline   Ca 1s                `[13] <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_
   4271       a-diopside            :math:`\mathrm{Mg Ca Si_2 O_6}`                               amorphous     Ca 1s                `[13] <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_
   4272       c-anorthite           :math:`\mathrm{Ca Al_2 Si_2 O_8}`                             crystalline   Ca 1s                `[13] <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_
   =========  ===================== ============================================================= ============= ==================== ===============================================

[1] `Chang et al. (1999) <https://ui.adsabs.harvard.edu/abs/1999JAP....86.5609C/abstract>`_,
[2] `exafsmaterials.com <http://exafsmaterials.com/Ref_Spectra_0.4MB.pdf>`_,
[3] `Van Loon et al. (2015) <https://www.ncbi.nlm.nih.gov/pubmed/25859648>`_,
[4] `Albella et al. (1998) <https://digital.library.unt.edu/ark:/67531/metadc668006/>`_,
[5] `esrf.eu <http://www.esrf.eu/home/UsersAndScience/Experiments/XNP/ID21/php/Database-SCompounds.htmlesrf.eu>`_,
[6] `Rogantini et al. (2018) <https://ui.adsabs.harvard.edu/abs/2018A%26A...609A..22R/abstract>`_,
[7] `Zeegers et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..16Z/abstract>`_,
[8] `Fukushi et al. (2017) <https://ui.adsabs.harvard.edu/abs/2017GeCoA.213..457F/abstract>`_,
[9] `Costantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...629A..78C/abstract>`_,
[10] `Shin et al. (2013) <https://pubs.rsc.org/en/content/articlelanding/2013/EE/C2EE22739H#!divAbstract>`_,
[11] `Bonnin-Mosbah et al. (2002) <https://ui.adsabs.harvard.edu/abs/2002AcSpe..57..711B/abstract>`_,
[12] `Rogantini et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...630A.143R/abstract>`_,
[13] `Neuville et al. (2007) <https://ui.adsabs.harvard.edu/abs/2007AIPC..882..419N/abstract>`_,
[14] `Lee et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_,
[15] `Lee et al. (2009) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_.

Additional molecules are listed in Table :ref:`tab:additional_compounds`.
These models do not include scattering and were not integrated over a size 
distribution. They will be updated in future versions.

.. _tab:additional_compounds:

.. table:: Additional compounds list

   ========== =================== ====================================================================================== =============== =====
   108        molecular oxygen    :math:`\mathrm{O_2}`                                                                   O 1s            `[16] <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_
   126        metallic iron       :math:`\mathrm{Fe}`                                                                    Fe 2p           `[17] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2001       water               :math:`\mathrm{H_2 O}`                                                                 O 1s            `[18] <https://ui.adsabs.harvard.edu/abs/2001PhRvA..63d2705H/abstract>`_
   2002       crystalline ice     :math:`\mathrm{H_2 O}`                                                                 O 1s            `[19] <https://ui.adsabs.harvard.edu/abs/2002JChPh.11710842P/abstract>`_
   2003       amorphous ice       :math:`\mathrm{H_2 O}`                                                                 O 1s            `[19] <https://ui.adsabs.harvard.edu/abs/2002JChPh.11710842P/abstract>`_
   2010       carbon monoxide     :math:`\mathrm{CO}`                                                                    O 1s            `[16] <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_
   2011       carbon dioxide      :math:`\mathrm{CO_2}`                                                                  O 1s            `[16] <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_
   2020       laughing gas        :math:`\mathrm{N_2 O}`                                                                 O 1s            `[16] <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_, `[21] <https://doi.org/10.1016/0368-2048(74)80010-1>`_
   2102       silicon monoxide    :math:`\mathrm{SiO}`                                                                   Si 1s           `[20] <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_
   2200       eskolaite           :math:`\mathrm{Cr_2 O_3}`                                                              O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   2300       iron monoxide       :math:`\mathrm{FeO}`                                                                   Fe 1s           `[23] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2301       iron oxide          :math:`\mathrm{Fe_{1-x} O}`                                                            O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   2302       magnetite           :math:`\mathrm{Fe_3 O_4}`                                                              O, Fe 1s        `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_, `[23] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2303       hematite            :math:`\mathrm{Fe_2 O_3}`                                                              O, Fe 1s; Fe 2p `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_, `[23] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_, `[17] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2304       iron sulfite        :math:`\mathrm{Fe S_2}`                                                                Fe 1s           `[23] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   2400       nickel monoxide     :math:`\mathrm{NiO}`                                                                   O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   2500       cupric oxide        :math:`\mathrm{CuO}`                                                                   O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   3001       adenine             :math:`\mathrm{C_5 H_5 N_5}`                                                           O 1s            `[24] <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   3103       pyroxene            :math:`\mathrm{Mg Si O_3}`                                                             O 1s            `[25] <https://www.pnas.org/content/105/23/7925>`_
   3200       calcite             :math:`\mathrm{Ca C O_3}`                                                              Ca 1s           `[26] <https://www.jstage.jst.go.jp/article/analsci/24/7/24_7_835/_article/-char/ja>`_
   3201       aragonite           :math:`\mathrm{Ca C O_3}`                                                              Ca 1s           `[26] <https://www.jstage.jst.go.jp/article/analsci/24/7/24_7_835/_article/-char/ja>`_
   3202       vaterite            :math:`\mathrm{Ca C O_3}`                                                              Ca 1s           `[26] <https://www.jstage.jst.go.jp/article/analsci/24/7/24_7_835/_article/-char/ja>`_
   3203       perovskite          :math:`\mathrm{Ca Ti O_3}`                                                             O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   3300       hercynite           :math:`\mathrm{Fe Al_2 O_4}`                                                           O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   3301       lepidocrocite       :math:`\mathrm{Fe O (OH)}`                                                             Fe 2p           `[17] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   3303       iron sulfate        :math:`\mathrm{Fe S O_4}`                                                              Fe 2p           `[17] <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_
   3304       ilmenite            :math:`\mathrm{Fe Ti O_3}`                                                             O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   3305       chromite            :math:`\mathrm{Fe Cr_2 O_4}`                                                           O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4001       guanine             :math:`\mathrm{C_5 H_5 N_5 O}`                                                         O,N 1s          `[24] <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   4002       cytosine            :math:`\mathrm{C_4 H_5 N_3 O}`                                                         O,N 1s          `[24] <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   4003       thymine             :math:`\mathrm{C_5 H_6 N_2 O_2}`                                                       O,N 1s          `[24] <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   4004       uracil              :math:`\mathrm{C_4 H_4 N_2 O_2}`                                                       O,N 1s          `[24] <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_
   4100       andradite           :math:`\mathrm{Ca_3 Fe_2 Si_3 O_{12}}`                                                 O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4101       acmite              :math:`\mathrm{Na Fe Si_2 O_6}`                                                        O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4102       franklinite         :math:`\mathrm{Zn_{0.6} Mn_{0.8} Fe_{1.6} O_4}`                                        O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4103       olivine             :math:`\mathrm{Mg_{1.6} Fe_{0.4} SiO_4}`                                               O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4104       almandine           :math:`\mathrm{Fe_3 Al_2 (Si O_4)_3}`                                                  O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   4105       hedenbergite        :math:`\mathrm{Ca Fe Si_2 O_6}`                                                        O 1s            `[22] <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_
   5001       dna (herring sperm) :math:`\mathrm{C_{39} H_{61} N_{15} O_{36} P_{4}}`                                     O,N 1s          `[24] <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_   
   6001       montmorillonite     :math:`\mathrm{Na_{0.2} Ca_{0.1} Al_2 Si_4 O_{10} (O H_2)(H_2 O)_{10}}`                Si 1s           `[20] <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_
   6002       nontronite          :math:`\mathrm{Na_{0.3} Fe_2^{3+} Si_3 Al O_{10} (OH)_2 \bullet (H_2 O)}`              Si 1s           `[20] <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_
   7001       enstatite_paulite   :math:`\mathrm{Ca_2 Mg_4 Al_{0.75} Fe_{0.25} Si_7 Al O_{22} (OH)_2}`                   Si 1s           `[20] <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_
   ========== =================== ====================================================================================== =============== =====

[16] `Barrus et al. (1979) <https://ui.adsabs.harvard.edu/abs/1979PhRvA..20.1045B/abstract>`_,
[17] `Lee et al. (2009) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_,
[18] `Hiraya et al. (2001) <https://ui.adsabs.harvard.edu/abs/2001PhRvA..63d2705H/abstract>`_,
[19] `Parent et al. (2002) <https://ui.adsabs.harvard.edu/abs/2002JChPh.11710842P/abstract>`_,
[20] `Lee et al. (2010) <https://www.sron.nl/files/HEA/XRAY2010/talks/3/lee.pdf>`_,
[21] `Wight et al. (1974) <https://doi.org/10.1016/0368-2048(74)80010-1>`_,
[22] `Van Aken et al. (1998) <https://ui.adsabs.harvard.edu/abs/1998PCM....25..494V/abstract>`_,
[23] `Lee et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...622..970L/abstract>`_,
[24] `Fujii et al. (2003) <https://ui.adsabs.harvard.edu/abs/2003NIMPB.199..249F/abstract>`_,
[25] `Lee et al. (2008) <https://www.pnas.org/content/105/23/7925>`_,
[26] `Hayakawa et al. (2008) <https://www.jstage.jst.go.jp/article/analsci/24/7/24_7_835/_article/-char/ja>`_.


The chemical composition of these minerals was mainly taken from the
`Mineralogy Database of David Barthelmy <http://webmineral.com/>`_. 
For DNA we assume equal contributions of adenine, cytosine, guanine and thymine, plus
for each of these on average one phosphate and one 2-deoxyribose molecule. We
take the cross-sections from the references as listed in
:ref:`tab:additional_compounds` in the energy interval where these
are given. Outside this range, the cross sections for free atoms
`Verner & Yakovlev (1995)
<https://ui.adsabs.harvard.edu/abs/1995A%26AS..109..125V/abstract>`_
:math:`var pixsec 1` or
`Badnell et al. (2005)
<https://ui.adsabs.harvard.edu/abs/2005MNRAS.360..458B/abstract>`_
:math:`var pixsec 2` are used.

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

For :math:`\mathrm{N_2 O}`, the fine structure lines are not well resolved by
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
   Thus, a value of :math:`10^{-7}` for :math:`\mathrm{CO_2}` means
   :math:`10^{21}` :math:`\mathrm{CO_2}` molecules :math:`\mathrm{m}^{-2}`, but of course
   :math:`2\times 10^{21}` atoms :math:`\mathrm{m}^{-2}`, because each
   :math:`\mathrm{CO_2}` molecule contains 2 oxygen atoms.

.. Warning:: The Tables above shows for which edges and atoms the XAFS
   are taken into account. For all other edges and atoms not listed there,
   we simply use the pure atomic cross-section (without absorption lines).
   Note that for almost all constituents this may give completely wrong
   cross sections in the optical/UV band, as at these low energies the
   effects of chemical binding, crystal structure etc. are very important
   for the optical transmission constants. This is contrary to the
   SPEX models for pure atomic or ionised gas, where our models can be used
   in the optical band.

.. Warning:: It is possible to change the values of the output atomic
   column densities of H–Zn, that are shown when you issue the "show par"
   command of SPEX. However, SPEX completely ignores this and when you
   issue the ``calc`` or ``fit`` commands, they will be reset to the proper
   values. Morale: just read of those parameters, don’t touch them!

The parameters of the model are:

| ``n1--n4`` : Molecular column density in
  :math:`10^{28}` :math:`\mathrm{m}^{-2}` for molecules 1–4. Default value:
  :math:`10^{-6}` for molecule 1, and zero for the others.
| ``i1--i4`` : the molecule numbers for molecules 1–4 in the list
  (:ref:`tab:xride-table` and :ref:`tab:additional_compounds`). Default value: 108 (:math:`\mathrm{O_2}`)
  for molecule 1, zero for the others. A value of zero indicates that
  for that number no molecule will be taken into account. Thus, for only
  1 molecule, keep *i2–i4* :math:`=0`.

| The following parameters are common to all our absorption models:

- ``f`` : The covering factor of the absorber. Default value: 1 (full covering)
- ``zv`` : Average systematic velocity :math:`v` of the absorber (using relativistic Doppler shift)

| The following parameters are *only* output parameters:

- ``h--zn`` : The column densities in :math:`10^{28}` :math:`\mathrm{m}^{-2}` for
  all *atoms* added together for the all molecules that are present in
  this component.

| *Recommended citation:* `Pinto et al. (2010) <https://ui.adsabs.harvard.edu/abs/2010A%26A...521A..79P/abstract>`_.

