/*
 * File: main.c
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

#include "main.h"
#include "main_private.h"
#include "main_dt.h"
#include "nxt_util.h"

/* Block signals (auto storage) */
B_main_T main_B;

/* Block states (auto storage) */
DW_main_T main_DW;

/* Real-time model */
RT_MODEL_main_T main_M_;
RT_MODEL_main_T *const main_M = &main_M_;
static void rate_scheduler(void);
void sMultiWordMul(const uint32_T u1[], int32_T n1, const uint32_T u2[], int32_T
                   n2, uint32_T y[], int32_T n)
{
  int32_T i;
  int32_T j;
  int32_T k;
  int32_T nj;
  uint32_T u1i;
  uint32_T yk;
  uint32_T a1;
  uint32_T a0;
  uint32_T b1;
  uint32_T w10;
  uint32_T w01;
  uint32_T cb;
  boolean_T isNegative1;
  boolean_T isNegative2;
  uint32_T cb1;
  uint32_T cb2;
  isNegative1 = ((u1[n1 - 1] & 2147483648U) != 0U);
  isNegative2 = ((u2[n2 - 1] & 2147483648U) != 0U);
  cb1 = 1U;

  /* Initialize output to zero */
  for (k = 0; k < n; k++) {
    y[k] = 0U;
  }

  for (i = 0; i < n1; i++) {
    cb = 0U;
    u1i = u1[i];
    if (isNegative1) {
      u1i = ~u1i + cb1;
      cb1 = u1i < cb1 ? 1U : 0U;
    }

    a1 = u1i >> 16U;
    a0 = u1i & 65535U;
    cb2 = 1U;
    k = n - i;
    nj = n2 <= k ? n2 : k;
    k = i;
    for (j = 0; j < nj; j++) {
      yk = y[k];
      u1i = u2[j];
      if (isNegative2) {
        u1i = ~u1i + cb2;
        cb2 = u1i < cb2 ? 1U : 0U;
      }

      b1 = u1i >> 16U;
      u1i &= 65535U;
      w10 = a1 * u1i;
      w01 = a0 * b1;
      yk += cb;
      cb = yk < cb ? 1U : 0U;
      u1i *= a0;
      yk += u1i;
      cb += yk < u1i ? 1U : 0U;
      u1i = w10 << 16U;
      yk += u1i;
      cb += yk < u1i ? 1U : 0U;
      u1i = w01 << 16U;
      yk += u1i;
      cb += yk < u1i ? 1U : 0U;
      y[k] = yk;
      cb += w10 >> 16U;
      cb += w01 >> 16U;
      cb += a1 * b1;
      k++;
    }

    if (k < n) {
      y[k] = cb;
    }
  }

  /* Apply sign */
  if (isNegative1 != isNegative2) {
    cb = 1U;
    for (k = 0; k < n; k++) {
      yk = ~y[k] + cb;
      y[k] = yk;
      cb = yk < cb ? 1U : 0U;
    }
  }
}

real_T sMultiWord2Double(const uint32_T u1[], int32_T n1, int32_T e1)
{
  real_T y;
  int32_T i;
  int32_T exp_0;
  uint32_T u1i;
  uint32_T cb;
  y = 0.0;
  exp_0 = e1;
  if ((u1[n1 - 1] & 2147483648U) != 0U) {
    cb = 1U;
    for (i = 0; i < n1; i++) {
      u1i = ~u1[i];
      cb += u1i;
      y -= ldexp(cb, exp_0);
      cb = cb < u1i ? 1U : 0U;
      exp_0 += 32;
    }
  } else {
    for (i = 0; i < n1; i++) {
      y += ldexp(u1[i], exp_0);
      exp_0 += 32;
    }
  }

  return y;
}

/*
 *   This function updates active task flag for each subrate.
 * The function is called at model base rate, hence the
 * generated code self-manages all its subrates.
 */
static void rate_scheduler(void)
{
  /* Compute which subrates run during the next base time step.  Subrates
   * are an integer multiple of the base rate counter.  Therefore, the subtask
   * counter is reset when it reaches its limit (zero means run).
   */
  (main_M->Timing.TaskCounters.TID[1])++;
  if ((main_M->Timing.TaskCounters.TID[1]) > 9) {/* Sample time: [1.0s, 0.0s] */
    main_M->Timing.TaskCounters.TID[1] = 0;
  }
}

