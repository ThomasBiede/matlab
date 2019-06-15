#ifndef __c2_test_h__
#define __c2_test_h__

/* Type Definitions */
#ifndef typedef_SFc2_testInstanceStruct
#define typedef_SFc2_testInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_test;
  real32_T c2_img[2764800];
  real32_T c2_X[2764800];
  real32_T c2_out[921600];
  real32_T c2_outputImage[921600];
  real32_T c2_u[2764800];
  real32_T c2_y[921600];
  real32_T c2_fv1[921600];
  real32_T c2_fv0[921600];
  real32_T c2_b_u[921600];
  void *c2_fEmlrtCtx;
  real32_T (*c2_b_img)[2764800];
  real32_T (*c2_b_out)[921600];
} SFc2_testInstanceStruct;

#endif                                 /*typedef_SFc2_testInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c2_test_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c2_test_get_check_sum(mxArray *plhs[]);
extern void c2_test_method_dispatcher(SimStruct *S, int_T method, void *data);

#endif
