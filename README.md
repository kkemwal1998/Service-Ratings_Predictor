Project Name: Service Ratings Predictor

Dataset information:The dataset consists of the information about the reviews and feedback that have been provided by the customers on the services offered by business organisations across USA and Canada.

Data source: https://www.kaggle.com/datasets/yelp-dataset/yelp-dataset/data

Project Objective: The project focuses on empowering the small business in analysing the star ratings with the help of predective model that uses a  machine learning algorithm named 'Natural Langauge Processing' on a scale from 1 to 5 based on the feedback reviews provided by their clients and customers. 

Project Format: The project follows E.T.L framework to manipulate Yelp database. 


[Kaggle]Extract------------------------>[Python]Transformation---------------->[PostgreSql]Loading
                                      


Algorithms Applied: NLP (Natural Langauge Processing)

Model Process:-

1) Importing the libraries: The data model consists of importing pandas, numpy, sklearn, matplot and seaborn.
   
2) Extracting the dataset: Extraction Yelp Dataset

3) NLP Classification: Filtering the ratings columns into  binary format that is 1 or 5. Then Assinging the target and input variables.

   Input Variable:- 'text'

   Target Variable:- 'stars'

5) Tokenization: This procedure focuses on converting the sentences in text column into the number of unique words.
   
6) Text processing: Conversion of text document into sparse matrix.

7) Splitting of dataset into traning and testing set: Assinging 70% of the dataset to the traning procedire and 30% to the testing set.

8) Application of Naive Bais Clasiffier: Applying Naive Bais Clasiffier to the dataset.

9) Developing a data pipeline: Creation of data pipeline to automate the prediction process of customer ratings.

10)  Model Evaluatation: The model demonstrates 81% accuracy in the predictions process.  

11) Exploratory Data Analysis (EDA):

      a) Application of Facetgrid to visualise 5 histograms of text length based on star rating

      b ) Visualising the frequency for type of star ratings provided by the customers.

      c) Creating data visualisatin of model Predictions.

12) Key Insights:-

       a)Extracting user ids with at least 5 reviews within the database:-

         With User_id_Table as
            (select user_id, text,type_text

             from cleaned_yelp

             where 
  
             type_text='review' 

             and 

              user_id != '#NAME?')

         select user_id as User_ID,count(text) as Review_Count
 
         from 

         User_id_Table

         group by user_id

         having count(text)>=5

         order by Review_Count DESC;

         Conclusion: User id 'fczQCSmaWF78toLEmb0Zsw' has the maximum review count. 

    b)Business id with 5 star ratings who have received 'cool' word maximum times in their text columns under text type as reviews.

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

      Business_ID_Table;
 
      Conclusion: Business id 'gqLWBFxOKag8dXwVxEvTrg' has got the maximum frequency of term 'cool' in it's review. 


 c)Business year with 5 star ratings across the databases.
 
     With Stars_Table as

    (select DATE_PART('year',dates) as Business_Year,

     count(stars) as Stars_COUNT

     from 

     cleaned_yelp

     where stars = 5

     group by DATE_PART('year',dates)

     order by Stars_COUNT DESC
 
     limit 1)

    select Business_Year

    from 

    Stars_Table;
    
    Conclusion: Business Year '2012' has got the maximum freqyuency of 5 star ratings by the customers.  

