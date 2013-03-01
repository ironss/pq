#! /usr/bin/lua

local pq = require 'pq'


require('luaunit')

Test_base_quantities = {}

function Test_base_quantities:test_can_create_length_with_implied_unit()
   local l1 = pq.length(25)
   assert_equals(l1.value, 25)
   assert_equals(l1.quantity, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
end


function Test_base_quantities:test_can_create_length_with_explicit_unit()
   local l1 = pq.length(21, 'm')
   assert_equals(l1.value, 21)
   assert_equals(l1.quantity, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
end

function Test_base_quantities:test_cannot_create_length_with_incorrect_unit()
   assertError(pq.length, 21, 'kg')
end

function Test_base_quantities:test_can_create_mass_with_implied_unit()
   local l1 = pq.mass(25)
   assert_equals(l1.value, 25)
   assert_equals(l1.quantity, 'mass')
   assert_equals(l1.unit.name, 'kilogram')
   assert_equals(l1.unit.symbol, 'kg')
end


--[[
function Test_base_quantities:test_can_create_quantity_with_explicit_unit()
   local l1 = pq.length(2000, 'mm')
   assert_eq(l1.value, 2)
   assert_eq(l1.quantity, 'length')
   assert_eq(l1.unit.name, 'metre')
   assert_eq(l1.unit.symbol, 'm')
end

function Test_base_quantities:test_can_create_quantity_with_non_si_unit()
   local l1 = pq.length(100, 'in')
   assert_close(l1.value, 2.540)
   assert_eq(l1.quantity, 'length')
   assert_eq(l1.unit.name, 'metre')
   assert_eq(l1.unit.symbol, 'm')
end

function Test_base_quantities:test_can_create_quantity_with_non_si_unit()
   local l1 = pq.length(100, 'in')
   assert_close(l1.value, 2.540)
   assert_eq(l1.quantity, 'length')
   assert_eq(l1.unit.name, 'metre')
   assert_eq(l1.unit.symbol, 'm')
end




pq.format(L1) --
pq.format(L1, 'm')
pq.format(L1, 'mm')
pq.format(L1, 'in')
pq.format(L1, 'ft')
pq.format(L1, 'NM')



--]]

LuaUnit:run()

