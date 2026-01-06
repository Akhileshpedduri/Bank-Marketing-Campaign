

--2 kpi overview
--Total customers
--Subscribed customers
--Subscription rate %

WITH overall_kpi AS (
    SELECT
        COUNT(*) AS total_customers,
        SUM(subscribed) AS subscribed_customers
    FROM bank_analytics
)
SELECT
    total_customers,
    subscribed_customers,
    ROUND(subscribed_customers * 100.0 / total_customers, 2) AS subscription_rate_pct
FROM overall_kpi;

-- 3] Which age group has the highest subscription rate?

WITH age_perf AS (
    SELECT
        age_group,
        COUNT(*) AS customers,
        SUM(subscribed) AS subscribed_customers,
        ROUND(SUM(subscribed) * 100.0 / COUNT(*), 2) AS subscription_rate
    FROM bank_analytics
    GROUP BY age_group
)
SELECT
    age_group,
    customers,
    subscribed_customers,
    subscription_rate,
    RANK() OVER (ORDER BY subscription_rate DESC) AS performance_rank
FROM age_perf;


-- 4] subscription rate by job--
WITH job_perf AS (
    SELECT
        job,
        COUNT(*) AS customers,
        ROUND(SUM(subscribed) * 100.0 / COUNT(*), 2) AS subscription_rate
    FROM bank_analytics
    GROUP BY job
    HAVING COUNT(*) > 100
)
SELECT
    job,
    customers,
    subscription_rate,
    ROUND(subscription_rate - AVG(subscription_rate) OVER (), 2) AS diff_from_avg,
    RANK() OVER (ORDER BY subscription_rate DESC) AS rank_job
FROM job_perf;

-- 5] subscription rate by balance group	
WITH balance_perf AS (
    SELECT
        balance_group,
        COUNT(*) AS customers,
        ROUND(SUM(subscribed) * 100.0 / COUNT(*), 2) AS subscription_rate
    FROM bank_analytics
    GROUP BY balance_group
)
SELECT
    balance_group,
    customers,
    subscription_rate,
    RANK() OVER (ORDER BY subscription_rate DESC) AS rank_balance_group
FROM balance_perf;

---- 6] Effect of Campaign Frequency
WITH campaign_perf AS (
    SELECT
        campaign,
        COUNT(*) AS customers,
        ROUND(SUM(subscribed) * 100.0 / COUNT(*), 2) AS subscription_rate
    FROM bank_analytics
    GROUP BY campaign
)
SELECT
    campaign,
    customers,
    subscription_rate,
    ROUND(subscription_rate - AVG(subscription_rate) OVER (), 2) AS diff_from_avg
FROM campaign_perf
ORDER BY campaign;

-- 7] contact method 
WITH contact_perf AS (
    SELECT
        contact,
        COUNT(*) AS customers,
        ROUND(SUM(subscribed) * 100.0 / COUNT(*), 2) AS subscription_rate
    FROM bank_analytics
    GROUP BY contact
)
SELECT
    contact,
    customers,
    subscription_rate,
    RANK() OVER (ORDER BY subscription_rate DESC) AS rank_contact_method
FROM contact_perf;

--8] executive insight - best target segment
WITH segment_perf AS (
    SELECT
        age_group,
        balance_group,
        job,
        COUNT(*) AS customers,
        ROUND(SUM(subscribed) * 100.0 / COUNT(*), 2) AS subscription_rate
    FROM bank_analytics
    GROUP BY age_group, balance_group, job
    HAVING COUNT(*) > 100
)
SELECT
    age_group,
    balance_group,
    job,
    customers,
    subscription_rate,
    RANK() OVER (ORDER BY subscription_rate DESC) AS segment_rank
FROM segment_perf
WHERE customers > 200;

