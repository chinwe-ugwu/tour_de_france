Select * 
From dbo.tdf_tours_txt;

Select * 
From dbo.tdf_finishers_txt;

Select * 
From dbo.tdf_winners_txt;

Select * 
From dbo.tdf_stages_txt;

Select *
From dbo.tdf_winners_txt
Order By Stages_Won DESC;

/*Determining the number of stages in the tour de france*/
Select Count(Distinct Type) As Stages
From dbo.tdf_stages_txt;
/*
Stages
21
*/

/*Determining the number of years the tour de france has been running for*/
Select Count(Distinct Year) As Years
From dbo.tdf_stages_txt;
/*
Years
109
*/

/*List of the different types of stages*/
Select Distinct Type As Stages
From dbo.tdf_stages_txt;
/*
Stages
Flat
Medium-mountain stage
Half Stage
Individual time trial
Flat cobblestone stage
Medium mountain stage
Team time trial
Mountain Stage (s)
Medium mountain stage[c]
Mountain time trial
High mountain stage
Stage with mountain
Plain stage
Intermediate stage
Plain stage with cobblestones
Stage with mountains
Flat stage
Mountain Stage
Stage with mountain(s)
Hilly stage
Transition stage
*/

/*
Determine the longest and shortest stage distances
*/
Select Max(Distance_km) as max_distance, Min(Distance_km) as min_distance
From dbo.tdf_stages_txt;
/*
max_distance = 482km
min_distance = 7km
*/

Select * 
From dbo.tdf_stages_txt;

Select Distinct Winner, Count(Winner) as no_of_times_won
From dbo.tdf_stages_txt
Group By Winner
Order By no_of_times_won Desc;

/*Find the years with the highest and lowest finish percentages*/
Select Max(Finish), Min(Finish)
From dbo.tdf_tours_txt;

Select *
From dbo.tdf_tours_txt
Where Finish = '88.07%' OR Finish = '14.49%';

/*
Year	Dates					Stages	Distance_km	Starters	Finishers	Finish
1919	29 June - 27 July 1919	15		5560		69			10			14.49%
2019	6-28 July 2019			21		3366		176			155			88.07%
*/

/*Find the year with the longest and shortest distance for the tours*/
Select Max(Distance_km), Min(Distance_km)
From dbo.tdf_tours_txt;

Select * 
From dbo.tdf_tours_txt
Where Distance_km = 5745 OR Distance_km = 2428
/*
Year	Dates					Stages	Distance_km	Starters	Finishers	Finish
1903	1-19 July 1903			6			2428	60			21			35.00%
1904	2-24 July 1904			6			2428	88			15			17.05%
1926	20 June - 18 July 1926	17			5745	126			41			32.54%
*/

/*Get the details of the 1903, 1904, and 1926, 1919 and, 2019 winners(years with the longest and shortest distances travelled, 
as well as years with the highest and lowest percentages of finishers) from the winners table*/
Select * 
From dbo.tdf_winners_txt
Where Year In (1903, 1904, 1926, 1919, 2019);

Select * 
From dbo.tdf_tours_txt;

/*Find the winners wih the least and most winning times*/

Select Min(Time) as Min_Winner,
		Max(Time) as Max_Winner
From dbo.tdf_winners_txt

Select * 
From dbo.tdf_winners_txt
Where Rider in ('Jonas Vingegaard', 'Lucien Buysse');

Select * 
From dbo.tdf_tours_txt
Where Year in (2022);

/*Find the highest average speed amongst the winners*/
Select Max(Avg_speed_km_h)
From dbo.tdf_winners_txt;

Select *
From dbo.tdf_winners_txt
Order By Avg_speed_km_h Desc;

/*
Year	Country	Rider				Team				Time		Margin		Stages_Won	Stages_Led	Avg_speed_km_h		Height_m	Weight_kg	Born		Birth_year	Died	Age_at_win
2022	Denmark	Jonas Vingegaard	Team Jumbo-Visma	79:32:29'	2:43:00'	2			NULL		41.7999992370605	1.75		NULL		1996-12-10	1996		NULL	26
*/

/*
Find Winners by their Jerseys:
1. Top 5 Yellow Jersery winners by time, Number of Jersey, Age
2. Top 5 White Jersey winners by Time
*/

/*This query show the riders who have won both the yellow and white jersey in the same competition*/
Select * 
From dbo.tdf_winners_txt
Where Age_at_win < 26 AND Year > 1974
Order By Age_at_win, Avg_speed_km_h

/*
Find the oldest yellow jersey winner
*/
Select * 

From dbo.tdf_winners_txt
Order By Age_at_win Desc;
/*
Year	Country	Rider			Team			Time		Margin		Stages_Won	Stages_Led	Avg_speed_km_h		Height_m	Weight_kg	Born		Birth_year	Died		Age_at_win
1922	Belgium	Firmin Lambot	Peugeot-Wolber	222:08:06'	41:15:00'	0			3			24.2000007629395	NULL		NULL		1886-03-14	1886		1964-01-19	36
*/

/*Find the top 5 riders with Sprinting wins by time and speeds*/
Select *, Count(Distinct(Winner))
From dbo.tdf_stages_txt
Group By 1;

-- For Plain stage
Select Distinct Winner, Count(Winner) as green_jerseys
From dbo.tdf_stages_txt
Where Type Like 'Plain%' AND Year > 1952
Group By Winner
Order By green_jerseys Desc;

/*
Winner	green_jerseys
Andre Darrigade (FRA)	18
Jan Raas (NED)	9
Robbie McEwen (AUS)	9
Mario Cipollini (ITA)	8
Gerrie Knetemann (NED)	8
*/

-- For Mountain Stages
Select Distinct Winner, Count(Winner) as Mountainous_wins
From dbo.tdf_stages_txt
Where (Type LIKE '%ountain%' OR Type LIKE 'Hilly%') AND Year > 1975
Group By Winner
Order By Mountainous_wins Desc


Select * 
From dbo.tdf_stages_txt
Where Winner LIKE 'Richard Virenque%'

