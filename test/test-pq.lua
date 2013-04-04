#! /usr/bin/lua

local pq = require 'pq'


require('luaunit')

Test_base_quantities = {}

function Test_base_quantities:test_can_create_length_with_implied_unit()
   local l1 = pq.length(25)
   assert_equals(l1.value, 25)
   assert_equals(l1.quantity.name, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
end


function Test_base_quantities:test_can_create_length_with_explicit_unit()
   local l1 = pq.length(21, 'm')
   assert_equals(l1.value, 21)
   assert_equals(l1.quantity.name, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
end

function Test_base_quantities:test_can_create_length_with_non_preferred_unit()
   local l1 = pq.length(10, 'in')
   assert_equals(l1.quantity.name, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
   assert_equals(l1.value, 254)
end

function Test_base_quantities:test_cannot_create_length_with_incorrect_unit()
   assertError(pq.length, 21, 'kg')
end

function Test_base_quantities:test_cannot_create_length_with_unknown_unit()
   assertError(pq.length, 21, 'qqq')
end

function Test_base_quantities:test_can_create_mass_with_implied_unit()
   local l1 = pq.mass(25)
   assert_equals(l1.value, 25)
   assert_equals(l1.quantity.name, 'mass')
   assert_equals(l1.unit.name, 'kilogram')
   assert_equals(l1.unit.symbol, 'kg')
end



function Test_base_quantities:test_can_create_quantity_with_length_unit()
   local l1 = pq.new(22, 'm')
   assert_equals(l1.value, 22)
   assert_equals(l1.quantity.name, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
end

function Test_base_quantities:test_can_create_quantity_with_mass_unit()
   local l1 = pq.new(26, 'kg')
   assert_equals(l1.value, 26)
   assert_equals(l1.quantity.name, 'mass')
   assert_equals(l1.unit.name, 'kilogram')
   assert_equals(l1.unit.symbol, 'kg')
end

function Test_base_quantities:test_can_create_quantity_with_time_unit()
   local l1 = pq.new(10, 's')
   assert_equals(l1.value, 10)
   assert_equals(l1.quantity.name, 'time')
   assert_equals(l1.unit.name, 'second')
   assert_equals(l1.unit.symbol, 's')
end

function Test_base_quantities:test_can_create_quantity_with_non_preferred_length_unit()
   local l1 = pq.new(10, 'in')
   assert_equals(l1.quantity.name, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
   assert_equals(l1.value, 254)
   assert_equals(l1.user_unit.name, 'inch')
   assert_equals(l1.user_unit.symbol, 'in')
end

function Test_base_quantities:test_can_create_quantity_with_other_non_preferred_length_unit()
   local l1 = pq.new(10, '"')
   assert_equals(l1.quantity.name, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
   assert_equals(l1.value, 254)
   assert_equals(l1.user_unit.name, 'inch')
   assert_equals(l1.user_unit.symbol, '"')
end

function Test_base_quantities:test_cannot_create_quantity_with_unknown_unit()
   assertError(pq.new, 10, 'qqq')
end


function Test_base_quantities:test_can_create_length_in_pixels()
   local l1 = pq.length(640, 'px')
   assert_equals(l1.quantity.name, 'length')
   assert_equals(l1.unit.name, 'metre')
   assert_equals(l1.unit.symbol, 'm')
   assert_equals(l1.value, 640)
   assert_equals(l1.user_unit.name, 'pixel')
   assert_equals(l1.user_unit.symbol, 'px')
end


--[[
pq.format(L1) --
pq.format(L1, 'm')
pq.format(L1, 'mm')
pq.format(L1, 'in')
pq.format(L1, 'ft')
pq.format(L1, 'NM')
--]]

LuaUnit:run()

