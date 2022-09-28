load COVIDbyCounty.mat

 %index = find(table2array(dates(:,'date'))>="2020-04-02");
 %dates = dates(index,:);
 %COVID_STLcity = table2array(CNTY_CENSUS(:,'fips'))== 29510;
 %COVID_STLcity  = CNTY_CENSUS(COVID_STLcity,:);
 %COVID_STLcnty = table2array(CNTY_CENSUS(:,'fips'))== 29189;
 %COVID_STLcnty = CNTY_CENSUS(COVID_STLcnty,:);
 %COVID_STLmetro = table2array(CNTY_CENSUS(:,'fips'))== 29183 & 29099 & 29071 & 29219 & 29113 & 17133 & 17119 & 17163 & 17083 & 17013 & 17117 & 17005 & 17027;
 %COVID_STLmetro = CNTY_CENSUS(COVID_STLmetro,:);

 index = find(table2array(CNTY_CENSUS(:,'DIVISION')));
 COVID_data = CNTY_CENSUS(index,:);
display(COVID_data);
