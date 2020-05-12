/*
 * File: main.h
 *
 * Code generated for Simulink model 'main'.
 *
 * Model version                  : 1.26
 * Simulink Coder version         : 8.7 (R2014b) 08-Sep-2014
 * TLC version                    : 8.7 (Aug  5 2014)
 * C/C++ source code generated on : Fri May 19 07:47:31 2017
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM 7
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_main_h_
#define RTW_HEADER_main_h_
#include <math.h>
#include <float.h>
#include <string.h>
#include <stddef.h>
#ifndef main_COMMON_INCLUDES_
# define main_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "dt_info.h"
#include "ext_work.h"
#include "driver_nxt.h"
#endif                                 /* main_COMMON_INCLUDES_ */

#include "main_types.h"

/* Shared type includes */
#include "multiword_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

/* Block signals (auto storage) */
typedef struct {
  real_T Sum2;                         /* '<S4>/Sum2' */
  real_T Sum3;                         /* '<S4>/Sum3' */
  real_T Sum1;                         /* '<S7>/Sum1' */
  real_T Sum2_c;                       /* '<S6>/Sum2' */
  real_T Sum3_b;                       /* '<S6>/Sum3' */
  real_T Sum1_k;                       /* '<S8>/Sum1' */
  real_T Sum2_l;                       /* '<S5>/Sum2' */
  real_T Sum3_c;                       /* '<S5>/Sum3' */
  int64m_T Gain;                       /* '<Root>/Gain' */
} B_main_T;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  struct {
    void *LoggedData;
  } q1_tren_PWORK;                     /* '<Root>/q1_tren' */

  struct {
    void *LoggedData;
  } DOWN_PWORK;                        /* '<S4>/DOWN' */

  struct {
    void *LoggedData;
  } UP_PWORK;                          /* '<S4>/UP ' */

  struct {
    void *LoggedData;
  } q3_tren_PWORK;                     /* '<Root>/q3_tren' */

  struct {
    void *LoggedData;
  } DOWN_PWORK_d;                      /* '<S6>/DOWN' */

  struct {
    void *LoggedData;
  } UP_PWORK_i;                        /* '<S6>/UP ' */

  struct {
    void *LoggedData;
  } q2_tren_PWORK;                     /* '<Root>/q2_tren' */

  struct {
    void *LoggedData;
  } neg_PWORK;                         /* '<S5>/neg' */

  struct {
    void *LoggedData;
  } poz_PWORK;                         /* '<S5>/poz ' */
} DW_main_T;

