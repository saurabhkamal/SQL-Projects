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










