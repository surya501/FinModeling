require 'fileutils'
require 'digest' 

require 'sec_query'
require 'edgar'
require 'yahoofinance'
require 'finmodeling/yahoo_finance_helpers.rb'
require 'nasdaq_query'

require 'xbrlware-ruby19'
require 'xbrlware-extras'

require 'gsl'
require 'naive_bayes'
require 'statsample'

require 'finmodeling/invalid_filing_error'

require 'finmodeling/float_helpers'
require 'finmodeling/string_helpers'
require 'finmodeling/factory'

require 'finmodeling/paths'

require 'finmodeling/has_string_classifer'

require 'finmodeling/period_array'
require 'finmodeling/rate'
require 'finmodeling/ratio'
require 'finmodeling/company'

require 'finmodeling/company_filings'
require 'finmodeling/company_filing'
require 'finmodeling/annual_report_filing'
require 'finmodeling/quarterly_report_filing'

require 'finmodeling/array_with_stats'
require 'finmodeling/calculation_summary'

require 'finmodeling/can_classify_rows'
require 'finmodeling/can_cache_classifications'
require 'finmodeling/can_cache_summaries'

require 'finmodeling/assets_item_vectors'
require 'finmodeling/assets_item'
require 'finmodeling/liabs_and_equity_item_vectors'
require 'finmodeling/liabs_and_equity_item'
require 'finmodeling/income_statement_item_vectors'
require 'finmodeling/comprehensive_income_statement_item_vectors'
require 'finmodeling/income_statement_item'
require 'finmodeling/comprehensive_income_statement_item'
require 'finmodeling/cash_change_item_vectors'
require 'finmodeling/cash_change_item'
require 'finmodeling/equity_change_item_vectors'
require 'finmodeling/equity_change_item'

require 'finmodeling/company_filing_calculation'
require 'finmodeling/can_choose_successive_periods'
require 'finmodeling/balance_sheet_calculation'
require 'finmodeling/assets_calculation'
require 'finmodeling/liabs_and_equity_calculation'
require 'finmodeling/income_statement_calculation'
require 'finmodeling/comprehensive_income_statement_calculation'
require 'finmodeling/net_income_calculation'
require 'finmodeling/comprehensive_income_calculation'
require 'finmodeling/cash_flow_statement_calculation'
require 'finmodeling/cash_change_calculation'
require 'finmodeling/shareholder_equity_statement_calculation'
require 'finmodeling/equity_change_calculation'

require 'finmodeling/net_income_summary_from_differences'
require 'finmodeling/cash_change_summary_from_differences'

require 'finmodeling/reformulated_income_statement'
require 'finmodeling/reformulated_balance_sheet'
require 'finmodeling/reformulated_cash_flow_statement'
require 'finmodeling/reformulated_shareholder_equity_statement'

require 'finmodeling/capm'
require 'finmodeling/debt_cost_of_capital'
require 'finmodeling/weighted_avg_cost_of_capital'
require 'finmodeling/fama_french_cost_of_equity'
require 'finmodeling/reoi_valuation'

require 'finmodeling/config'

require 'finmodeling/classifiers'
FinModeling::Classifiers.train

require 'finmodeling/balance_sheet_analyses'
require 'finmodeling/income_statement_analyses'
require 'finmodeling/cash_flow_statement_analyses'

require 'finmodeling/forecasted_reformulated_income_statement'
require 'finmodeling/forecasted_reformulated_balance_sheet'

require 'finmodeling/time_series_estimator'
require 'finmodeling/trailing_avg_forecasting_policy'
require 'finmodeling/linear_trend_forecasting_policy'
require 'finmodeling/forecasts'

