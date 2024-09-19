# Restaurant Business Analysis

Understanding the factors that drive business success is essential for stakeholders. This project leverages the Yelp dataset to explore the correlation between user engagement (including reviews, tips, and check-ins) and key success indicators for restaurants, such as review counts and ratings.

**Research Objectives:**

(a). Measure the relationship between user engagement (reviews, tips, check-ins) and business success indicators, including review count and average star rating. This will help us determine if restaurants with higher user engagement experience a corresponding increase in reviews and ratings.

(b). Examine how review sentiment affects both review count and average star rating. This will help us determine if positive sentiment in reviews and tips translates to higher star ratings. 

(c). Investigate time-based trends in user engagement patterns. This will help us determine if consistent user engagement over time is a stronger indicator of long-term success compared to sporadic bursts of activity. 

**Based on the research objectives, there are three hypothesis:**

(a). Increased user engagement, such as higher number of reviews, tips, and check-ins, is linked to greater review counts and higher restaurant ratings. 

(b). Positive sentiment in reviews and tips leads to higher overall ratings and increased review counts of restaurants.

(c). Steady engagement overtime is positively correlated with long-term business success for restaurants.

**Data Overview:**

•	This dataset is a subset of Yelp, containing information on businesses from eight metropolitan areas across the USA and Canada. 

•	The original data is provided by Yelp in JSON format. 

•	The five JSON files include business, review, user, tip, and check-in data. 

•	The JSON files are stored in a database to facilitate easy data retrieval.


**STEPS:-**

#### 1.	Downloading Yelp dataset
https://www.yelp.com/dataset 

#### 2.	Database Creation file
(a). Opened all JSON files one-by-one.
(b). Loaded them with json.loads
(c). And then converted them into data frames 
(d). Created sqlite engine yelp.db to create database
(e). Transferring all the data frames to the yelp.db database by storing them into five different tables.

#### 3.	Analysis and Findings:

(1). Out of 150K businesses, 35K are restaurants business and are operational.
-	Table showing distribution of business success metrics (review count and average rating):

![image](https://github.com/user-attachments/assets/a6ff4c5c-ff71-4918-836a-99703ebe234c)

(2). Comparing Highest Review Count with Highest Rating

![image](https://github.com/user-attachments/assets/971af31e-09fa-43ff-89a5-32de8b96d879)

-	Higher ratings do not guarantee a higher review count, or vice versa.
  
-	Succes of Restaurants is not solely determined by ratings or review counts.
  
-	Review count reflects user engagement but not necessarily overall customer satisfaction or business performance.

(3). Do restaurants with higher engagement tend to have higher ratings?
- Data shows a general increase in average review, check-in, and tip counts as ratings improve from 1 to 4 stars.
  
- Restaurants rated 4 stars exhibit the highest engagement and shows a downward trend for rating above 4.#
  
- The drop in engagement at 5.0 stars might suggest either a saturation point where fewer customers feel compelled to add their reviews, or a selectively where only a small, satisfied audience frequent these establishments.

![image](https://github.com/user-attachments/assets/69a0f1c1-0386-4385-8fd9-f5d214b8f5d7)

(4). Is there a correlation between the number of reviews, tips, and check-ins for a business?

- These correlations suggest that user engagement across different platforms (reviews, tips, and check-ins) is interlinked; higher activity in one area tends to be associated with higher activity in others.

- Business should focus on strategies that boost all types of user engagement, as increases in one type of engagement are likely to drive increases in others, enhancing overall visibility and interaction with customers.

![image](https://github.com/user-attachments/assets/b3376acd-d1ef-4e4c-90f4-1256a218a7b7)

(5). Is there a difference in the user engagement between high-rated and low-rated businesses?

![image](https://github.com/user-attachments/assets/077e632a-5cb2-420f-8d92-645e58687286)

-	Data indicates a clear correlation between higher ratings and increased user engagement across reviews, tips, and check-ins.

-	This pattern underscores the importance of maintaining high service and quality standards, as these appear to drive more reviews, check-ins, and tips, which are critical metrics of customer engagement and satisfaction.

(6). How do the success metrics of restaurants vary across different states and cities?

![image](https://github.com/user-attachments/assets/4d801e1e-f465-45a4-a474-d9c1efe027c4)

-	Philadelphia emerges as the top city with the highest success score, indicating a combination of high ratings and active user engagement.

-	Following Philadelphia, Tampa, Indianapolis, and Tucson rank among the top cities with significant success in scores, suggesting thriving restaurants scenes in these areas.

(7). Are there any patterns in user engagement over time for successful businesses compared to less successful ones?

![image](https://github.com/user-attachments/assets/566141e2-6a50-4703-ac24-4ef1834caa90)

- Tip Engagement: Both high-rated and low-rated tip engagement appear to have increased significantly between 2017 and 2019, with a slight decline in 2020. However, 
both lines show a steady increase from 2021 onwards.

- Review Engagement: Similar to tip engagement, review engagement for both high-rated and low-rated categories shows a significant increase from 2017 to 2019. In 2020, there's a noticeable dip in review engagement, especially for low-rated reviews. From 2021, review engagement starts to recover, with a more pronounced increase in high-rated reviews.

- Average Rating: The average rating shows a slight upward trend from 2017 to 2019. In 2020, there's a noticeable dip in the average rating. From 2021, the average rating starts to recover and reaches its highest point in 2022.

(8). How does the sentiment of reviews and tips (useful, funny, cool) correlate with the success metrics of restaurants?

![image](https://github.com/user-attachments/assets/5f1da253-ebe7-475c-b8e8-658c38e26b4d)

The provided heatmap is a correlation matrix that shows the relationships between different variables related to restaurant data. The variables include:
•	review_count: The number of reviews for a restaurant
•	useful_count: The number of times reviews were marked as useful
•	funny_count: The number of times reviews were marked as funny
•	cool_count: The number of times reviews were marked as cool
•	success_score: A measure of the restaurant's overall success

#### Interpreting the Correlations:
(a).	Strong Positive Correlations:
- useful_count and cool_count: These two variables have a very strong positive correlation of 0.92, suggesting that reviews that are marked as useful are also likely to be marked as cool.
- review_count and success_score: A strong positive correlation of 0.77 exists between these two variables, indicating that restaurants with more reviews tend to have higher success scores.

(b). Moderate Positive Correlations:
- review_count and useful_count: There's a moderate positive correlation of 0.54 between these variables, suggesting that restaurants with more reviews are also more likely to have reviews marked as useful.

- review_count and funny_count: A moderate positive correlation of 0.32 exists between these variables, indicating that restaurants with more reviews may also have more reviews melationships and causal mechanisms.















