## Variable type

* Nil : None
* Boolean : true or false
* Number : int or float
* string : characters

declare-> just use '=' to declare variable name  and the value should stored

* variable name can't start with number but can contain them

* variable names can't contain symbol but '_'

* variables are case sensitive

use '--' to make a comment

* table : like python dictionary. you can use table to store various type of variables.
  sample:
  
  > table = {} -- declare a table
  > table.num = 10 -- number in table
  > table.table2 = {} -- table in table
  > table2 = {num = 10, table3 = {}}

---
## if operators
==:equal
~=:not equal
< :less
\> :greater
<=:less or equal
\>=:greater or equal

> if condition then
> 	--trigger
> end

> if condition and condition2 then
> 	--trigger
> elseif confition3 then
>     --trigger
> else
> 	--trigger
> end

---

## function

> function function_name()
>	-- trigger and detect
>end

love2D 3 main function

>function love.load()
>	-- will trigger when you start the game
>	-- where you load all the data and assets
>end

>function love.update(dt)
>	-- program the actual game logic
>	-- anything you need to update will in the end be handled in here
>	-- will trigger 1 time per frame produced by computer. Depend on your computer.
>	-- might be run mutiple times of others.
>	-- so we need 'dt' as delta time to make adjust as index.
>end

>function love.draw()
>	-- display graphics on the screen
>end

## Attempt to index local 'self' (a nil value)

> self.fucntion(self, dt) => self:function(dt)

## Windows Distribution

1. Make sure to select all scripts and assets and create a "Zip" file
2. Rename ".zip" to ".love"
3. Using cmd with this command    `copy /b love.exe+SuperGame.love SuperGame.exe`
