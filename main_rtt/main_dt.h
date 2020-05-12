/*
 * main_dt.h
 *
 * Code generation for model "main".
 *
 * Model version              : 1.26
 * Simulink Coder version : 8.7 (R2014b) 08-Sep-2014
 * C source code generated on : Fri May 19 07:47:31 2017
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM 7
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(int32_T),
  sizeof(int64m_T),
  sizeof(int32_T),
  sizeof(int64m_T),
  sizeof(int64m_T),
  sizeof(uint64m_T),
  sizeof(int96m_T),
  sizeof(uint96m_T),
  sizeof(int128m_T),
  sizeof(uint128m_T),
  sizeof(int160m_T),
  sizeof(uint160m_T),
  sizeof(int192m_T),
  sizeof(uint192m_T),
  sizeof(int224m_T),
  sizeof(uint224m_T),
  sizeof(int256m_T),
  sizeof(uint256m_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "int32_T",
  "int64m_T",
  "int32_T",
  "int64m_T",
  "int64m_T",
  "uint64m_T",
  "int96m_T",
  "uint96m_T",
  "int128m_T",
  "uint128m_T",
  "int160m_T",
  "uint160m_T",
  "int192m_T",
  "uint192m_T",
  "int224m_T",
  "uint224m_T",
  "int256m_T",
  "uint256m_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&main_B.Sum2), 0, 0, 8 },

  { (char_T *)(&main_B.Gain), 15, 0, 1 }
  ,

  { (char_T *)(&main_DW.q1_tren_PWORK.LoggedData), 11, 0, 9 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  3U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&main_P.Gain_Gain), 0, 0, 42 },

  { (char_T *)(&main_P.Gain_Gain_f), 14, 0, 3 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  2U,
  rtPTransitions
};

/* [EOF] main_dt.h */
