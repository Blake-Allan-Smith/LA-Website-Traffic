# Project Background:

This project analyzes data about the web traffic for the lacity.gov website, which contains over 8 million records of prior visitors. The data comes from 2014 to 2019, and the goal of the project is to provide insights on user behavior, highlight trends, and make data-driven recommendations to help enhance user experience and increase performance of the website. The website is a crucial source of information for many residents of the Los Angeles area. As a result, understanding the traffic patterns of the website can help improve user engagement and communication, especially when events such as wildfires or other severe events occur. 

Terminology:
- Sessions: A session is a visit to the website, and all the interactions that occur during that visit. 

- Bounce Rate: The percentage of users who left the website without getting past the home page and or not interacting with the website.

- Device Categories: The different forms of technology that were used to access the website including desktop, mobile, and tablets.

# Executive Summary:
The analysis is based on the LA website dataset containing over 8 million records, providing insights on sessions, devices and their usage, and bounce rates of users from 2014 to 2019. The information found was visualized in a Tableau dashboard and clearly presented key insights on how users access the sight, what devices were used, and the patterns in engagement over time. The analysis highlighted that desktop is the clear favorite for sessions, mobile devices have a high bounce rate, and website traffic peaks during events like the 2017 California wildfires. Additionally, there has been a steady decline in website traffic from 2017 to 2019

# Summary of Insights:
- Device Category Breakdown
  - Desktop brings in the most sessions with 66% of the total sessions,
  - Mobile ranks center amongst devices but have the highest bounce rate, which is ~6% higher than desktop.
  - Tablet brings is significantly less traffic, but it's bounce rate is the lowest of the devices, which is ~5% lower than mobile.

- Browser Insights
 - Chrome is the dominant favorite for browsers amongst users accessing the website. 
 - There was an extremely large spike in traffic in December 2017, which aligns directly with the large wildfires that were occurring in and around California during that time. This shows that the website was a main source of information for people at that time.
 - The website has seen a steady decline in traffic from 2017 to 2019, indicating a reason to investigate to attempt to find the factors behind this trend.

- Traffic Trends
  - Weekdays see significantly higher traffic compared to weekends.
  - There is a notable traffic spike in December 2017, which correlates with multiple wildfires that occurred in California during that time. The spike suggests the website was used as a key information hub during that crisis.
  - A steady decline in traffic from 2017 to 2019 was observed, indicating a need to investigate factors behind this trend.

# Recommendations:
- Emergency Communication: The large spike in traffic during the wildfires during December 2017 highlight the importance of having an emergency communication strategy prepared. The city needs to be able to ensure that critical information can be delivered quickly and effectively, especially to mobile users in these cases as they account for 46% of traffic during the wildfires. Additionally, mobile users were found to have the highest bounce rate, so optimizing mobile user experiences is crucial to ensure users can easily access urgent information without leaving the site to search for the information elsewhere. 

- Prioritize Actions on Weekdays: Due to the fact that the website receives more traffic on the weekdays, its recommended for marketing campaigns and crucial updates to be focused during the week. While web optimizations should be scheduled for the weekends when website traffic is lower.

- Improve Mobile User Experience: Since mobile users have the highest bounce rate amongst devices. It is crucial to improve on navigation on mobile devices, especially on the home screen to lower the bounce rate. In order to achieve this, conducting UX research and testing the functionality of the website will help to reduce the bounce rate and improve the engagement of users.

- Desktop Improvements/ Focus: Desktop brings in significantly more traffic than any of the other devices resulting in constant sessions. So, it is important to prioritize the performance and compatibility of the website on desktop and the browsers.

- User Survey: To address thew decline in traffic that started in 2017, surveys should be conducted in order to gather information from users on why they are visiting the website less. This will provide cleat insights on areas that can be improved and possibly content that needs to be changed.



# Assumptions and Caveats:
- The analysis assumes that the December 2017 spike was caused by the California wildfires, though other factors may have contributed.
- The dataset covers web traffic only up until 2019, so any changes or trends after this period are not accounted for.
- Bounce rate calculations are based on the sessions data available and may not reflect changes in how users interact with specific types of content or site areas not captured in the dataset.

# Technical Project Information
The original dataset is available here. It contains data for unique visitors, total sessions, and bounce rate for lacity.org, the main website for the City of Los Angeles over the years of 2014-2019. I did some data cleaning and transformation in SQL to create the dataset used in this analysis. You can view the SQL script here. It was then visualized in Tableau.
Check out the LAcity.org Web Traffic - Tableau Dashboard.
