/*
 * Generated by asn1c-0.9.28 (http://lionet.info/asn1c)
 * From ASN.1 module "EUTRA-InterNodeDefinitions"
 * 	found in "EUTRA-InterNodeDefinitions.asn"
 */

#ifndef	_AS_Config_H_
#define	_AS_Config_H_


#include <liblte/rrc/asn/asn_application.h>

/* Including external dependencies */
#include "liblte/rrc/asn/MeasConfig.h"
#include "liblte/rrc/asn/RadioResourceConfigDedicated.h"
#include "liblte/rrc/asn/SecurityAlgorithmConfig.h"
#include "liblte/rrc/asn/C-RNTI.h"
#include "liblte/rrc/asn/MasterInformationBlock.h"
#include "liblte/rrc/asn/SystemInformationBlockType1.h"
#include "liblte/rrc/asn/SystemInformationBlockType2.h"
#include "liblte/rrc/asn/AntennaInfoCommon.h"
#include "liblte/rrc/asn/ARFCN-ValueEUTRA.h"
#include <liblte/rrc/asn/OCTET_STRING.h>
#include "liblte/rrc/asn/OtherConfig-r9.h"
#include <liblte/rrc/asn/constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct OtherConfig_r9;

/* AS-Config */
typedef struct AS_Config {
	MeasConfig_t	 sourceMeasConfig;
	RadioResourceConfigDedicated_t	 sourceRadioResourceConfig;
	SecurityAlgorithmConfig_t	 sourceSecurityAlgorithmConfig;
	C_RNTI_t	 sourceUE_Identity;
	MasterInformationBlock_t	 sourceMasterInformationBlock;
	SystemInformationBlockType1_t	 sourceSystemInformationBlockType1;
	SystemInformationBlockType2_t	 sourceSystemInformationBlockType2;
	AntennaInfoCommon_t	 antennaInfoCommon;
	ARFCN_ValueEUTRA_t	 sourceDl_CarrierFreq;
	/*
	 * This type is extensible,
	 * possible extensions are below.
	 */
	OCTET_STRING_t	*sourceSystemInformationBlockType1Ext	/* OPTIONAL */;
	struct OtherConfig_r9	*sourceOtherConfig_r9;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} AS_Config_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_AS_Config;

#ifdef __cplusplus
}
#endif

#endif	/* _AS_Config_H_ */
#include <liblte/rrc/asn/asn_internal.h>