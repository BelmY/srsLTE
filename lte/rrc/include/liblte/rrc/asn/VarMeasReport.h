/*
 * Generated by asn1c-0.9.28 (http://lionet.info/asn1c)
 * From ASN.1 module "EUTRA-UE-Variables"
 * 	found in "EUTRA-UE-Variables.asn"
 */

#ifndef	_VarMeasReport_H_
#define	_VarMeasReport_H_


#include <liblte/rrc/asn/asn_application.h>

/* Including external dependencies */
#include "liblte/rrc/asn/MeasId.h"
#include <liblte/rrc/asn/NativeInteger.h>
#include <liblte/rrc/asn/constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct CellsTriggeredList;

/* VarMeasReport */
typedef struct VarMeasReport {
	MeasId_t	 measId;
	struct CellsTriggeredList	*cellsTriggeredList	/* OPTIONAL */;
	long	 numberOfReportsSent;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} VarMeasReport_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_VarMeasReport;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "liblte/rrc/asn/CellsTriggeredList.h"

#endif	/* _VarMeasReport_H_ */
#include <liblte/rrc/asn/asn_internal.h>