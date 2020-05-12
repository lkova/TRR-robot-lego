  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (main_P)
    ;%
      section.nData     = 42;
      section.data(42)  = dumData; %prealloc
      
	  ;% main_P.Gain_Gain
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% main_P.Switch1_Threshold
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% main_P.Switch3_Threshold
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% main_P.Gain_Gain_o
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% main_P.Switch1_Threshold_f
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% main_P.Switch3_Threshold_f
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% main_P.Constant7_Value
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% main_P.Constant10_Value
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% main_P.q1_Value
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% main_P.Constant9_Value
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% main_P.Switch1_Threshold_m
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% main_P.Constant8_Value
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
	  ;% main_P.Gain1_Gain
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 12;
	
	  ;% main_P.Switch2_Threshold
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 13;
	
	  ;% main_P.Saturation_UpperSat
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 14;
	
	  ;% main_P.Saturation_LowerSat
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 15;
	
	  ;% main_P.Constant7_Value_d
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 16;
	
	  ;% main_P.Constant10_Value_p
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 17;
	
	  ;% main_P.q3_Value
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 18;
	
	  ;% main_P.Gain2_Gain
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 19;
	
	  ;% main_P.Constant2_Value
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 20;
	
	  ;% main_P.Switch2_Threshold_a
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 21;
	
	  ;% main_P.Constant9_Value_e
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 22;
	
	  ;% main_P.Switch1_Threshold_i
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 23;
	
	  ;% main_P.Constant8_Value_l
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 24;
	
	  ;% main_P.Gain1_Gain_p
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 25;
	
	  ;% main_P.Switch2_Threshold_j
	  section.data(27).logicalSrcIdx = 26;
	  section.data(27).dtTransOffset = 26;
	
	  ;% main_P.Saturation_UpperSat_e
	  section.data(28).logicalSrcIdx = 27;
	  section.data(28).dtTransOffset = 27;
	
	  ;% main_P.Saturation_LowerSat_m
	  section.data(29).logicalSrcIdx = 28;
	  section.data(29).dtTransOffset = 28;
	
	  ;% main_P.Constant7_Value_o
	  section.data(30).logicalSrcIdx = 29;
	  section.data(30).dtTransOffset = 29;
	
	  ;% main_P.Constant10_Value_j
	  section.data(31).logicalSrcIdx = 30;
	  section.data(31).dtTransOffset = 30;
	
	  ;% main_P.q2_Value
	  section.data(32).logicalSrcIdx = 31;
	  section.data(32).dtTransOffset = 31;
	
	  ;% main_P.Gain2_Gain_f
	  section.data(33).logicalSrcIdx = 32;
	  section.data(33).dtTransOffset = 32;
	
	  ;% main_P.Constant2_Value_i
	  section.data(34).logicalSrcIdx = 33;
	  section.data(34).dtTransOffset = 33;
	
	  ;% main_P.Switch2_Threshold_e
	  section.data(35).logicalSrcIdx = 34;
	  section.data(35).dtTransOffset = 34;
	
	  ;% main_P.Constant9_Value_k
	  section.data(36).logicalSrcIdx = 35;
	  section.data(36).dtTransOffset = 35;
	
	  ;% main_P.Switch1_Threshold_d
	  section.data(37).logicalSrcIdx = 36;
	  section.data(37).dtTransOffset = 36;
	
	  ;% main_P.Constant8_Value_h
	  section.data(38).logicalSrcIdx = 37;
	  section.data(38).dtTransOffset = 37;
	
	  ;% main_P.Gain1_Gain_k
	  section.data(39).logicalSrcIdx = 38;
	  section.data(39).dtTransOffset = 38;
	
	  ;% main_P.Switch2_Threshold_l
	  section.data(40).logicalSrcIdx = 39;
	  section.data(40).dtTransOffset = 39;
	
	  ;% main_P.Saturation_UpperSat_m
	  section.data(41).logicalSrcIdx = 40;
	  section.data(41).dtTransOffset = 40;
	
	  ;% main_P.Saturation_LowerSat_h
	  section.data(42).logicalSrcIdx = 41;
	  section.data(42).dtTransOffset = 41;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% main_P.Gain_Gain_f
	  section.data(1).logicalSrcIdx = 42;
	  section.data(1).dtTransOffset = 0;
	
	  ;% main_P.Gain1_Gain_d
	  section.data(2).logicalSrcIdx = 43;
	  section.data(2).dtTransOffset = 1;
	
	  ;% main_P.Gain1_Gain_dj
	  section.data(3).logicalSrcIdx = 44;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (main_B)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% main_B.Sum2
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% main_B.Sum3
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% main_B.Sum1
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% main_B.Sum2_c
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% main_B.Sum3_b
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% main_B.Sum1_k
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% main_B.Sum2_l
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% main_B.Sum3_c
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% main_B.Gain
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 2;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (main_DW)
    ;%
      section.nData     = 9;
      section.data(9)  = dumData; %prealloc
      
	  ;% main_DW.q1_tren_PWORK.LoggedData
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% main_DW.DOWN_PWORK.LoggedData
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% main_DW.UP_PWORK.LoggedData
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% main_DW.q3_tren_PWORK.LoggedData
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% main_DW.DOWN_PWORK_d.LoggedData
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% main_DW.UP_PWORK_i.LoggedData
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% main_DW.q2_tren_PWORK.LoggedData
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% main_DW.neg_PWORK.LoggedData
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% main_DW.poz_PWORK.LoggedData
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 978998084;
  targMap.checksum1 = 4277501126;
  targMap.checksum2 = 1753875970;
  targMap.checksum3 = 505840079;

