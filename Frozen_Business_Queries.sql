select * from fronzen_data;


-- Q1. What is the overall financial performance of the company, and how much of the revenue is being lost due to waste?

select 
    SUM("Revenue") AS total_revenue,
    SUM("Waste_Cost") AS total_waste_cost,
    SUM("Profit") AS total_profit
from fronzen_data;

-- Q2. Which regions are contributing the most to waste cost and profit loss?

select 
    "Region",
    SUM("Waste_Cost") AS total_waste_cost,
    SUM("Profit") AS total_profit
from fronzen_data
group by "Region"
order by total_waste_cost DESC;

-- Q3. Which product categories generate the highest waste cost and profit loss?

select 
    "Category",
    SUM("Waste_Cost") AS total_waste_cost,
    SUM("Profit") AS total_profit
from fronzen_data
group by "Category"
order by total_waste_cost DESC;


-- Q4. Does temperature deviation increase product spoilage and waste costs?

select 
    "Temp_Deviation",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Temp_Deviation"
order by total_waste_cost DESC
limit 10;


--Q5. Does longer distribution time increase product waste and spoilage costs?

select 
    "Distribution_Hours",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Distribution_Hours"
order by total_waste_cost DESC
limit 10;

--Q6. Do suppliers with lower quality scores contribute to higher waste costs?

select 
    "Supplier_Score",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Supplier_Score"
order by total_waste_cost DESC
limit 10;

--Q7. Do higher discount percentages reduce profit margins and increase waste?

select 
    "Discount_Pct",
    AVG("Profit_Margin_Pct") AS avg_profit_margin,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Discount_Pct"
order by "Discount_Pct" DESC
limit 10;

--Q8. Does the remaining shelf life at the time of purchase affect product waste?

select 
    "Days_Remaining_At_Purchase",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Days_Remaining_At_Purchase"
order by total_waste_cost DESC
limit 10;

--Q9. Does demand variability lead to higher product waste and spoilage?

select 
    "Demand_Variability",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Demand_Variability"
order by total_waste_cost DESC
limit 10;

--Q10. Do temperature abuse events significantly increase waste costs and spoilage rates?

select 
    "Temp_Abuse_Events",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Temp_Abuse_Events"
order by total_waste_cost DESC;

--Q11. Do products with higher spoilage sensitivity contribute more to waste costs?

select 
    "Spoilage_Sensitivity",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Spoilage_Sensitivity"
order by total_waste_cost DESC
limit 10;

--Q12. Does handling quality affect spoilage and waste costs?

select
    "Handling_Score",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost
from fronzen_data
group by "Handling_Score"
order by total_waste_cost DESC;

--Q13. Do promotional campaigns reduce waste or negatively impact profitability?

select 
    "Is_Promoted",
    AVG("Waste_Pct") AS avg_waste_percentage,
    SUM("Waste_Cost") AS total_waste_cost,
    AVG("Profit_Margin_Pct") AS avg_profit_margin
from fronzen_data
group by "Is_Promoted";