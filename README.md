# jsfour-blindfold
Ger spelarna möjligheten att sätta på en ögonbindel på andra spelare.

### LICENSE
Du får mer än gärna ändra vad du vill i scriptet men du får INTE sälja vidare scriptet eller ladda upp det på nytt, hänvisa folket hit istället.

### INFO
För att scriptet ska fungera så behöver du använda dig av ESX.

Det här är inget item du använder, du måste lägga in det i en meny. Varför? För det hade blivit oehört svårt att ta bort en ögonbindel om du inte har något item..

- Du behöver även lägga till blindfold som ett item i din databas
- Sen måste du lägga till mitt exempel i din meny

### Screenshot
![screenshot](https://i.gyazo.com/thumb/1200/ea01b13e36b33c3e38a9adceb9e88708-png.jpg)
![screenshot](https://i.gyazo.com/thumb/1200/622e916016a518ab3e1825fc1098b70e-png.jpg)

### Exempel på vad du lägger till i en meny
```
if data.current.value == 'blindfold' then
	local player, distance = ESX.Game.GetClosestPlayer()

	if distance ~= -1 and distance <= 3.0 then
	   ESX.TriggerServerCallback('jsfour-blindfold:itemCheck', function( hasItem )
	      TriggerServerEvent('jsfour-blindfold', GetPlayerServerId(player), hasItem)
	   end)
	else
	   ESX.ShowNotification('Ingen i närheten')
	end
end
```
