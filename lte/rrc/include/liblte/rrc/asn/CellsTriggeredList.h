/*
 * Generated by asn1c-0.9.28 (http://lionet.info/asn1c)
 * From ASN.1 module "EUTRA-UE-Variables"
 * 	found in "EUTRA-UE-Variables.asn"
 */

#ifndef	_CellsTriggeredList_H_
#define	_CellsTriggeredList_H_


#include <liblte/rrc/asn/asn_application.h>

/* Including external dependencies */
#include <liblte/rrc/asn/asn_SEQUENCE_OF.h>
#include "liblte/rrc/asn/PhysCellId.h"
#include "liblte/rrc/asn/PhysCellIdCDMA2000.h"
#include "liblte/rrc/asn/PhysCellIdUTRA-FDD.h"
#include "liblte/rrc/asn/PhysCellIdUTRA-TDD.h"
#include <liblte/rrc/asn/constr_CHOICE.h>
#include "liblte/rrc/asn/CarrierFreqGERAN.h"
#include "liblte/rrc/asn/PhysCellIdGERAN.h"
#include <liblte/rrc/asn/constr_SEQUENCE.h>
#include <liblte/rrc/asn/constr_SEQUENCE_OF.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum Member_PR {
	Member_PR_NOTHING,	/* No components present */
	Member_PR_physCellIdEUTRA,
	Member_PR_physCellIdUTRA,
	Member_PR_physCellIdGERAN,
	Member_PR_physCellIdCDMA2000
} Member_PR;
typedef enum physCellIdUTRA_PR {
	physCellIdUTRA_PR_NOTHING,	/* No components present */
	physCellIdUTRA_PR_fdd,
	physCellIdUTRA_PR_tdd
} physCellIdUTRA_PR;

/* CellsTriggeredList */
typedef struct CellsTriggeredList {
	A_SEQUENCE_OF(struct Member {
		Member_PR present;
		union CellsTriggeredList__Member_u {
			PhysCellId_t	 physCellIdEUTRA;
			struct physCellIdUTRA {
				physCellIdUTRA_PR present;
				union physCellIdUTRA_u {
					PhysCellIdUTRA_FDD_t	 fdd;
					PhysCellIdUTRA_TDD_t	 tdd;
				} choice;
				
				/* Context for parsing across buffer boundaries */
				asn_struct_ctx_t _asn_ctx;
			} physCellIdUTRA;
			struct physCellIdGERAN {
				CarrierFreqGERAN_t	 carrierFreq;
				PhysCellIdGERAN_t	 physCellId;
				
				/* Context for parsing across buffer boundaries */
				asn_struct_ctx_t _asn_ctx;
			} physCellIdGERAN;
			PhysCellIdCDMA2000_t	 physCellIdCDMA2000;
		} choice;
		
		/* Context for parsing across buffer boundaries */
		asn_struct_ctx_t _asn_ctx;
	} ) list;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} CellsTriggeredList_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_CellsTriggeredList;

#ifdef __cplusplus
}
#endif

#endif	/* _CellsTriggeredList_H_ */
#include <liblte/rrc/asn/asn_internal.h>