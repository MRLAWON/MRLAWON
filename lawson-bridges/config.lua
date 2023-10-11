-------------------------------------------------------------------------
-----------------------------   Config    -------------------------------
-------------------------------------------------------------------------

Config = {}

Config.Defaultlang = "en"

Config.WebhookLink = "" --Insert your webhook link to enable webhooking

Config.Key = 0x760A9C6F -- [G]

Config.BacchusBridgeDestroying = {
    enabled = true, --if true you will be able to blow up bacchus bridge!
    coords = {x = 486.7544, y = 1775.006, z = 182.4538}, --coords of where you have to  place the dynamite
    dynamiteItem = "weapon_thrown_dynamite", --db name of the dynamite item
    dynamiteItemAmount = 2, --amount needed to explode the bridge
    explosionTimer = 50000 --time before the explosion happens
}

-------------------------------------------------------------------------
-------------------------------   End    --------------------------------
-------------------------------------------------------------------------