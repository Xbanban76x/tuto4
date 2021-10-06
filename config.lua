ESX = nil 

---------- Blips ---------------

ConfigShops = {
    Blips = {
        {title="Supérette", colour=2, id=59, x = -47.7705, y = -1757.2098, z = 29.42},
        {title="Supérette", colour=2, id=59, x = 373.875,   y = 325.896,  z = 103.566},
        {title="Supérette", colour=2, id=59, x = 2557.458,  y = 382.282,  z = 108.622},
        {title="Supérette", colour=2, id=59, x = -3038.939, y = 585.954,  z = 7.908},
        {title="Supérette", colour=2, id=59, x = -3241.927, y = 1001.462, z = 12.830},
        {title="Supérette", colour=2, id=59, x = 547.431,   y = 2671.710, z = 42.156},
        {title="Supérette", colour=2, id=59, x = 1961.464,  y = 3740.672, z = 32.343},
        {title="Supérette", colour=2, id=59, x = 2678.916,  y = 3280.671, z = 55.241},
        {title="Supérette", colour=2, id=59, x = 1729.216,  y = 6414.131, z = 35.037},
        {title="Supérette", colour=2, id=59, x = 1135.808,  y = -982.281,  z = 46.415},
        {title="Supérette", colour=2, id=59, x = -1222.915, y = -906.983,  z = 12.326},
        {title="Supérette", colour=2, id=59, x = -1487.553, y = -379.107,  z = 40.163},
        {title="Supérette", colour=2, id=59, x = -2968.243, y = 390.910,   z = 15.043},
        {title="Supérette", colour=2, id=59, x = 1166.024,  y = 2708.930,  z = 38.157},
        {title="Supérette", colour=2, id=59, x = 1392.562,  y = 3604.684,  z = 34.980},
        {title="Supérette", colour=2, id=59, x = 1163.373,  y = -323.801,  z = 69.205},
        {title="Supérette", colour=2, id=59, x = -707.501,  y = -914.260,  z = 19.215},
        {title="Supérette", colour=2, id=59, x = -1820.523, y = 792.518,   z = 138.118},
        {title="Supérette", colour=2, id=59, x = 25.75, y = -1347.36,  z = 29.5},
        {title="Supérette", colour=2, id=59, x = 1698.388,  y = 4924.404,  z = 42.063}  
    },
    PedShops = {
        {x = -46.5, y = -1757.8, z = 28.4, a = 60.0},
    },
    MenuShops = {
        vector3(25.65179, -1348.144, 28.49702),
        vector3(2678.0, 3280.8, 54.24),
        vector3(-1222.9, -907.3, 11.3),
        vector3(373.7816, 326.2924, 102.5664),
        vector3(2557.25, 382.1388, 107.623),
        vector3(-92.75452, 6409.736, 30.64036),
        vector3(1135.652, -982.3264, 45.4158),
        vector3(161.3313, 6640.763, 30.71063),
        vector3(-707.4, -914.2, 18.2),
        vector3(1698.33, 4924.29, 41.06),
        vector3(-48.24798, -1757.722, 28.42102),
    },
}

Citizen.CreateThread(function()
    for _, info in pairs(ConfigShops.Blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
 end)



