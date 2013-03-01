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

local length = function(value)
   local unit = { name='metre', symbol='m' }
   local value = { value=value, quantity='length', unit=unit }
   return value
end


M.length = length

return M

