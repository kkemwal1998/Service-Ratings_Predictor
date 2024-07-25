----Table Creation Statement:-
CREATE TABLE cleaned_yelp
(
    business_id character varying(50),
    dates date,
    review_id character varying(50),
    stars integer,
    text character varying(8000),
    type_text character varying(100),
    user_id character varying(100),
    cool_text_length integer,
    usefull_text_length integer,
    funny_text_length integer
);



----------------------Key Insights:
------1)Extracting user ids with at least 5 reviews within the database:-
With User_id_Table as
(select user_id, text,type_text
from cleaned_yelp
where 
type_text='review' 
and 
user_id != '#NAME?'
)
select user_id as User_ID,count(text) as Review_Count
from 
User_id_Table
group by user_id
having count(text)>=5
order by Review_Count DESC;
------Conclusion: User id 'fczQCSmaWF78toLEmb0Zsw' has the maximum review count. 

--2)Business id with 5 star ratings who have received 'cool' word maximum times in their text columns under text type as reviews.
With Business_ID_Table as
(select business_id,stars,sum(cool_text_length) as Cool_Text_Length
from
cleaned_yelp
where 
business_id != '#NAME?'
and
stars = 5
group by business_id,stars
order by Cool_Text_Length DESC
limit 1)
select business_id
from 
Business_ID_Table
;
------Conclusion: Business id 'gqLWBFxOKag8dXwVxEvTrg' has got the maximum frequency of term 'cool' in it's review. 


--3)Business year with 5 star ratings across the databases.
With Stars_Table as
(select DATE_PART('year',dates) as Business_Year,
count(stars) as Stars_COUNT
from 
cleaned_yelp
where stars = 5
group by DATE_PART('year',dates)
order by Stars_COUNT DESC
limit 1
)
select Business_Year
from 
Stars_Table;
------Conclusion: Business Year '2012' has got the maximum freqyuency of 5 star ratings by the customers.  
