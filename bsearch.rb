#!/usr/bin/env ruby
require 'benchmark'

# находит 2 пропущенные элементы за O(log(N))
# функция в функциональном стиле без side effect-ов  
def bsearch m
   sz = m.size; mid = sz/2
   case m[1]-m[0]
      when 2 then return m[0]+1 
      when 3 then return [m[0]+1, m[0]+2]
      else return
   end if sz == 2
   
   s = m[0] + mid
   case m[mid]
      when s   then bsearch m[mid..-1]
      when s+2 then bsearch m[0..mid]
      when s+1
         a = bsearch m[0..mid]  unless m[mid]-m[0] == mid
         b = bsearch m[mid..-1] unless m[-1]-m[mid] == sz-mid-1
         a ? (b ? [a, b] : a) : b
   end
end

a = (1..30_000_000).to_a 
a = a - [3_000_000, 4]

p Benchmark.measure{ p bsearch a }
