/* Model output function */
void main_output(void)
{
  int32_T rtb_Encoder2_0;
  int8_T tmp;
  int8_T tmp_0;
  int8_T tmp_1;
  real_T rtb_Saturation;
  real_T rtb_Product3;
  uint32_T tmp_2;
  uint32_T tmp_3;
  int64m_T tmp_4;
  int64m_T tmp_5;
  int64m_T tmp_6;
  real_T rtb_Saturation_0;

  /* S-Function (nxt_encoder): '<Root>/Encoder' */
  rtb_Encoder2_0 = getEncoderValueNoReset(((uint8_T)3U));

  /* Gain: '<Root>/Gain' incorporates:
   *  S-Function (nxt_encoder): '<Root>/Encoder'
   */
  tmp_2 = (uint32_T)main_P.Gain_Gain_f;
  tmp_3 = (uint32_T)rtb_Encoder2_0;
  sMultiWordMul(&tmp_2, 1, &tmp_3, 1, &tmp_4.chunks[0U], 2);
  main_B.Gain = tmp_4;

  /* Sum: '<Root>/Sum' incorporates:
   *  Constant: '<Root>/q1'
   */
  rtb_Saturation = main_P.q1_Value - sMultiWord2Double(&main_B.Gain.chunks[0U],
    2, 0) * 1.4551915228366852E-11;

  /* Product: '<S4>/Product3' incorporates:
   *  Constant: '<S4>/Constant10'
   */
  rtb_Product3 = main_P.Constant10_Value * rtb_Saturation;

  /* Sum: '<S4>/Sum2' incorporates:
   *  Constant: '<S4>/Constant7'
   */
  main_B.Sum2 = main_P.Constant7_Value + rtb_Product3;

  /* Sum: '<S4>/Sum3' incorporates:
   *  Constant: '<S4>/Constant8'
   */
  main_B.Sum3 = rtb_Product3 + main_P.Constant8_Value;

  /* Switch: '<S4>/Switch1' incorporates:
   *  Constant: '<S4>/Constant9'
   */
  if (rtb_Saturation > main_P.Switch1_Threshold_m) {
    rtb_Saturation_0 = main_B.Sum2;
  } else {
    rtb_Saturation_0 = main_P.Constant9_Value;
  }

  /* End of Switch: '<S4>/Switch1' */

  /* Switch: '<S4>/Switch2' incorporates:
   *  Constant: '<S4>/Constant9'
   *  Gain: '<S4>/Gain1'
   */
  if (main_P.Gain1_Gain * rtb_Saturation > main_P.Switch2_Threshold) {
    rtb_Product3 = main_B.Sum3;
  } else {
    rtb_Product3 = main_P.Constant9_Value;
  }

  /* End of Switch: '<S4>/Switch2' */

  /* Sum: '<S4>/Sum1' */
  rtb_Product3 += rtb_Saturation_0;

  /* Saturate: '<S4>/Saturation' */
  if (rtb_Product3 > main_P.Saturation_UpperSat) {
    rtb_Product3 = main_P.Saturation_UpperSat;
  } else {
    if (rtb_Product3 < main_P.Saturation_LowerSat) {
      rtb_Product3 = main_P.Saturation_LowerSat;
    }
  }

  /* DataTypeConversion: '<S3>/Data Type Conversion' incorporates:
   *  Saturate: '<S4>/Saturation'
   */
  rtb_Product3 = floor(rtb_Product3);
  if (rtb_Product3 < 128.0) {
    if (rtb_Product3 >= -128.0) {
      /* S-Function (nxt_motor): '<S3>/Motor' */
      tmp = (int8_T)rtb_Product3;
    } else {
      /* S-Function (nxt_motor): '<S3>/Motor' */
      tmp = MIN_int8_T;
    }
  } else {
    /* S-Function (nxt_motor): '<S3>/Motor' */
    tmp = MAX_int8_T;
  }

  /* End of DataTypeConversion: '<S3>/Data Type Conversion' */

  /* S-Function (nxt_motor): '<S3>/Motor' */
  setMotor(&tmp, ((uint8_T)3U), ((uint8_T)2U));

  /* S-Function (nxt_encoder): '<Root>/Encoder1' */
  rtb_Encoder2_0 = getEncoderValueNoReset(((uint8_T)1U));

  /* Gain: '<S7>/Gain1' incorporates:
   *  S-Function (nxt_encoder): '<Root>/Encoder1'
   */
  tmp_2 = (uint32_T)main_P.Gain1_Gain_d;
  tmp_3 = (uint32_T)rtb_Encoder2_0;
  sMultiWordMul(&tmp_2, 1, &tmp_3, 1, &tmp_5.chunks[0U], 2);

  /* Sum: '<S7>/Sum1' incorporates:
   *  DataTypeConversion: '<S7>/Data Type Conversion'
   *  Gain: '<S7>/Gain2'
   *  Rounding: '<S7>/Rounding Function'
   *  S-Function (nxt_encoder): '<Root>/Encoder1'
   */
  main_B.Sum1 = (real_T)rtb_Encoder2_0 - floor(sMultiWord2Double(&tmp_5.chunks
    [0U], 2, 0) * 1.8189894035458565E-12) * main_P.Gain2_Gain;

  /* Sum: '<Root>/Sum3' incorporates:
   *  Constant: '<Root>/q3'
   */
  rtb_Saturation = main_P.q3_Value - main_B.Sum1;

  /* Switch: '<S10>/Switch2' incorporates:
   *  Gain: '<S10>/Gain'
   *  Switch: '<S10>/Switch1'
   */
  if (rtb_Saturation > main_P.Switch2_Threshold_a) {
    /* Switch: '<S10>/Switch3' incorporates:
     *  Constant: '<S10>/Constant2'
     *  Sum: '<S10>/Sum4'
     */
    if (rtb_Saturation > main_P.Switch3_Threshold_f) {
      rtb_Saturation -= main_P.Constant2_Value;
    }

    /* End of Switch: '<S10>/Switch3' */
  } else {
    if (main_P.Gain_Gain_o * rtb_Saturation > main_P.Switch1_Threshold_f) {
      /* Switch: '<S10>/Switch1' incorporates:
       *  Constant: '<S10>/Constant2'
       *  Sum: '<S10>/Sum1'
       */
      rtb_Saturation += main_P.Constant2_Value;
    }
  }

  /* End of Switch: '<S10>/Switch2' */

  /* Product: '<S6>/Product3' incorporates:
   *  Constant: '<S6>/Constant10'
   */
  rtb_Product3 = main_P.Constant10_Value_p * rtb_Saturation;

  /* Sum: '<S6>/Sum2' incorporates:
   *  Constant: '<S6>/Constant7'
   */
  main_B.Sum2_c = main_P.Constant7_Value_d + rtb_Product3;

  /* Sum: '<S6>/Sum3' incorporates:
   *  Constant: '<S6>/Constant8'
   */
  main_B.Sum3_b = rtb_Product3 + main_P.Constant8_Value_l;

  /* Switch: '<S6>/Switch1' incorporates:
   *  Constant: '<S6>/Constant9'
   */
  if (rtb_Saturation > main_P.Switch1_Threshold_i) {
    rtb_Saturation_0 = main_B.Sum2_c;
  } else {
    rtb_Saturation_0 = main_P.Constant9_Value_e;
  }

  /* End of Switch: '<S6>/Switch1' */

  /* Switch: '<S6>/Switch2' incorporates:
   *  Constant: '<S6>/Constant9'
   *  Gain: '<S6>/Gain1'
   */
  if (main_P.Gain1_Gain_p * rtb_Saturation > main_P.Switch2_Threshold_j) {
    rtb_Product3 = main_B.Sum3_b;
  } else {
    rtb_Product3 = main_P.Constant9_Value_e;
  }

  /* End of Switch: '<S6>/Switch2' */

  /* Sum: '<S6>/Sum1' */
  rtb_Product3 += rtb_Saturation_0;

  /* Saturate: '<S6>/Saturation' */
  if (rtb_Product3 > main_P.Saturation_UpperSat_e) {
    rtb_Product3 = main_P.Saturation_UpperSat_e;
  } else {
    if (rtb_Product3 < main_P.Saturation_LowerSat_m) {
      rtb_Product3 = main_P.Saturation_LowerSat_m;
    }
  }

  /* DataTypeConversion: '<S1>/Data Type Conversion' incorporates:
   *  Saturate: '<S6>/Saturation'
   */
  rtb_Product3 = floor(rtb_Product3);
  if (rtb_Product3 < 128.0) {
    if (rtb_Product3 >= -128.0) {
      /* S-Function (nxt_motor): '<S1>/Motor' */
      tmp_0 = (int8_T)rtb_Product3;
    } else {
      /* S-Function (nxt_motor): '<S1>/Motor' */
      tmp_0 = MIN_int8_T;
    }
  } else {
    /* S-Function (nxt_motor): '<S1>/Motor' */
    tmp_0 = MAX_int8_T;
  }

  /* End of DataTypeConversion: '<S1>/Data Type Conversion' */

  /* S-Function (nxt_motor): '<S1>/Motor' */
  setMotor(&tmp_0, ((uint8_T)1U), ((uint8_T)2U));

  /* S-Function (nxt_encoder): '<Root>/Encoder2' */
  rtb_Encoder2_0 = getEncoderValueNoReset(((uint8_T)2U));

  /* Gain: '<S8>/Gain1' incorporates:
   *  S-Function (nxt_encoder): '<Root>/Encoder2'
   */
  tmp_2 = (uint32_T)main_P.Gain1_Gain_dj;
  tmp_3 = (uint32_T)rtb_Encoder2_0;
  sMultiWordMul(&tmp_2, 1, &tmp_3, 1, &tmp_6.chunks[0U], 2);

  /* Sum: '<S8>/Sum1' incorporates:
   *  DataTypeConversion: '<S8>/Data Type Conversion'
   *  Gain: '<S8>/Gain2'
   *  Rounding: '<S8>/Rounding Function'
   *  S-Function (nxt_encoder): '<Root>/Encoder2'
   */
  main_B.Sum1_k = (real_T)rtb_Encoder2_0 - floor(sMultiWord2Double
    (&tmp_6.chunks[0U], 2, 0) * 1.8189894035458565E-12) * main_P.Gain2_Gain_f;

  /* Sum: '<Root>/Sum4' incorporates:
   *  Constant: '<Root>/q2'
   */
  rtb_Saturation = main_P.q2_Value - main_B.Sum1_k;

  /* Switch: '<S9>/Switch2' incorporates:
   *  Gain: '<S9>/Gain'
   *  Switch: '<S9>/Switch1'
   */
  if (rtb_Saturation > main_P.Switch2_Threshold_e) {
    /* Switch: '<S9>/Switch3' incorporates:
     *  Constant: '<S9>/Constant2'
     *  Sum: '<S9>/Sum4'
     */
    if (rtb_Saturation > main_P.Switch3_Threshold) {
      rtb_Saturation -= main_P.Constant2_Value_i;
    }

    /* End of Switch: '<S9>/Switch3' */
  } else {
    if (main_P.Gain_Gain * rtb_Saturation > main_P.Switch1_Threshold) {
      /* Switch: '<S9>/Switch1' incorporates:
       *  Constant: '<S9>/Constant2'
       *  Sum: '<S9>/Sum1'
       */
      rtb_Saturation += main_P.Constant2_Value_i;
    }
  }

  /* End of Switch: '<S9>/Switch2' */

  /* Product: '<S5>/Product3' incorporates:
   *  Constant: '<S5>/Constant10'
   */
  rtb_Product3 = main_P.Constant10_Value_j * rtb_Saturation;

  /* Sum: '<S5>/Sum2' incorporates:
   *  Constant: '<S5>/Constant7'
   */
  main_B.Sum2_l = main_P.Constant7_Value_o + rtb_Product3;

  /* Sum: '<S5>/Sum3' incorporates:
   *  Constant: '<S5>/Constant8'
   */
  main_B.Sum3_c = rtb_Product3 + main_P.Constant8_Value_h;

  /* Switch: '<S5>/Switch1' incorporates:
   *  Constant: '<S5>/Constant9'
   */
  if (rtb_Saturation > main_P.Switch1_Threshold_d) {
    rtb_Saturation_0 = main_B.Sum2_l;
  } else {
    rtb_Saturation_0 = main_P.Constant9_Value_k;
  }

  /* End of Switch: '<S5>/Switch1' */

  /* Switch: '<S5>/Switch2' incorporates:
   *  Constant: '<S5>/Constant9'
   *  Gain: '<S5>/Gain1'
   */
  if (main_P.Gain1_Gain_k * rtb_Saturation > main_P.Switch2_Threshold_l) {
    rtb_Product3 = main_B.Sum3_c;
  } else {
    rtb_Product3 = main_P.Constant9_Value_k;
  }

  /* End of Switch: '<S5>/Switch2' */

  /* Sum: '<S5>/Sum1' */
  rtb_Product3 += rtb_Saturation_0;

  /* Saturate: '<S5>/Saturation' */
  if (rtb_Product3 > main_P.Saturation_UpperSat_m) {
    rtb_Product3 = main_P.Saturation_UpperSat_m;
  } else {
    if (rtb_Product3 < main_P.Saturation_LowerSat_h) {
      rtb_Product3 = main_P.Saturation_LowerSat_h;
    }
  }

  /* DataTypeConversion: '<S2>/Data Type Conversion' incorporates:
   *  Saturate: '<S5>/Saturation'
   */
  rtb_Product3 = floor(rtb_Product3);
  if (rtb_Product3 < 128.0) {
    if (rtb_Product3 >= -128.0) {
      /* S-Function (nxt_motor): '<S2>/Motor' */
      tmp_1 = (int8_T)rtb_Product3;
    } else {
      /* S-Function (nxt_motor): '<S2>/Motor' */
      tmp_1 = MIN_int8_T;
    }
  } else {
    /* S-Function (nxt_motor): '<S2>/Motor' */
    tmp_1 = MAX_int8_T;
  }

  /* End of DataTypeConversion: '<S2>/Data Type Conversion' */

  /* S-Function (nxt_motor): '<S2>/Motor' */
  setMotor(&tmp_1, ((uint8_T)2U), ((uint8_T)2U));
}

