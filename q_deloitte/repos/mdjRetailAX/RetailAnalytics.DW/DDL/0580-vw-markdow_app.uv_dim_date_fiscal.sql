﻿DROP VIEW IF EXISTS conformed.uv_dim_date_fiscal;

CREATE VIEW conformed.uv_dim_date_fiscal
	(
	dim_retailer_id
	,batch_id
	,calendar_date
	,dim_date_id
	,is_weekday7
	,is_working_day
	,is_business_holiday
	,is_national_holiday
	,fiscal_date_string
	,fiscal_day_of_month
	,fiscal_day_with_suffix
	,fiscal_month_number
	,fiscal_month_name
	,fiscal_month_start_date
	,fiscal_month_end_date
	,fiscal_year_month
	,fiscal_week_number
	,fiscal_continuum_year_week_number
	,fiscal_continuum_year_week_number_start_date
	,fiscal_continuum_year_week_number_end_date
	,fiscal_week_day_number
	,fiscal_week_day_name
	,fiscal_quarter_name
	,fiscal_quarter_number
	,fiscal_quarter_day_number
	,fiscal_quarter_month_number
	,fiscal_quarter_start_date
	,fiscal_quarter_end_date
	,fiscal_year
	,fiscal_year_start_date
	,fiscal_year_end_date
	)
AS
SELECT
	ddf.dim_retailer_id
	,ddf.batch_id
	,dd.calendar_date
	,ddf.dim_date_id
	,ddf.is_weekday7
	,ddf.is_working_day
	,ddf.is_business_holiday
	,ddf.is_national_holiday
	,ddf.fiscal_date_string
	,ddf.fiscal_day_of_month
	,ddf.fiscal_day_with_suffix
	,ddf.fiscal_month_number
	,ddf.fiscal_month_name
	,ddf.fiscal_month_start_date
	,ddf.fiscal_month_end_date
	,ddf.fiscal_year_month
	,ddf.fiscal_week_number
	,ddf.fiscal_continuum_year_week_number
	,ddf.fiscal_continuum_year_week_number_start_date
	,ddf.fiscal_continuum_year_week_number_end_date
	,ddf.fiscal_week_day_number
	,ddf.fiscal_week_day_name
	,ddf.fiscal_quarter_name
	,ddf.fiscal_quarter_number
	,ddf.fiscal_quarter_day_number
	,ddf.fiscal_quarter_month_number
	,ddf.fiscal_quarter_start_date
	,ddf.fiscal_quarter_end_date
	,ddf.fiscal_year
	,ddf.fiscal_year_start_date
	,ddf.fiscal_year_end_date
FROM
	conformed.dim_date_fiscal ddf
INNER JOIN
	conformed.dim_date dd ON ddf.dim_date_id = dd.dim_date_id;