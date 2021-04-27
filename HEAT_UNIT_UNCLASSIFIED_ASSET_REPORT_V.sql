CREATE OR REPLACE FORCE EDITIONABLE VIEW  "HEAT_UNIT_UNCLASSIFIED_ASSET_REPORT_V" ("COMPANY_TYPE", "COMPANY", "OPU", "PROJECT_STATUS_CODE", "CINT_STOP_DATE", "PROJECT_NAME", "SEGMENT1_PROJECT_NUMBER", "ASSET_NAME", "ASSET_NUMBER", "PROPERTY_GROUP", "LAND_OR_ROW", "SUB_UTILITY", "UTILITY_ACCOUNT", "ESTIMATE_COST", "ALLOCATION_COST", "ASSET_CATEGORY", "ASSET_LOCATION", "IN_SVC_DATE", "STATUS", "ERROR_DETAILS", "ASSET_BOOK", "PROJECT_ID") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT hupdv.company_type,
    hupdv.company,
    hupdv.OPU,
	hupdv.project_status_code,
	hupdv.CINT_STOP_DATE,
    hep.project_name,
    hep.segment1_project_number,
    huae.asset_name,
    huae.asset_number,
    huae.property_group,
    huae.land_or_row,
    huae.sub_utility,
    huae.UTILITY_ACCOUNT,
    huae.estimate_cost,
    huae.allocation_cost,
    huae.asset_category,
    huae.asset_location,
    huae.in_svc_date,
    hlv.meaning status,--huae.status,
    huae.error_details,
	huae.asset_book,
	hep.PROJECT_ID
FROM
    heat_unit_asset_estimate   huae,
    heat_erp_projects          hep,
	heat_unit_project_details_v hupdv,
    heat_lookup_values hlv
WHERE
    1 = 1
    AND huae.project_id = hep.project_id 
    AND hupdv.project_id = hep.project_id
    and huae.status = hlv.lookup_code
    and lookup_type='HEAT_UNIT_ASSET_STATUS'
/