/* Model update function */
void main_update(void)
{
  /* signal main to stop simulation */
  {                                    /* Sample time: [0.1s, 0.0s] */
    if ((rtmGetTFinal(main_M)!=-1) &&
        !((rtmGetTFinal(main_M)-main_M->Timing.taskTime0) >
          main_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(main_M, "Simulation finished");
    }

    if (rtmGetStopRequested(main_M)) {
      rtmSetErrorStatus(main_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   */
  main_M->Timing.taskTime0 =
    (++main_M->Timing.clockTick0) * main_M->Timing.stepSize0;
  if (main_M->Timing.TaskCounters.TID[1] == 0) {
    /* Update absolute timer for sample time: [1.0s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The resolution of this integer timer is 1.0, which is the step size
     * of the task. Size of "clockTick1" ensures timer will not overflow during the
     * application lifespan selected.
     */
    main_M->Timing.clockTick1++;
  }

  rate_scheduler();
}

/* Model initialize function */
void main_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)main_M, 0,
                sizeof(RT_MODEL_main_T));
  rtmSetTFinal(main_M, -1);
  main_M->Timing.stepSize0 = 0.1;

  /* External mode info */
  main_M->Sizes.checksums[0] = (978998084U);
  main_M->Sizes.checksums[1] = (4277501126U);
  main_M->Sizes.checksums[2] = (1753875970U);
  main_M->Sizes.checksums[3] = (505840079U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[9];
    main_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = &rtAlwaysEnabled;
    systemRan[5] = &rtAlwaysEnabled;
    systemRan[6] = &rtAlwaysEnabled;
    systemRan[7] = &rtAlwaysEnabled;
    systemRan[8] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(main_M->extModeInfo,
      &main_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(main_M->extModeInfo, main_M->Sizes.checksums);
    rteiSetTPtr(main_M->extModeInfo, rtmGetTPtr(main_M));
  }

  /* block I/O */
  (void) memset(((void *) &main_B), 0,
                sizeof(B_main_T));

  /* states (dwork) */
  (void) memset((void *)&main_DW, 0,
                sizeof(DW_main_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    main_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 32;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }
}

/* Model terminate function */
void main_terminate(void)
{
  /* Terminate for S-Function (nxt_motor): '<S3>/Motor' */
  terminateMotor(((uint8_T)3U), ((uint8_T)2U));

  /* Terminate for S-Function (nxt_motor): '<S1>/Motor' */
  terminateMotor(((uint8_T)1U), ((uint8_T)2U));

  /* Terminate for S-Function (nxt_motor): '<S2>/Motor' */
  terminateMotor(((uint8_T)2U), ((uint8_T)2U));
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
