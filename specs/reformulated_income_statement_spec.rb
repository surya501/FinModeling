# reformulated_income_statement_spec.rb

require 'spec_helper'

describe FinModeling::ReformulatedIncomeStatement  do
  before(:all) do
    google_2009_annual_rpt = "http://www.sec.gov/Archives/edgar/data/1288776/000119312510030774/0001193125-10-030774-index.htm"
    @filing_2009 = FinModeling::AnnualReportFiling.download google_2009_annual_rpt

    google_2011_annual_rpt = "http://www.sec.gov/Archives/edgar/data/1288776/000119312512025336/0001193125-12-025336-index.htm"
    @filing_2011 = FinModeling::AnnualReportFiling.download google_2011_annual_rpt

    @years_between_stmts = 2.0

    @inc_stmt_2009 = @filing_2009.income_statement
    is_period_2009 = @inc_stmt_2009.periods.last
    @reformed_inc_stmt_2009 = @inc_stmt_2009.reformulated(is_period_2009)

    @bal_sheet_2009 = @filing_2009.balance_sheet
    bs_period_2009 = @bal_sheet_2009.periods.last
    @reformed_bal_sheet_2009 = @bal_sheet_2009.reformulated(bs_period_2009)

    @inc_stmt_2011 = @filing_2011.income_statement
    is_period_2011 = @inc_stmt_2011.periods.last
    @reformed_inc_stmt_2011 = @inc_stmt_2011.reformulated(is_period_2011)

    @bal_sheet_2011 = @filing_2011.balance_sheet
    bs_period_2011 = @bal_sheet_2011.periods.last
    @reformed_bal_sheet_2011 = @bal_sheet_2011.reformulated(bs_period_2011)
  end

  describe "operating_revenues" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.operating_revenues.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.operating_revenues.total.should be_within(0.1).of(37905000000.0)
    end
  end

  describe "cost_of_revenues" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.cost_of_revenues.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.cost_of_revenues.total.should be_within(0.1).of(-13188000000.0)
    end
  end

  describe "gross_revenue" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.gross_revenue.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.gross_revenue.total.should be_within(0.1).of(24717000000.0)
    end
  end

  describe "operating_expenses" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.operating_expenses.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.operating_expenses.total.should be_within(0.1).of(-12475000000.0)
    end
  end

  describe "income_from_sales_before_tax" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.income_from_sales_before_tax.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.income_from_sales_before_tax.total.should be_within(0.1).of(12242000000.0)
    end
  end

  describe "income_from_sales_after_tax" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.income_from_sales_after_tax.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.income_from_sales_after_tax.total.should be_within(0.1).of(9682400000.0)
    end
  end

  describe "operating_income_after_tax" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.operating_income_after_tax.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.operating_income_after_tax.total.should be_within(0.1).of(9357400000.0)
    end
  end

  describe "net_financing_income" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.net_financing_income.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.net_financing_income.total.should be_within(0.1).of(379600000.0)
    end
  end

  describe "comprehensive_income" do
    it "returns a CalculationSummary" do
      @reformed_inc_stmt_2011.comprehensive_income.should be_an_instance_of FinModeling::CalculationSummary
    end
    it "totals up to the right amount" do
      @reformed_inc_stmt_2011.comprehensive_income.total.should be_within(0.1).of(9737000000.0)
    end
  end

  describe "gross_margin" do
    it "returns a float" do
      @reformed_inc_stmt_2011.gross_margin.should be_an_instance_of Float
    end
    it "totals up to the right amount" do
      gm = @reformed_inc_stmt_2011.gross_revenue.total / @reformed_inc_stmt_2011.operating_revenues.total
      @reformed_inc_stmt_2011.gross_margin.should be_within(0.001).of(gm)
    end
  end

  describe "sales_profit_margin" do
    it "returns a float" do
      @reformed_inc_stmt_2011.sales_profit_margin.should be_an_instance_of Float
    end
    it "totals up to the right amount" do
      sales_pm = @reformed_inc_stmt_2011.income_from_sales_after_tax.total / @reformed_inc_stmt_2011.operating_revenues.total
      @reformed_inc_stmt_2011.sales_profit_margin.should be_within(0.001).of(sales_pm)
    end
  end

  describe "operating_profit_margin" do
    it "returns a float" do
      @reformed_inc_stmt_2011.operating_profit_margin.should be_an_instance_of Float
    end
    it "totals up to the right amount" do
      pm = @reformed_inc_stmt_2011.operating_income_after_tax.total / @reformed_inc_stmt_2011.operating_revenues.total
      @reformed_inc_stmt_2011.operating_profit_margin.should be_within(0.001).of(pm)
    end
  end

  describe "fi_over_sales" do
    it "returns a float" do
      @reformed_inc_stmt_2011.fi_over_sales.should be_an_instance_of Float
    end
    it "totals up to the right amount" do
      fi_over_sales = @reformed_inc_stmt_2011.net_financing_income.total / @reformed_inc_stmt_2011.operating_revenues.total
      @reformed_inc_stmt_2011.fi_over_sales.should be_within(0.001).of(fi_over_sales)
    end
  end

  describe "ni_over_sales" do
    it "returns a float" do
      @reformed_inc_stmt_2011.ni_over_sales.should be_an_instance_of Float
    end
    it "totals up to the right amount" do
      ni_over_sales = @reformed_inc_stmt_2011.comprehensive_income.total / @reformed_inc_stmt_2011.operating_revenues.total
      @reformed_inc_stmt_2011.ni_over_sales.should be_within(0.001).of(ni_over_sales)
    end
  end

  describe "sales_over_noa" do
    it "returns a float" do
      @reformed_inc_stmt_2011.sales_over_noa(@reformed_bal_sheet_2011).should be_an_instance_of Float
    end
    it "totals up to the right amount" do
      sales_over_noa = @reformed_inc_stmt_2011.operating_revenues.total / @reformed_bal_sheet_2011.net_operating_assets.total
      @reformed_inc_stmt_2011.sales_over_noa(@reformed_bal_sheet_2011).should be_within(0.001).of(sales_over_noa)
    end
  end

  describe "fi_over_nfa" do
    it "returns a float" do
      @reformed_inc_stmt_2011.fi_over_nfa(@reformed_bal_sheet_2011).should be_an_instance_of Float
    end
    it "totals up to the right amount" do
      fi_over_nfa = @reformed_inc_stmt_2011.net_financing_income.total / @reformed_bal_sheet_2011.net_financial_assets.total
      @reformed_inc_stmt_2011.fi_over_nfa(@reformed_bal_sheet_2011).should be_within(0.001).of(fi_over_nfa)
    end
  end

  describe "revenue_growth" do
    it "totals up to the right amount" do
      rev0 = @reformed_inc_stmt_2009.operating_revenues.total
      rev1 = @reformed_inc_stmt_2011.operating_revenues.total
      expected_growth = (rev1 / rev0)**(1.0/@years_between_stmts) - 1.0
      @reformed_inc_stmt_2011.revenue_growth(@reformed_inc_stmt_2009).should be_within(0.001).of(expected_growth)
    end
  end

  describe "core_oi_growth" do
    it "totals up to the right amount" do
      core_oi0 = @reformed_inc_stmt_2009.income_from_sales_after_tax.total
      core_oi1 = @reformed_inc_stmt_2011.income_from_sales_after_tax.total
      expected_growth = (core_oi1 / core_oi0)**(1.0/@years_between_stmts) - 1.0
      @reformed_inc_stmt_2011.core_oi_growth(@reformed_inc_stmt_2009).should be_within(0.001).of(expected_growth)
    end
  end

  describe "oi_growth" do
    it "totals up to the right amount" do
      core_oi0 = @reformed_inc_stmt_2009.operating_income_after_tax.total
      core_oi1 = @reformed_inc_stmt_2011.operating_income_after_tax.total
      expected_growth = (core_oi1 / core_oi0)**(1.0/@years_between_stmts) - 1.0
      @reformed_inc_stmt_2011.oi_growth(@reformed_inc_stmt_2009).should be_within(0.001).of(expected_growth)
    end
  end

  describe "re_oi" do
    before(:all) do
      @expected_rate_of_return = 0.10
    end
    it "returns a float" do
      @reformed_inc_stmt_2011.re_oi(@reformed_bal_sheet_2009, @expected_rate_of_return).should be_an_instance_of Float
    end
    it "totals up to the right amount" do
      re_oi = 6868337409.999998
      @reformed_inc_stmt_2011.re_oi(@reformed_bal_sheet_2009, @expected_rate_of_return).should be_within(1.0).of(re_oi)
    end
  end

  describe "analysis" do
    subject {@reformed_inc_stmt_2011.analysis(@reformed_bal_sheet_2011, @reformed_inc_stmt_2009, @reformed_bal_sheet_2009) }

    it { should be_an_instance_of FinModeling::CalculationSummary }
    it "contains the expected rows" do
      expected_keys = [ "Revenue (000's)", "Core OI (000's)", "OI (000's)", "FI (000's)",
                        "NI (000's)", "Gross Margin", "Sales PM", "Operating PM",
                        "FI / Sales", "NI / Sales", "Sales / NOA", "FI / NFA",
                        "Revenue Growth", "Core OI Growth", "OI Growth", "ReOI (000's)" ]

      subject.rows.map{ |row| row.key }.should == expected_keys
    end
  end

  describe "-" do
    before(:all) do
      google_2011_q3_rpt = "http://www.sec.gov/Archives/edgar/data/1288776/000119312511282235/0001193125-11-282235-index.htm"
      @filing_2011_q3 = FinModeling::AnnualReportFiling.download google_2011_q3_rpt 
  
      @inc_stmt_2011_q3 = @filing_2011_q3.income_statement
      is_period_2011_q3 = @inc_stmt_2011_q3.periods.threequarterly.last
      @reformed_inc_stmt_2011_q3 = @inc_stmt_2011_q3.reformulated(is_period_2011_q3)

      @diff = @reformed_inc_stmt_2011 - @reformed_inc_stmt_2011_q3
    end
    subject { @diff }

    it { should be_an_instance_of FinModeling::ReformulatedIncomeStatement }
    its(:period) { should_not be_nil } # FIXME

    it "returns the difference between the two re_is's for each calculation" do
      methods = [ :operating_revenues, :cost_of_revenues, :gross_revenue,
                  :operating_expenses, :income_from_sales_before_tax,
                  :income_from_sales_after_tax, :operating_income_after_tax,
                  :net_financing_income, :comprehensive_income ]
                  #:gross_margin, :sales_profit_margin, :operating_profit_margin,
                  #:fi_over_sales, :ni_over_sales, :sales_over_noa,
                  #:fi_over_nfa, :revenue_growth, :core_oi_growth,
                  #:oi_growth, :re_oi ]

      methods.each do |method|
        expected_val = @reformed_inc_stmt_2011.send(method).total - @reformed_inc_stmt_2011_q3.send(method).total
        @diff.send(method).total.should be_within(1.0).of(expected_val)
      end
    end

    it "returns values that are close to 1/4th of the annual value" do
      methods = [ :operating_revenues, :cost_of_revenues, :gross_revenue,
                  :operating_expenses, :income_from_sales_before_tax,
                  :income_from_sales_after_tax, :operating_income_after_tax,
                  #:net_financing_income, 
                  :comprehensive_income ]
                  #:gross_margin, :sales_profit_margin, :operating_profit_margin,
                  #:fi_over_sales, :ni_over_sales, :sales_over_noa,
                  #:fi_over_nfa, :revenue_growth, :core_oi_growth,
                  #:oi_growth, :re_oi ]

      methods.each do |method|
        orig = @reformed_inc_stmt_2011.send(method).total
        max = (orig > 0) ? (0.35 * orig) : (0.15 * orig)
        min = (orig > 0) ? (0.15 * orig) : (0.35 * orig)
        actual = @diff.send(method).total
        if (actual < min) || (actual > max)
          err = "#{method} returns #{actual.to_nearest_thousand.to_s.with_thousands_separators}, "
          err += "which is outside bounds: [#{min.to_nearest_thousand.to_s.with_thousands_separators}, "
          err += "#{max.to_nearest_thousand.to_s.with_thousands_separators}]"
          puts err
        end
        @diff.send(method).total.should be > min
        @diff.send(method).total.should be < max
      end
    end
  end

end

