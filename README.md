# jsfour-blindfold
CURRENTLY UPDATING THIS SCRIPT

This script lets you use a blindfold on the nearest player.

### LICENSE
Please don't sell or reupload this resource

### INSTALLATION
* You need to have ESX installed
* Run the SQL-file
* Add the event to a menu or a button, example below

### Screenshot
![screenshot](https://i.gyazo.com/thumb/1200/ea01b13e36b33c3e38a9adceb9e88708-png.jpg)
<img src="https://i.gyazo.com/thumb/1000/4e8a73111c477402cd36c9961710afa6-png.jpg" width="50%">

### Example
```
if data.current.value == 'blindfold' then
	local player, distance = ESX.Game.GetClosestPlayer()

	if distance ~= -1 and distance <= 3.0 then
	   TriggerServerEvent('jsfour-blindfold', player)
	else
	   ESX.ShowNotification('No player nearby')
	end
end
```
