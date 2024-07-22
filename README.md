Project Name: Service Ratings Predictor

Dataset information:The dataset consists of the information about the reviews and feedback that have been provided by the customers on the services offered by busuness organisations across USA and Canada.

Data source: https://www.kaggle.com/datasets/yelp-dataset/yelp-dataset/data

Project Objective: The project focuses on empowering the small business in analysing the star ratings with the help of predective model that uses a  machine learning algorithm named 'Natural Langauge Processing' on a scale from 1 to 5 based on the feedback reviews provided by their clients and customers. 

Algorithms Applied: NLP (Natural Langauge Processing)

Model Process:-

1) Importing the libraries: The data model consists of importing pandas, numpy, sklearn, matplot and seaborn.
   
2) Extracting the dataset: Extraction Yelp Dataset

3) NLP Classification: Filtering the ratings columns into  binary format that is 1 or 5. Then Assinging the target and input variables.
   Input Variable:- 'text'
   Target Variable:- 'stars'

4) Tokenization: This procedure focuses on converting the sentences in text column into the number of unique words.
   
5) Text processing: Conversion of text document into sparse matrix.

6) Splitting of dataset into traning and testing set: Assinging 70% of the dataset to the traning procedire and 30% to the testing set.

7) Application of Naive Bais Clasiffier: Applying Naive Bais Clasiffier to the dataset.

8) Developing a data pipeline: Creation of data pipeline to automate the prediction process of customer ratings.

9)  Model Evaluatation: The model demonstrates 81% accuracy in the predictions process.  

10) Exploratory Data Analysis (EDA):

      a) Application of Facetgrid to visualise 5 histograms of text length based on star rating

      b ) Visualising the frequency for type of star ratings provided by the customers.

      c) Creating data visualisatin of model Predictions.
