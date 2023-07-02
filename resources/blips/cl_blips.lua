local blips = {
	-- Organized Crime HQ
	{color=5, id=675, x=-1187.0, y=-1401.0}, -- Corretto Cafe
	{color=5, id=675, x=418.0, y=-1501.0}, -- Salieri's Bar
	{color=5, id=675, x=-1116.0, y=-1454.0}, -- Prego Cafe
	{color=5, id=675, x=5010.0, y=-5753.0}, -- Cayo Perico Compound
	{color=5, id=675, x=-595.0, y=-345.0}, -- Corretto Company Office
	-- Miscellaneus
	{color=0, id=473, x=1210.0, y=-3318.0}, -- Corretto Warehouse
	{color=0, id=617, x=918.0, y=51.0}, -- CASINO
	{color=0, id=410, x=-808.0, y=-1366.0}, -- YACHT CLUB
	{color=0, id=419, x=-541.0, y=-210.0}, -- DOJ
	{color=0, id=472, x=1396.0, y=3639.0}, -- Sandy Hideout
	{color=0, id=52, x=-555.0, y=-600.0}, -- Little Seoul Mall
	{color=0, id=475, x=404.0, y=-6.0}, -- Mafia Hotel
	{color=0, id=90, x=1721.0, y=3255.0}, -- AIRPORT
	{color=0, id=90, x=2149.0, y=4817.0}, -- AIRPORT
	{color=0, id=90, x=-1045.0, y=-2751.0}, -- AIRPORT
	-- SMALL HOUSES
	{color=5, id=40, x=1225.0, y=-669.0}, -- HOUSE SMALL
	{color=5, id=40, x=1246.0, y=-496.0}, -- HOUSE SMALL
	{color=5, id=40, x=1102.0, y=-443.0}, -- HOUSE SMALL
	{color=5, id=40, x=978.0, y=-721.0}, -- HOUSE SMALL
	{color=5, id=40, x=938.0, y=-654.0}, -- HOUSE SMALL
	{color=5, id=40, x=946.0, y=-523.0}, -- HOUSE SMALL
	{color=5, id=40, x=899.0, y=-616.0}, -- HOUSE SMALL
	{color=5, id=40, x=983.0, y=-626.0}, -- HOUSE SMALL
	{color=5, id=40, x=1338.0, y=-599.0}, -- HOUSE SMALL
	{color=5, id=40, x=1377.0, y=-553.0}, -- HOUSE SMALL
	{color=5, id=40, x=1331.0, y=-535.0}, -- HOUSE SMALL
	-- MEDIUM HOUSES
	{color=5, id=492, x=1304.0, y=-523.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=1349.0, y=-544.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=1391.0, y=-568.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=1388.0, y=-595.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=1367.0, y=-609.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=1321.0, y=-586.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=1299.0, y=-578.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=905.0, y=-487.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=918.0, y=-567.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=953.0, y=-673.0}, -- HOUSE MEDIUM
	{color=5, id=492, x=1103.0, y=-411.0}, -- HOUSE MEDIUM
	-- LARGE HOUSES
	{color=5, id=674, x=-1808.0, y=434.0}, -- HOUSE LARGE
	{color=5, id=674, x=-1473.0, y=-44.0}, -- HOUSE LARGE
	{color=5, id=674, x=-819.0, y=258.0}, -- HOUSE LARGE
	{color=5, id=674, x=-89.0, y=986.0}, -- HOUSE LARGE
	{color=5, id=674, x=-1531.0, y=110.0}, -- HOUSE LARGE
	{color=5, id=674, x=1399.0, y=1142.0}, -- HOUSE LARGE
	{color=5, id=674, x=-1887.0, y=2053.0}, -- HOUSE LARGE
	{color=5, id=674, x=-851.0, y=-32.0}, -- HOUSE LARGE
	{color=5, id=674, x=-2597.0, y=1893.0}, -- HOUSE LARGE
	{color=5, id=674, x=-1580.0, y=15.0}, -- HOUSE LARGE
	{color=5, id=674, x=-73.0, y=815.0}, -- HOUSE LARGE
	{color=5, id=674, x=-652.0, y=948.0}, -- HOUSE LARGE
	{color=5, id=674, x=-3222.0, y=794.0}, -- HOUSE LARGE
	{color=5, id=674, x=-1984.0, y=-503.0}, -- HOUSE LARGE
	{color=5, id=674, x=-284.0, y=-730.0}, -- HOUSE LARGE
	{color=5, id=674, x=-2617.0, y=1695.0}, -- HOUSE LARGE

	-- GABZ
	{color=0, id=740, x=-1648.0, y=-1084.0}, -- ARCADE
	{color=0, id=102, x=760.0, y=-777.0}, -- BOWLING
	{color=8, id=489, x=-580.0, y=-1079.0}, -- CAT CAFE
	{color=0, id=93, x=1576.0, y=6451.0}, -- DINER
	{color=6, id=60, x=1197.0, y=-1454.0}, -- FIRE
	{color=6, id=60, x=217.0, y=-1636.0}, -- FIRE
	{color=0, id=72, x=793.0, y=-817.0}, -- OTTOS
	{color=0, id=72, x=716.0, y=-1088.0}, -- LSC
	{color=0, id=72, x=-1434.0, y=-441.0}, -- HAYES
	{color=0, id=72, x=1178.0, y=2653.0}, -- HARMONY
	{color=0, id=52, x=-1115.0, y=-1439.0}, -- HATERS
	{color=0, id=446, x=-50.0, y=-1041.0}, -- HUB
	{color=0, id=524, x=946.0, y=-990.0}, -- IMPORT
	{color=2, id=61, x=286.0, y=-570.0}, -- PILLBOX
	{color=0, id=475, x=322.0, y=-218.0}, -- PINK CAGE
	{color=0, id=253, x=1855.0, y=2586.0}, -- PRISON
	{color=0, id=93, x=789.0, y=-758.0}, -- PIZZERIA
	{color=0, id=136, x=-832.0, y=-698.0}, -- TRIAD RECORDS
	{color=0, id=446, x=166.0, y=-3014.0}, -- TUNER
	{color=34, id=279, x=135.0, y=-1308.0}, -- VU
	{color=29, id=60, x=825.0, y=-1291.0}, -- POLICE
	{color=29, id=60, x=-432.0, y=6019.0}, -- POLICE
	{color=29, id=60, x=427.0, y=-979.0}, -- POLICE
	{color=29, id=60, x=383.0, y=-1590.0}, -- POLICE
	{color=29, id=60, x=1871.0, y=3664.0}, -- POLICE
	{color=29, id=60, x=1646.0, y=4884.0}, -- POLICE
	{color=25, id=60, x=388.0, y=787.0}, -- RANGER
	{color=0, id=819, x=478.0, y=-108.0}, -- ROCKFORD RECORD
	{color=0, id=777, x=952.0, y=-1700.0}, -- car meet
	{color=0, id=93, x=116.0, y=-1022.0}, -- BEAN MACHINE
	{color=10, id=73, x=-165.0, y=-304.0}, -- PONSONBY
	{color=10, id=73, x=-1448.0, y=-236.0}, -- PONSONBY
	{color=10, id=73, x=-709.0, y=-150.0}, -- PONSONBY
	{color=25, id=73, x=124.0, y=-217.0}, -- SUBURBAN
	{color=25, id=73, x=617.0, y=2757.0}, -- SUBURBAN
	{color=25, id=73, x=-1195.0, y=-773.0}, -- SUBURBAN
	{color=25, id=73, x=-3170.0, y=1049.0}, -- SUBURBAN
	{color=0, id=52, x=27.0, y=-1343.0}, -- STORE
	{color=0, id=52, x=376.0, y=329.0}, -- STORE
	{color=0, id=52, x=-3245.0, y=1003.0}, -- STORE
	{color=0, id=52, x=-3043.0, y=586.0}, -- STORE
	{color=0, id=52, x=2676.0, y=3283.0}, -- STORE
	{color=0, id=52, x=1960.0, y=3744.0}, -- STORE
	{color=0, id=52, x=1731.0, y=6417.0}, -- STORE
	{color=0, id=52, x=-58.0, y=-1757.0}, -- STORE
	{color=0, id=52, x=2553.0, y=383.0}, -- STORE
	{color=0, id=52, x=158.0, y=6632.0}, -- STORE
	{color=0, id=52, x=-154.0, y=6329.0}, -- STORE
	{color=17, id=73, x=75.0, y=-1393.0}, -- BINCO
	{color=17, id=73, x=-823.0, y=-1074.0}, -- BINCO
	{color=17, id=73, x=425.0, y=-805.0}, -- BINCO
	{color=17, id=73, x=1195.0, y=2709.0}, -- BINCO
	{color=17, id=73, x=1693.0, y=4823.0}, -- BINCO
	{color=17, id=73, x=5.0, y=6513.0}, -- BINCO
	{color=17, id=73, x=-1101.0, y=2709.0}, -- BINCO
	{color=0, id=313, x=10.0, y=-1105.0}, -- AMMUNATION
	{color=0, id=313, x=821.0, y=-2154.0}, -- AMMUNATION
	{color=0, id=110, x=-3167.0, y=1084.0}, -- AMMUNATION
	{color=0, id=110, x=-663.0, y=-940.0}, -- AMMUNATION
	{color=0, id=110, x=843.0, y=-1028.0}, -- AMMUNATION
	{color=0, id=110, x=2568.0, y=299.0}, -- AMMUNATION
	{color=0, id=110, x=-1310.0, y=-392.0}, -- AMMUNATION
	{color=0, id=110, x=1696.0, y=3755.0}, -- AMMUNATION
	{color=0, id=110, x=-327.0, y=6079.0}, -- AMMUNATION
	{color=0, id=110, x=247.0, y=-47.0}, -- AMMUNATION
	{color=0, id=110, x=-1114.0, y=2693.0}, -- AMMUNATION
	{color=2, id=431, x=-109.0, y=6464.0}, -- BANK
	{color=2, id=431, x=223.0, y=208.0}, -- BANK
	{color=2, id=431, x=-1306.0, y=-826.0}, -- BANK
	{color=0, id=75, x=1320.0, y=-1648.0}, -- TATTOO
	{color=0, id=75, x=-1157.0, y=-1418.0}, -- TATTOO
	{color=0, id=75, x=319.0, y=175.0}, -- TATTOO
	{color=0, id=75, x=-3165.0, y=1073.0}, -- TATTOO
	{color=0, id=75, x=1856.0, y=3747.0}, -- TATTOO
	{color=0, id=75, x=-287.0, y=6201.0}, -- TATTOO
	{color=0, id=71, x=130.0, y=-1714.0}, -- BARBER
	{color=0, id=71, x=-1291.0, y=-1116.0}, -- BARBER
	{color=0, id=71, x=1935.0, y=3721.0}, -- BARBER
	{color=0, id=71, x=1202.0, y=-469.0}, -- BARBER
	{color=0, id=71, x=-29.0, y=-144.0}, -- BARBER
	{color=0, id=71, x=-284.0, y=6235.0}, -- BARBER
	{color=0, id=605, x=919.0, y=-2122.0}, -- BOBCAT
	{color=0, id=52, x=-1245.0, y=-1470.0}, -- VBM
	{color=0, id=269, x=-1113.0, y=4936.0}, -- ALTRUISTS
	{color=0, id=429, x=495.0, y=-1542.0}, -- AZTECAS
	{color=0, id=429, x=-3.0, y=-1819.0}, -- BALLAS
	{color=0, id=429, x=-157.0, y=-1616.0}, -- FAMILIES
	{color=0, id=429, x=957.0, y=-143.0}, -- LOST MC
	{color=0, id=429, x=98.0, y=3607.0}, -- LOST MC
	{color=0, id=429, x=1254.0, y=-1573.0}, -- MARABUNTA
	{color=0, id=429, x=-645.0, y=-1237.0}, -- TRIADS
	{color=0, id=429, x=331.0, y=-1990.0}, -- VAGOS
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, 0)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.color)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        EndTextCommandSetBlipName(info.blip)
    end
end)

-- Remove "N" blip
CreateThread(function()
    SetBlipAlpha(GetNorthRadarBlip(), 0)
end)
