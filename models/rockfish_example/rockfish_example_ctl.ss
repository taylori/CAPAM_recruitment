#V3.30.03.07
#_data_and_control_files: YTRK.North.data.ss // YTRK.North.control.ss
#_SS-V3.30.03.07-safe;_2017_05_19;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_SS-V3.30.03.07-safe;user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_SS-V3.30.03.07-safe;user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  1=like 3.24; 2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # Recruitment: 1=global; 2=by area (future option)
1 #  number of recruitment settlement assignments 
0 # year_x_area_x_settlement_event interaction requested (only for recr_dist_method=1)
#GPat month  area age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 1 1 1 1 # autogen
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if min=-12345
# 1st element for biology, 2nd for SR, 3rd for Q, 5th for selex, 4th reserved
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
2 #_Growth_Age_for_L1
25 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
5 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO    HI      INIT    PRIOR   PR_SD   PR_type PHASE   env_var&link    dev_link        dev_minyr       dev_maxyr       dev_PH  Block   Block_Fxn       
0.02    0.25    0.17    -2.12   0.438   3       -2       0       0       0       0       0       0       0       #       NatM_p_1_Fem_GP_1
1       25      14.7    22      99      0       -3       0       0       0       0       0       0       0       #       L_at_Amin_Fem_GP_1
35      70      53.6    55      99      0       -2       0       0       0       0       0       0       0       #       L_at_Amax_Fem_GP_1
0.1     0.4     0.140   0.1     99      0       -3       0       0       0       0       0       0       0       #       VonBert_K_Fem_GP_1
0.03    0.16    0.105   0.1     99      0       -5       0       0       0       0       0       0       0       #       CV_young_Fem_GP_1
0.03    0.16    0.040   0.1     99      0       -5       0       0       0       0       0       0       0       #       CV_old_Fem_GP_1
0       3       1.18E-5 99      99      0       -50     0       0       0       0       0       0       0       #       Wtlen_1_Fem
2       4       3.0672  99      99      0       -50     0       0       0       0       0       0       0       #       Wtlen_2_Fem
30      56      42.49   99      99      0       -50     0       0       0       0       0       0       0       #       Mat50%_Fem
-2      1       -0.4    99      99      0       -50     0       0       0       0       0       0       0       #       Mat_slope_Fem
0       6       0       99      99      0       -50     0       0       0       0       0       0       0       #       Eggs_scalar_Fem
0       7       1       99      99      0       -50     0       0       0       0       0       0       0       #       Eggs_exp_len_Fem
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_GP_1
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_Area_1
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_Bseas_1
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       CohortGrowDev
0.001   0.999   0.5     0.5     0.5     0       -99     0       0       0       0       0       0       0       #       FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             5            20       10.8322            10             5             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.6           0.718         0.158             0         -6          0          0          0          0          0          0          0 # SR_BH_steep
           0.5           1.2           0.5          0.67            99             0         -6          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            99             0        -50          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1960 # first year of main recr_devs; early devs can preceed this era
2012 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1895 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 5 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
1948.8   #_last_early_yr_nobias_adj_in_MPD 
1974.9   #_first_yr_fullbias_adj_in_MPD 
2006.5   #_last_yr_fullbias_adj_in_MPD 
2012.5   #_first_recent_yr_nobias_adj_in_MPD 
0.7034   #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)
0 #_period of cycles in recruitment (N parms read below)
 -6 #min rec_dev
 6 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F
