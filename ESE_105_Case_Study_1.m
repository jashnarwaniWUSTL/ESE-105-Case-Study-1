load COVIDbyCounty.mat

 index = find(table2array(COVID_allUS(:,'date'))>="2020-03-18");
 COVID_data = COVID_allUS(index,:);
 COVID_STLcity = table2array(COVID_data(:,'fips'))== 29510;
 COVID_STLcity  = COVID_data(COVID_STLcity,:);
 COVID_STLcnty = table2array(COVID_data(:,'fips'))== 29189;
 COVID_STLcnty = COVID_data(COVID_STLcnty,:);
 COVID_STLmetro = table2array(COVID_data(:,'fips'))== 29183 & 29099 & 29071 & 29219 & 29113 & 17133 & 17119 & 17163 & 17083 & 17013 & 17117 & 17005 & 17027;
 COVID_STLmetro = COVID_data(COVID_STLmetro,:);