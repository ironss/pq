#! /usr/bin/lua

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
   ['m'] =  { name='metre'   , symbol='m' , quantity='length' },
   ['kg'] = { name='kilogram', symbol='kg', quantity='mass'   },
}

local quantities = 
{
   ['length'] = { name='length', preferred_unit='m' , symbol='L' },
   ['mass'  ] = { name='mass'  , preferred_unit='kg', symbol='M' },
}



local new = function(value, symbol)
   local unit = units[symbol]
   if unit == nil then
      error('Unknown unit ' .. symbol)
   end

   local quantity = quantities[unit.quantity]
   local value = { value=value, quantity=unit.quantity, unit=unit }

   return value
end


for n, q in pairs(quantities) do
   local f = function(value, symbol)
      local unit_symbol = symbol or q.preferred_unit
      local unit = units[unit_symbol]
      if unit == nil then
         error('Unknown unit ' .. symbol)
      end
      
      local value = { value=value, quantity=q.name, unit=unit }
      if unit.quantity ~= value.quantity then
         error(symbol .. ' is not a valid unit for ' .. q.name)
      end
      return value
   end
   M[q.name] = f
end

M.new = new

return M