/* Parameters (auto storage) */
struct P_main_T_ {
  real_T Gain_Gain;                    /* Expression: -1
                                        * Referenced by: '<S9>/Gain'
                                        */
  real_T Switch1_Threshold;            /* Expression: 180
                                        * Referenced by: '<S9>/Switch1'
                                        */
  real_T Switch3_Threshold;            /* Expression: 180
                                        * Referenced by: '<S9>/Switch3'
                                        */
  real_T Gain_Gain_o;                  /* Expression: -1
                                        * Referenced by: '<S10>/Gain'
                                        */
  real_T Switch1_Threshold_f;          /* Expression: 180
                                        * Referenced by: '<S10>/Switch1'
                                        */
  real_T Switch3_Threshold_f;          /* Expression: 180
                                        * Referenced by: '<S10>/Switch3'
                                        */
  real_T Constant7_Value;              /* Expression: 30
                                        * Referenced by: '<S4>/Constant7'
                                        */
  real_T Constant10_Value;             /* Expression: 20
                                        * Referenced by: '<S4>/Constant10'
                                        */
  real_T q1_Value;                     /* Expression: 0
                                        * Referenced by: '<Root>/q1'
                                        */
  real_T Constant9_Value;              /* Expression: 0
                                        * Referenced by: '<S4>/Constant9'
                                        */
  real_T Switch1_Threshold_m;          /* Expression: 0.1
                                        * Referenced by: '<S4>/Switch1'
                                        */
  real_T Constant8_Value;              /* Expression: -10
                                        * Referenced by: '<S4>/Constant8'
                                        */
  real_T Gain1_Gain;                   /* Expression: -1
                                        * Referenced by: '<S4>/Gain1'
                                        */
  real_T Switch2_Threshold;            /* Expression: 0.1
                                        * Referenced by: '<S4>/Switch2'
                                        */
  real_T Saturation_UpperSat;          /* Expression: 100
                                        * Referenced by: '<S4>/Saturation'
                                        */
  real_T Saturation_LowerSat;          /* Expression: -80
                                        * Referenced by: '<S4>/Saturation'
                                        */
  real_T Constant7_Value_d;            /* Expression: 10
                                        * Referenced by: '<S6>/Constant7'
                                        */
  real_T Constant10_Value_p;           /* Expression: 0.4
                                        * Referenced by: '<S6>/Constant10'
                                        */
  real_T q3_Value;                     /* Expression: 0
                                        * Referenced by: '<Root>/q3'
                                        */
  real_T Gain2_Gain;                   /* Expression: 360
                                        * Referenced by: '<S7>/Gain2'
                                        */
  real_T Constant2_Value;              /* Expression: 360
                                        * Referenced by: '<S10>/Constant2'
                                        */
  real_T Switch2_Threshold_a;          /* Expression: 180
                                        * Referenced by: '<S10>/Switch2'
                                        */
  real_T Constant9_Value_e;            /* Expression: 0
                                        * Referenced by: '<S6>/Constant9'
                                        */
  real_T Switch1_Threshold_i;          /* Expression: 2
                                        * Referenced by: '<S6>/Switch1'
                                        */
  real_T Constant8_Value_l;            /* Expression: -10
                                        * Referenced by: '<S6>/Constant8'
                                        */
  real_T Gain1_Gain_p;                 /* Expression: -1
                                        * Referenced by: '<S6>/Gain1'
                                        */
  real_T Switch2_Threshold_j;          /* Expression: 2
                                        * Referenced by: '<S6>/Switch2'
                                        */
  real_T Saturation_UpperSat_e;        /* Expression: 100
                                        * Referenced by: '<S6>/Saturation'
                                        */
  real_T Saturation_LowerSat_m;        /* Expression: -100
                                        * Referenced by: '<S6>/Saturation'
                                        */
  real_T Constant7_Value_o;            /* Expression: 10
                                        * Referenced by: '<S5>/Constant7'
                                        */
  real_T Constant10_Value_j;           /* Expression: 0.4
                                        * Referenced by: '<S5>/Constant10'
                                        */
  real_T q2_Value;                     /* Expression: 0
                                        * Referenced by: '<Root>/q2'
                                        */
  real_T Gain2_Gain_f;                 /* Expression: 360
                                        * Referenced by: '<S8>/Gain2'
                                        */
  real_T Constant2_Value_i;            /* Expression: 360
                                        * Referenced by: '<S9>/Constant2'
                                        */
  real_T Switch2_Threshold_e;          /* Expression: 180
                                        * Referenced by: '<S9>/Switch2'
                                        */
  real_T Constant9_Value_k;            /* Expression: 0
                                        * Referenced by: '<S5>/Constant9'
                                        */
  real_T Switch1_Threshold_d;          /* Expression: 2
                                        * Referenced by: '<S5>/Switch1'
                                        */
  real_T Constant8_Value_h;            /* Expression: -10
                                        * Referenced by: '<S5>/Constant8'
                                        */
  real_T Gain1_Gain_k;                 /* Expression: -1
                                        * Referenced by: '<S5>/Gain1'
                                        */
  real_T Switch2_Threshold_l;          /* Expression: 2
                                        * Referenced by: '<S5>/Switch2'
                                        */
  real_T Saturation_UpperSat_m;        /* Expression: 100
                                        * Referenced by: '<S5>/Saturation'
                                        */
  real_T Saturation_LowerSat_h;        /* Expression: -100
                                        * Referenced by: '<S5>/Saturation'
                                        */
  int32_T Gain_Gain_f;                 /* Computed Parameter: Gain_Gain_f
                                        * Referenced by: '<Root>/Gain'
                                        */
  int32_T Gain1_Gain_d;                /* Computed Parameter: Gain1_Gain_d
                                        * Referenced by: '<S7>/Gain1'
                                        */
  int32_T Gain1_Gain_dj;               /* Computed Parameter: Gain1_Gain_dj
                                        * Referenced by: '<S8>/Gain1'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_main_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    time_T stepSize0;
    uint32_T clockTick1;
    struct {
      uint8_T TID[2];
    } TaskCounters;

    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block parameters (auto storage) */
extern P_main_T main_P;

/* Block signals (auto storage) */
extern B_main_T main_B;

/* Block states (auto storage) */
extern DW_main_T main_DW;

/* Model entry point functions */
extern void main_initialize(void);
extern void main_output(void);
extern void main_update(void);
extern void main_terminate(void);

/* Real-time Model object */
extern RT_MODEL_main_T *const main_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'main'
 * '<S1>'   : 'main/Motor'
 * '<S2>'   : 'main/Motor1'
 * '<S3>'   : 'main/Motor2'
 * '<S4>'   : 'main/REGULATOR  '
 * '<S5>'   : 'main/REGULATOR  q2'
 * '<S6>'   : 'main/REGULATOR q3  1'
 * '<S7>'   : 'main/Subsystem'
 * '<S8>'   : 'main/Subsystem1'
 * '<S9>'   : 'main/REGULATOR  q2/prilagodba e'
 * '<S10>'  : 'main/REGULATOR q3  1/prilagodba e'
 */
#endif                                 /* RTW_HEADER_main_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