#  0.00571916 0.00618397 0.00661394 0.00700748 0.00734963 0.00766167 0.00799297 0.00839977 0.00894391 0.00962363 0.0105433 0.0117445 0.0132701 0.0151427 0.017339 0.0200368 0.0229863 0.0245678 0.020575 0.00531576 -0.0222297 -0.0545793 -0.0804933 -0.0983939 -0.126169 -0.171462 -0.205229 -0.161595 0.0386557 0.288242 0.1135 -0.200291 -0.357877 -0.391013 -0.365291 -0.226844 0.127507 -0.100923 -0.407636 -0.648933 -0.38668 -0.141195 0.436643 0.223939 0.043561 0.243077 -0.0839641 -0.518628 -0.309705 0.0589422 -0.305842 0.284513 0.517585 0.147224 0.263952 0.515921 -0.0204481 0.760427 0.833503 0.62794 0.273125 -0.0750938 0.3713 0.294065 -0.300866 -0.0262369 0.488059 0.39868 0.677969 -0.0174897 -0.508487 -0.288797 -0.0738993 -0.92342 0.261821 -0.806397 0.399459 -0.76894 0.474934 -0.448451 -0.218587 0.0738459 0.0104437 0.00307238 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark
-1984 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.95 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2028 2037
# F rates by fleet
# Yr:  1889 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# CommercialTrawl 1.6238e-006 1.74871e-006 3.12271e-006 2.96167e-005 2.59949e-005 2.59953e-005 7.05935e-006 1.60919e-006 1.64017e-006 9.28308e-007 1.57006e-006 2.21174e-006 2.85324e-006 3.49479e-006 4.13629e-006 8.27405e-006 5.41907e-006 6.06047e-006 6.70186e-006 9.2159e-006 7.9845e-006 8.62587e-006 9.26724e-006 9.90849e-006 1.05499e-005 1.11912e-005 1.3081e-005 4.35697e-005 7.38625e-005 0.00018676 5.86159e-005 6.84016e-005 8.98024e-005 6.96951e-005 3.9195e-005 7.51552e-005 0.000176868 0.000187797 0.000322612 0.000294899 0.000390726 0.000556125 0.000647728 0.000430357 0.00039786 0.000382355 0.000614883 0.000616964 0.000682039 0.000827381 0.000954801 0.00187082 0.00250977 0.00406129 0.0168156 0.0301339 0.0573972 0.0357649 0.0184374 0.0167296 0.00837339 0.0162297 0.0169215 0.0217059 0.0120721 0.0156783 0.0156805 0.0182156 0.0187036 0.0194623 0.0201725 0.0246542 0.0234304 0.0317697 0.026582 0.0224616 0.0212867 0.0165861 0.0204904 0.0294088 0.0493802 0.0228666 0.0239353 0.036272 0.0443309 0.0328377 0.0239666 0.06797 0.107228 0.16079 0.158083 0.167353 0.232552 0.260415 0.29362 0.158194 0.10094 0.136512 0.136699 0.181031 0.148159 0.136353 0.113424 0.1676 0.157229 0.148669 0.128586 0.134155 0.0445544 0.0539774 0.0444224 0.0540156 0.0338113 0.0186123 0.00671706 0.0115639 0.0239539 0.00617762 0.0106236 0.0041933 0.0118944 0.0191707 0.0161488 0.021014 0.0159846 0.0200724 0.0276841 0.0201545 0.100631 0.100631 0.100631 0.100631 0.100631 0.100631 0.100631 0.100631 0.100631 0.100631 0.100631 0.100631
# HakeByCatch 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000726282 0.000192416 0.00210971 0.00258614 0.00896595 0.0059296 0.0242957 0.0271557 0.017077 0.00921988 0.0277251 0.0262808 0.0204778 0.00927103 0.0149246 0.0240311 0.0339163 0.0134088 0.026806 0.0299131 0.0327412 0.0164767 0.0161289 0.0397388 0.0193595 0.00608569 0.00507675 0.000924967 0.00114308 0.00260378 0.00247449 0.00173432 0.00374503 0.00366063 0.00306867 0.00206638 0.000883897 0.00562998 0.000897534 0.00189275 0.00140554 0.00701785 0.00701785 0.00701785 0.00701785 0.00701785 0.00701785 0.00701785 0.00701785 0.00701785 0.00701785 0.00701785 0.00701785
# RecORandCA 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8.67537e-007 1.73523e-006 2.00244e-006 2.67042e-006 3.33874e-006 4.00682e-006 4.60812e-006 5.27607e-006 5.94387e-006 7.07786e-006 6.94243e-006 6.07294e-006 8.73996e-006 8.07375e-006 4.27188e-006 4.14243e-006 3.4311e-006 4.56376e-006 8.09214e-006 6.484e-006 1.29754e-005 1.67748e-005 2.03513e-005 2.33665e-005 2.04272e-005 1.74565e-005 2.17845e-005 2.61708e-005 2.93457e-005 2.52653e-005 4.38001e-005 4.02919e-005 3.03358e-005 2.31843e-005 2.76391e-005 1.96337e-005 1.52283e-005 2.5016e-005 2.70139e-005 2.70716e-005 3.07212e-005 3.80692e-005 4.5453e-005 3.65947e-005 4.92139e-005 6.3751e-005 7.10256e-005 7.24802e-005 8.77393e-005 8.05059e-005 7.50805e-005 0.000257256 0.000249013 0.000722818 0.000750717 0.00140894 0.00046075 0.00237669 0.000361432 0.000296812 0.000216613 0.000500815 0.000440254 0.000588145 0.00216055 0.00185201 0.000786294 0.000595199 0.000526257 0.000660988 0.000590449 0.000371504 0.000223986 0.000216039 0.000223063 0.000420679 0.000359763 0.000486002 0.000435134 0.000360791 0.000530703 0.000409684 0.000297941 0.000485789 0.000523339 0.00051328 0.000389319 0.000688833 0.000331983 0.00165759 0.00165759 0.00165759 0.00165759 0.00165759 0.00165759 0.00165759 0.00165759 0.00165759 0.00165759 0.00165759 0.00165759
# RecWA 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00079723 0 0 0 0 0 0 0 0.000289337 0.000391933 0.000203984 0.000349193 0.000114722 8.94956e-005 0.000122273 6.36313e-005 0.000100097 0.000106223 0.000176508 0.00031233 0.000558993 0.000559343 0.000565116 0.000483403 0.000999456 0.00101727 0.00130127 0.000533103 0.000421704 0.00053157 0.000510335 0.000718717 0.000253163 0.000292993 0.000201101 8.80882e-005 9.43855e-005 0.000177299 0.000152155 0.000106393 0.00011889 0.000150067 0.00024376 0.000345879 0.000400768 0.00017967 0.000226147 0.000309984 0.000515618 0.000554635 0.00276928 0.00276928 0.00276928 0.00276928 0.00276928 0.00276928 0.00276928 0.00276928 0.00276928 0.00276928 0.00276928 0.00276928
#
#_Q_setup
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         1         0         0         0         1  #  CommercialTrawl
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -30            15      -4.74772             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CommercialTrawl(1)
#_no timevary Q parameters
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 24 0 0 0 # 1 CommercialTrawl
#
#_age_selex_types
#_Pattern Discard Male Special
 10 0 0 0 # 1 CommercialTrawl
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            20            55            40             0            99             0          1          0          0          0          0          0          0          0  #  SizeSel_P1_CommercialTrawl(1)
           -15            15           -15             0            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P2_CommercialTrawl(1)
            -5            15             4             0            99             0          3          0          0          0          0          0          0          0  #  SizeSel_P3_CommercialTrawl(1)
            -5            15             7             0            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P4_CommercialTrawl(1)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  SizeSel_P5_CommercialTrawl(1)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  SizeSel_P6_CommercialTrawl(1)
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     9     1     1     2     0     0     0     0     0     0     0
#      5    17    11     3     2     0     0     0     0     0     0     0
#      5    19    12     3     2     0     0     0     0     0     0     0
#      5    20    13     3     2     0     0     0     0     0     0     0
#      5    23    14     3     2     0     0     0     0     0     0     0
#      5    25    15     3     2     0     0     0     0     0     0     0
#      5    26    16     3     2     0     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
      4      1  0.02
      5      1  0.10
 -9999   1    0  # terminator
#
5 #_maxlambdaphase
1 #_sd_offset
# read 3 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 0 #_CPUE/survey:_4
#  1 1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 1 #_discard:_1
#  0 0 0 0 0 #_discard:_2
#  0 0 0 0 0 #_discard:_3
#  0 0 0 0 0 #_discard:_4
#  0 0 0 0 0 #_discard:_5
#  0 0 0 0 0 #_discard:_6
#  1 1 1 1 1 #_lencomp:_1
#  1 1 1 1 1 #_lencomp:_2
#  1 1 1 1 1 #_lencomp:_3
#  1 1 1 1 1 #_lencomp:_4
#  1 1 1 1 1 #_lencomp:_5
#  1 1 1 1 1 #_lencomp:_6
#  1 1 1 1 1 #_agecomp:_1
#  0 0 0 0 0 #_agecomp:_2
#  0 0 0 0 0 #_agecomp:_3
#  1 1 1 1 1 #_agecomp:_4
#  1 1 1 1 1 #_agecomp:_5
#  1 1 1 1 1 #_agecomp:_6
#  1 1 1 1 1 #_init_equ_catch
#  1 1 1 1 1 #_recruitments
#  1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 #_crashPenLambda
#  1 1 1 1 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999
