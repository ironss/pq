#! /usr/bin/lua

-- Computation using physical quantities
-- Type-safe computation using physical quantities
-- Can add and subtract identical quantities
-- Can multiply and divide quantities, giving a different quantity
--   eg. length/time --> speed

-- References:
-- * http://en.wikipedia.org/wiki/International_System_of_Units

local M = {}

--[[
local base_quantities = 
{
--   quantity                      symbol
   { 'length'                    , 'L' },
   { 'mass'                      , 'M' },
   { 'time'                      , 'T' },
   { 'electric current'          , 'I' },
   { 'thermnodynamic temperature', 'Θ' },
   { 'amount of substance'       , 'N' },
   { 'luminous intensity'        , 'J' },
}

local base_units = 
{
--   unit name   symbol
   { 'metre'   , 'm'  , 'length'                    },
   { 'kilogram', 'kg' , 'mass'                      },
   { 'second'  , 's'  , 'time'                      },
   { 'ampere'  , 'A'  , 'electric current'          },
   { 'kelvin'  , 'K'  , 'thermodynamic temperature' },
   { 'mole'    , 'mol', 'amount of substance'       },
   { 'candela' , 'cd' , 'luminous intensity'        },
}

local derived_quantities = 
{
   { 'frequency'   , '' },
   { 'angle'       , '' },
   { 'solid angle' , '' },
   { 'force'       , '' },
   { 'pressure'    , '' },
   { 'stress'      , '' },
}

local derived_units = 
{
   { 'hertz'    , 'Hz' , 'frequency'                 , 's-1'        },
   { 'radian'   , 'rad', 'angle'                     , 'm.m-1'      },
   { 'steradian', 'sr' , 'solid angle'               , 'm2.m-2'     },
   { 'newton'   , 'N'  , 'force'                     , 'kg.m.s-2'   }, 
   { 'pascal'   , 'Pa' , 'pressure'                  , 'kg.m-1.s-2' },
   { 'joule'    , 'J'  , 'energy'                    , 'kg.m2.s-2'  },
   { 'watt'     , 'W'  , 'power'                     , 'kg.m2.s-3'  },
}


local non_si_units = 
{
   { 'inch',       'in', scale, 25.4 * 1000 },
   { 'millimetre', 'mm', scale, 1000        },
   
}
--]]

local units = 
{
   ['m']  = { name='metre'   , symbol='m' , quantity='length' },
   ['kg'] = { name='kilogram', symbol='kg', quantity='mass'   },
   ['s']  = { name='second'  , symbol='s',  quantity='time'   },

   ['in']  = { name='inch'  , symbol='in',  quantity='length', linear={25.4, 0} },
   ['"']   = { name='inch'  , symbol='"' ,  quantity='length', linear={25.4, 0} },
}

local quantities = 
{
   ['length'] = { name='length', preferred_unit='m' , symbol='L' },
   ['mass'  ] = { name='mass'  , preferred_unit='kg', symbol='M' },
   ['time'  ] = { name='time'  , preferred_unit='s' , symbol='T' },
}



local new = function(value, symbol)
   local unit = units[symbol]
   if unit == nil then
      error('Unknown unit ' .. symbol)
   end

   -- Convert supplied value to value in preferred unit
   local preferred_value = value
   if unit.linear ~= nil then
      preferred_value = value * unit.linear[1]
   end

   local quantity = quantities[unit.quantity]
   local t = { value=preferred_value, quantity=quantity, user_unit=unit, unit=units[quantity.preferred_unit] } -- quantity.preferred_unit, user_unit=unit }

   return t
end


-- Creators for specific quantities

for n, q in pairs(quantities) do
   local f = function(value, symbol)
      local unit_symbol = symbol or q.preferred_unit
      local pvalue = new(value, unit_symbol)

      if pvalue.quantity.name ~= q.name then
         error(symbol .. ' is not a valid unit for ' .. q.name)
      end
      return pvalue
   end
   M[q.name] = f
end

M.new = new

return M

