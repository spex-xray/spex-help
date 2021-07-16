Ascdump output table properties
===============================

This section contains the output table properties for the various
ascdump commands.

Plas
----

.. container::
   :name: tabout:plas

   .. table:: Output for option: plas

      ==== ====== ======= =============================== =======
      Type Digits Acronym Description                     Units
      ==== ====== ======= =============================== =======
      D    6      te      Electron temperature            keV
      D    6      tion    Ion temperature                 keV
      D    6      tiba    kT (ionisation balance)         keV
      D    6      vmic    :math:`b = \sqrt{2} sigma_v`    km/s
      D    6      cs      Sound speed                     km/s
      D    6      eden    Electron density                /m**3
      D    6      hden    Hydrogen density                /m**3
      D    6      eide    Electron+Ion density            /m**3
      D    6      rho     Mass density                    kg/m**3
      D    6      ed      Electron/Hydrogen density       
      D    6      eid     (Electron+Ion)/Hydrogen density 
      D    6      denm    Mass density / (n               
      D    6      epla    Plasma frequency energy         keV
      ==== ====== ======= =============================== =======

Abun
----

.. container::
   :name: tabout:abun

   .. table:: Output for option: abun

      ==== ====== ======= ================ ========
      Type Digits Acronym Description      Units
      ==== ====== ======= ================ ========
      I    2      iz      Z nuclear charge 
      A    2      elem    Element name     
      D    4      abus    Abundance        Solar
      D    4      abua    Abundance        Absolute
      D    4      char    Average charge   
      ==== ====== ======= ================ ========

Icon
----

.. container::
   :name: tabout:icon

   .. table:: Output for option: icon

      ==== ====== ======= ========================== ==========
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== ==========
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      D    4      crel    Concentration              (relative)
      D    4      cabs    Concentration              (absolute)
      ==== ====== ======= ========================== ==========

Rion
----

.. container::
   :name: tabout:rion

   .. table:: Output for option: rion

      ==== ====== ======= ================================== ======
      Type Digits Acronym Description                        Units
      ==== ====== ======= ================================== ======
      I    2      iz      Z nuclear charge                   
      I    2      jz      Ionisation stage                   
      I    2      is      Shell number within ion            
      I    2      ii      ii Iso-electronic sequence         
      I    3      ion     Ion number                         
      I    4      ind     Shell number                       
      A    2      elem    Element name                       
      A    6      stag    Ionisation stage                   
      A    5      shel    Shell name                         
      D    4      pion    Photo-ionisation                   /s/ion
      D    4      cion    Compton-ionisation                 /s/ion
      D    4      eion    Electron impact ionisation         /s/ion
      D    4      phea    Photo ionisation heating           W/ion
      D    4      chea    Compton ionisation heating         W/ion
      D    4      ecoo    Electron impact ionisation cooling W/ion
      ==== ====== ======= ================================== ======

Rate
----

.. container::
   :name: tabout:rate

   .. table:: Output for option: rate

      ==== ====== ======= ========================== ======
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== ======
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      D    4      rion    Total ionisation rate      /s/ion
      D    4      rrec    Total Recombination rate   /s/ion
      D    4      rcxi    CX ionisation rate         /s/ion
      D    4      rcxr    CX recombination rate      /s/ion
      ==== ====== ======= ========================== ======

Time
----

.. container::
   :name: tabout:time

   .. table:: Output for option: time

      ==== ====== ======= ========================== ==========
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== ==========
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      D    4      trec    Recombination time         (s)
      D    4      crel    Concentration              (relative)
      ==== ====== ======= ========================== ==========

Pop
---

.. container::
   :name: tabout:pop

   .. table:: Output for option: pop

      ==== ====== ======= ================================= =====
      Type Digits Acronym Description                       Units
      ==== ====== ======= ================================= =====
      I    2      iz      Z nuclear charge                  
      I    2      jz      Ionisation stage                  
      A    2      elem    Element name                      
      A    6      stag    Ionisation stage                  
      I    2      ii      ii Iso-electronic sequence        
      I    3      ion     Ion number                        
      I    5      il      level number                      
      A    32     lev     Configuration and term            
      D    8      ener    Energy                            keV
      D    6      occ     Population                        
      D    4      rocc    Population / LTE population       
      D    4      gcas    Gain Cascades from above          (/s)
      D    3      gexc    Gain Excitation from below        (/s)
      D    3      ldow    Loss Downwards                    (/s)
      D    3      lupp    Loss Upwards                      (/s)
      D    3      arr     Gain from Radiative recombination (/s)
      D    3      adr     Gain from Dielectronic recombin.  (/s)
      D    3      aii     Gain from Inner-shell ionisation  (/s)
      D    3      acx     Gain from Charge Exchange (CX)    (/s)
      ==== ====== ======= ================================= =====

Lev
---

.. container::
   :name: tabout:lev

   .. table:: Output for option: lev

      ==== ====== ======= ========================== =====
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== =====
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      I    5      il      lower level                
      I    5      iu      upper level                
      D    8      elow    Lower level energy         keV
      D    8      eupp    Upper level energy         keV
      D    8      de      Energy difference          keV
      D    6      eex     Electron excitation        (/s)
      D    6      edex    Electron de-excitation     (/s)
      D    6      pex     Proton excitation          (/s)
      D    6      pdex    Proton de-excitation       (/s)
      D    6      rdec    Radiative decay            (/s)
      D    6      2p      Two photon emission        (/s)
      D    6      rabs    Radiative absorption       (/s)
      D    6      rrec    Radiative recombination    (/s)
      D    6      drec    Dielectronic recombination (/s)
      D    6      fluo    Fluorescence               (/s)
      D    6      cx      Charge exchange            (/s)
      D    6      sum     Total                      (/s)
      A    32     llev    Lower configuration + term 
      A    32     ulev    Upper configuration + term 
      ==== ====== ======= ========================== =====

Elex
----

.. container::
   :name: tabout:elex

   .. table:: Output for option: elex

      ==== ====== ======= ========================== ======
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== ======
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      I    5      il      lower level                
      I    5      iu      upper level                
      A    65     tran    Transition                 
      D    6      eexc    Excitation Energy          keV
      D    4      ups     Upsilon                    
      D    4      gbar    gbar                       
      D    4      rexc    Excitation rate            /s/ion
      D    4      rdex    Deexcitation rate          /s/ion
      ==== ====== ======= ========================== ======

Prex
----

.. container::
   :name: tabout:prex

   .. table:: Output for option: prex

      ==== ====== ======= ========================== ======
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== ======
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      I    5      il      lower level                
      I    5      iu      upper level                
      A    65     tran    Transition                 
      D    6      eexc    Excitation Energy          keV
      D    4      ups     Upsilon                    
      D    4      gbar    gbar                       
      D    4      rexc    Excitation rate            /s/ion
      D    4      rdex    Deexcitation rate          /s/ion
      ==== ====== ======= ========================== ======

Rad
---

.. container::
   :name: tabout:rad

   .. table:: Output for option: rad

      ==== ====== ======= ================================ =====
      Type Digits Acronym Description                      Units
      ==== ====== ======= ================================ =====
      I    2      iz      Z nuclear charge                 
      I    2      jz      Ionisation stage                 
      A    2      elem    Element name                     
      A    6      stag    Ionisation stage                 
      I    2      ii      ii Iso-electronic sequence       
      I    3      ion     Ion number                       
      I    5      il      lower level                      
      I    5      iu      upper level                      
      A    65     tran    Transition                       
      D    6      ener    Energy                           keV
      D    6      wav     Wavelength                       Ang
      D    4      fosc    Oscillator strength              
      D    4      a       Transition probability           /s
      D    4      arad    Total radiative loss probability /s
      D    6      atot    Total decay probability          /s
      D    4      br      Branching ratio                  
      ==== ====== ======= ================================ =====

Two
---

.. container::
   :name: tabout:two

   .. table:: Output for option: two

      ==== ====== ======= ================================ =====
      Type Digits Acronym Description                      Units
      ==== ====== ======= ================================ =====
      I    2      iz      Z nuclear charge                 
      I    2      jz      Ionisation stage                 
      A    2      elem    Element name                     
      A    6      stag    Ionisation stage                 
      I    2      ii      ii Iso-electronic sequence       
      I    3      ion     Ion number                       
      I    5      il      lower level                      
      I    5      iu      upper level                      
      A    65     tran    Transition                       
      D    6      ener    Energy                           keV
      D    6      wav     Wavelength                       Ang
      D    4      fosc    Oscillator strength              
      D    4      a       Transition probability           /s
      D    4      arad    Total radiative loss probability /s
      D    6      atot    Total decay probability          /s
      D    4      br      Branching ratio                  
      ==== ====== ======= ================================ =====

Rec
---

.. container::
   :name: tabout:rec

   .. table:: Output for option: rec

      ==== ====== ======= ============================= ======
      Type Digits Acronym Description                   Units
      ==== ====== ======= ============================= ======
      I    2      iz      Z nuclear charge              
      I    2      jz      Ionisation stage              
      I    2      ii      ii Iso-electronic sequence    
      I    3      ion     Ion number                    
      A    2      elem    Element name                  
      A    6      stag    Ionisation stage              
      I    5      iu      Level                         
      A    32     lev     Level name                    
      D    4      arr     Radiative recombination       /s/ion
      D    4      adr     Dielectronic recombination    /s/ion
      D    4      acx     Charge exchange recombination /s/ion
      D    4      aii     Inner shell ionisation        /s/ion
      ==== ====== ======= ============================= ======

Grid
----

.. container::
   :name: tabout:grid

   .. table:: Output for option: grid

      ==== ====== ======= ================ ==========
      Type Digits Acronym Description      Units
      ==== ====== ======= ================ ==========
      I    8      ie      Bin nr.          
      D    6      ef1     Lower energy     (keV)
      D    6      ef2     Upper energy     (keV)
      D    6      ef      Mean energy      (keV)
      D    6      de      Bin width        (keV)
      D    6      wav1    Lower wavelength (Angstom)
      D    6      wav2    Upper wavelength (Angstrom)
      D    6      wav     Mean wavelength  (Angstrom)
      D    6      dwav    Bin width        (Angstrom)
      ==== ====== ======= ================ ==========

Con
---

.. container::
   :name: tabout:con

   .. table:: Output for option: con

      ==== ====== ======= ======================== ==========
      Type Digits Acronym Description              Units
      ==== ====== ======= ======================== ==========
      I    8      ie      Bin nr.                  
      D    6      ener    Mean energy              (keV)
      D    6      wav     Mean wavelength          (Angstrom)
      D    4      pff     free-free fraction       
      D    4      pfb     free-bound fraction      
      D    4      p2p     two-photon fraction      
      D    4      sff     free-free spectrum       ph/s/keV
      D    4      sfb     free-bound spectrum      ph/s/keV
      D    4      s2p     two-photon spectrum      ph/s/keV
      D    4      scon    total continuum spectrum ph/s/keV
      ==== ====== ======= ======================== ==========

Tcon
----

.. container::
   :name: tabout:tcon

   .. table:: Output for option: tcon

      ==== ====== ======= ======================== ==========
      Type Digits Acronym Description              Units
      ==== ====== ======= ======================== ==========
      I    8      ie      Bin nr.                  
      D    6      ener    Mean energy              (keV)
      D    6      wav     Mean wavelength          (Angstrom)
      D    4      pff     free-free fraction       
      D    4      pfb     free-bound fraction      
      D    4      p2p     two-photon fraction      
      D    4      sff     free-free spectrum       ph/s/keV
      D    4      sfb     free-bound spectrum      ph/s/keV
      D    4      s2p     two-photon spectrum      ph/s/keV
      D    4      scon    total continuum spectrum ph/s/keV
      ==== ====== ======= ======================== ==========

Ccon
----

.. container::
   :name: tabout:ccon

   .. table:: Output for option: ccon

      ==== ====== ======= ========================== =====
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== =====
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      L    10     ff      free-free contribution     
      L    10     fb      free-bound contribution    
      I    3      fbnm    free-bound nmax            
      L    10     2p      two-photon contribution    
      ==== ====== ======= ========================== =====

Clin
----

.. container::
   :name: tabout:clin

   .. table:: Output for option: clin

      ==== ====== ======= ================== ==========
      Type Digits Acronym Description        Units
      ==== ====== ======= ================== ==========
      I    8      ie      Bin nr.            
      D    6      ener    Mean energy        (keV)
      D    6      wav     Mean wavelength    (Angstrom)
      D    4      pcon    continuum fraction 
      D    4      plin    line fraction      
      D    4      scon    continuum spectrum ph/s/keV
      D    4      slin    line spectrum      ph/s/keV
      D    4      stot    total spectrum     ph/s/keV
      ==== ====== ======= ================== ==========

Tcl
---

.. container::
   :name: tabout:tcl

   .. table:: Output for option: tcl

      ==== ====== ======= =============== ==========
      Type Digits Acronym Description     Units
      ==== ====== ======= =============== ==========
      I    8      ie      Bin nr.         
      D    6      ener    Mean energy     (keV)
      D    6      wav     Mean wavelength (Angstrom)
      D    4      pcon    cont fraction   
      D    4      plin    line fraction   
      D    4      scon    cont spectrum   ph/s/keV
      D    4      slin    line spectrum   ph/s/keV
      D    4      stot    total spectrum  ph/s/keV
      ==== ====== ======= =============== ==========

Line
----

.. container::
   :name: tabout:line

   .. table:: Output for option: line

      ==== ====== ======= =============================== =========
      Type Digits Acronym Description                     Units
      ==== ====== ======= =============================== =========
      I    2      iz      Z nuclear charge                
      I    2      jz      Ionisation stage                
      A    2      elem    Element name                    
      A    6      stag    Ionisation stage                
      I    2      ii      ii Iso-electronic sequence      
      I    3      ion     Ion number                      
      I    7      id      Line nr.                        
      I    5      il      lower level                     
      I    5      iu      upper level                     
      L    7      c       New Calculation                 
      A    65     tran    Transition                      
      D    6      ener    Energy                          keV
      D    6      wav     Wavelength                      Ang
      D    3      flux    Photon flux                     Photons/s
      D    3      watt    Energy flux                     W
      D    3      nfwh    Natural FWHM                    keV
      D    3      dfwh    Doppler FWHM                    keV
      D    3      tau     Optical depth at line center    
      D    3      pesl    Single flight Escape prob. line 
      D    3      pesc    Single flight Escape prob. cont 
      D    3      pest    Escape probability total        
      D    3      eps     photon destruction probability  
      ==== ====== ======= =============================== =========

Tlin
----

.. container::
   :name: tabout:tlin

   .. table:: Output for option: tlin

      ==== ====== ======= ========================== =========
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== =========
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      I    7      id      Line nr.                   
      I    5      il      lower level                
      I    5      iu      upper level                
      L    7      c       New Calculation            
      A    65     tran    Transition                 
      D    6      ener    Energy                     keV
      D    6      wav     Wavelength                 Ang
      D    3      flux    photon flux                Photons/s
      D    3      watt    Energy flux                W
      ==== ====== ======= ========================== =========

Tran
----

.. container::
   :name: tabout:tral

   .. table:: Output for option: tral

      ==== ====== ======= ============================ =====
      Type Digits Acronym Description                  Units
      ==== ====== ======= ============================ =====
      I    2      iz      Z nuclear charge             
      I    2      jz      Ionisation stage             
      A    2      elem    Element name                 
      A    6      stag    Ionisation stage             
      I    2      ii      ii Iso-electronic sequence   
      I    3      ion     Ion number                   
      I    7      id      Line nr.                     
      I    5      il      lower level                  
      I    5      iu      upper level                  
      L    7      c       New Calculation              
      D    6      ener    Energy                       keV
      D    6      wav     Wavelength                   Ang
      D    3      tau0    Optical depth at line center 
      D    3      ewk     Equivalent width             keV
      D    3      ewa     Equivalent width             Ang
      D    3      voig    Voigt a parameter            
      A    67     tran    Transition                   
      ==== ====== ======= ============================ =====

.. container::
   :name: tabout:trac

   .. table:: Output for option: trac

      ==== ====== ======= ========================== =====
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== =====
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      I    2      is      Shell number within ion    
      I    6      ind     Shell number               
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      A    5      shel    Shell name                 
      D    6      ener    Energy                     keV
      D    6      wav     Wavelength                 Ang
      D    3      tau0    Optical depth at edge      
      D    3      ewk     Equivalent width           keV
      D    3      ewa     Equivalent width           Ang
      ==== ====== ======= ========================== =====

Col
---

.. container::
   :name: tabout:col

   .. table:: Output for option: col

      ==== ====== ======= ========================== ===========
      Type Digits Acronym Description                Units
      ==== ====== ======= ========================== ===========
      I    2      iz      Z nuclear charge           
      I    2      jz      Ionisation stage           
      A    2      elem    Element name               
      A    6      stag    Ionisation stage           
      I    2      ii      ii Iso-electronic sequence 
      I    3      ion     Ion number                 
      D    4      col     Column density             /m**2
      D    4      lcol    Log column density         log (/m**2)
      ==== ====== ======= ========================== ===========

Heat
----

.. container::
   :name: tabout:heat

   .. table:: Output for option: heat

      ==== ====== ======= ================================ ======
      Type Digits Acronym Description                      Units
      ==== ====== ======= ================================ ======
      D    15     sol1    Solution                         
      D    15     t1      Electron temperature             keV
      D    15     ne1     Electron density                 /m**3
      D    15     nh1     Hydrogen density                 /m**3
      D    15     p1      Electron pressure                Pa
      D    0      sol2    Solution                         
      D    0      t2      Electron temperature             keV
      D    0      ne2     Electron density                 /m**3
      D    0      nh2     Hydrogen density                 /m**3
      D    0      p2      Electron pressure                Pa
      D    0      sol3    Solution                         
      D    0      t3      Electron temperature             keV
      D    0      ne3     Electron density                 /m**3
      D    0      nh3     Hydrogen density                 /m**3
      D    0      p3      Electron pressure                Pa
      D    0      sol4    Solution                         
      D    0      t4      Electron temperature             keV
      D    0      ne4     Electron density                 /m**3
      D    0      nh4     Hydrogen density                 /m**3
      D    0      p4      Electron pressure                Pa
      D    0      sol5    Solution                         
      D    0      t5      Electron temperature             keV
      D    0      ne5     Electron density                 /m**3
      D    0      nh5     Hydrogen density                 /m**3
      D    0      p5      Electron pressure                Pa
      D    0      sol6    Solution                         
      D    0      t6      Electron temperature             keV
      D    0      ne6     Electron density                 /m**3
      D    0      nh6     Hydrogen density                 /m**3
      D    0      p6      Electron pressure                Pa
      D    0      sol7    Solution                         
      D    0      t7      Electron temperature             keV
      D    0      ne7     Electron density                 /m**3
      D    0      nh7     Hydrogen density                 /m**3
      D    0      p7      Electron pressure                Pa
      D    0      sol8    Solution                         
      D    0      t8      Electron temperature             keV
      D    0      ne8     Electron density                 /m**3
      D    0      nh8     Hydrogen density                 /m**3
      D    0      p8      Electron pressure                Pa
      D    15     solu    You selected solution nr.        
      D    15     hcom    Heating Compton scattering       W/m**3
      D    15     hff     Heating free-free absorption     W/m**3
      D    15     hphe    Heating photo-electrons          W/m**3
      D    15     hci     Heating Compton ionisation       W/m**3
      D    15     haug    Heating Auger electrons          W/m**3
      D    15     hcol    Heating collis. de-excitation    W/m**3
      D    15     hex     Heating external source          W/m**3
      D    15     ccom    Cooling inverse Compton scatter. W/m**3
      D    15     ccoi    Cooling electron ionisation      W/m**3
      D    15     crec    Cooling radiative recombination  W/m**3
      D    15     cffe    Cooling free-free emission       W/m**3
      D    15     ccol    Cooling collisional excitation   W/m**3
      D    15     cdr     Cooling dielectronic recombin.   W/m**3
      D    15     cadi    Cooling adiabatic expansion      W/m**3
      D    15     heat    Total heating                    W/m**3
      D    15     cool    Total cooling                    W/m**3
      ==== ====== ======= ================================ ======

Ebal
----

.. container::
   :name: tabout:ebal

   .. table:: Output for option: ebal

      ==== ====== ======= ================================ ======
      Type Digits Acronym Description                      Units
      ==== ====== ======= ================================ ======
      I    4      step    Step                             
      I    3      i       i                                
      I    3      itcx    CX iter                          
      D    3      hden    H density                        /m**3
      D    3      eden    el density                       /m**3
      D    3      nenh    n                                
      D    3      eden    kT electron                      keV
      D    3      delt    Delta                            
      D    3      heat    Total heating                    W/m**3
      D    3      cool    Total cooling                    W/m**3
      D    15     hcom    Heating Compton scattering       W/m**3
      D    15     hff     Heating free-free absorption     W/m**3
      D    15     hphe    Heating photo-electrons          W/m**3
      D    15     hci     Heating Compton ionisation       W/m**3
      D    15     haug    Heating Auger electrons          W/m**3
      D    15     hcol    Heating collis. de-excitation    W/m**3
      D    15     hex     Heating external source          W/m**3
      D    15     ccom    Cooling inverse Compton scatter. W/m**3
      D    15     ccoi    Cooling electron ionisation      W/m**3
      D    15     crec    Cooling radiative recombination  W/m**3
      D    15     cffe    Cooling free-free emission       W/m**3
      D    15     ccol    Cooling collisional excitation   W/m**3
      D    15     cdr     Cooling dielectronic recombin.   W/m**3
      D    15     cadi    Cooling adiabatic expansion      W/m**3
      ==== ====== ======= ================================ ======

Nei
---

.. container::
   :name: tabout:nei

   .. table:: Output for option: nei

      ==== ====== ======= =================== ======
      Type Digits Acronym Description         Units
      ==== ====== ======= =================== ======
      D    4      uhis    U = integral (ne t) s/m**3
      D    4      this    kT                  keV
      ==== ====== ======= =================== ======

Snr
---

.. container::
   :name: tabout:snr

   .. table:: Output for option: snr

      ==== ====== ======= =============================== ===========
      Type Digits Acronym Description                     Units
      ==== ====== ======= =============================== ===========
      D    6      age     Age                             year
      D    6      rs      Shock radius                    pc
      D    6      nh      ISM Hydrogen density            cm**-3
      D    6      eexp    Explosion energy                1E43 J
      D    6      mesh    Shocked ejected mass            Solar units
      D    6      mesw    swept-up ISM mass               Solar units
      D    6      s       ISM density gradient s          
      D    6      n       ejecta density gradient n       
      D    6      alfa    Hamiltons alpha parameter       
      D    6      nu      Hamiltons nu parameter          
      D    6      ts      Shock temperature               keV
      D    6      tej     Av. temp. shocked ejecta        keV
      D    6      tism    Av. temp. shocked ISM           keV
      D    6      u       Ionisation parameter            1E20 s/m**3
      D    6      uej     Av. ionis. shocked ejecta       1E20 s/m**3
      D    6      uism    Av. ionis. shocked ISM          1E20 s/m**3
      D    6      yej     Em. measure shocked ejecta      1E64 /m**3
      D    6      yism    Em. measure shocked ISM         1E64 /m**3
      D    6      rej     Av. radius shocked ejecta       pc
      D    6      rism    Av. radius shocked ISM          pc
      D    6      aej     Av. plasma age shocked ejecta   year
      D    6      aism    Av. plasma age shocked ISM      year
      D    6      vej     Av. gas velocity shocked ejecta km/s
      D    6      vism    Av. gas velocity shocked ISM    km/s
      D    6      vs      Shock velocity                  km/s
      D    6      rrs     Reverse shock radius            pc
      D    6      rcd     Contact discontinuity radius    pc
      D    6      cmax    Maximum distance clumps         pc
      D    6      nenh    Ratio electron/Hydrogen density 
      D    6      dist    Distance                        kpc
      ==== ====== ======= =============================== ===========

Dem
---

.. container::
   :name: tabout:dem

   .. table:: Output for option: dem

      ==== ====== ======= =========== ==========
      Type Digits Acronym Description Units
      ==== ====== ======= =========== ==========
      D    4      t       Temperature keV
      D    4      y       Em. measure 1E64 m**-3
      ==== ====== ======= =========== ==========
