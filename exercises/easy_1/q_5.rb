=begin
- input string
- output string

- example

ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm

input = "Nqn Ybirynpr"
 ['N', 'q', 'n', 'Y', 'b', 'i', 'r', 'y', 'n', 'p', 'r']
 ['A', 'd', ]
  ['A'-'Z']
  find the index of 'N' add 13 = 26
  if greater than 26 
  then check the modulo 26 % (13+13) is 0
  return the char at index 0 in the array of uppercase letters

data structure-
input string
output string
subprocess - array of characters

algo:-
  - creatre an arr array
  -initialize str to the string input
  - create uppercase array of characters
  - create lowercase array of characters
  -split str into characetrs
  - store the characters in char_arr
  - iterate over the char_arr
    - if current char is in uppercase array
      find the index of the current character
      increment the index by 13
      if result is greater than 26 then find the moduolo
        add the char at the index value of the return value of modulo in arr array
      else 
        add the char at the index value of result to arr
    - do same for lowercase array
    - if character not included in the uppercase or lowercase
      add the charater in the array arr
  - convert the array to string and output the string
=end

def decipher(str)
  uppercase_arr = ('A'..'Z').to_a
  lowercase_arr = ('a'..'z').to_a

  arr = str.chars

   result = arr.map do |char|
    if uppercase_arr.include?(char)
      idx1 = uppercase_arr.index(char) + 13
      if idx1 >= 26
        new_idx1 = idx1 % 26
        uppercase_arr[new_idx1]
      else
       uppercase_arr[idx1]
      end
    elsif lowercase_arr.include?(char)
      idx2 = lowercase_arr.index(char) + 13
      if idx2 >= 26
        new_idx2 = idx2 % 26
        lowercase_arr[new_idx2]
      else
        lowercase_arr[idx2]
      end
    else
      char
    end
  end
  result.join
end






NAMES = ["Nqn Ybirynpr",
"Tenpr Ubccre",
"Nqryr Tbyqfgvar",
"Nyna Ghevat",
"Puneyrf Onoontr",
"Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
"Wbua Ngnanfbss",
"Ybvf Unvog",
"Pynhqr Funaaba",
"Fgrir Wbof",
"Ovyy Tngrf",
"Gvz Orearef-Yrr",
"Fgrir Jbmavnx",
"Xbaenq Mhfr",
"Fve Nagbal Ubner",
"Zneiva Zvafxl",
"Lhxvuveb Zngfhzbgb",
"Unllvz Fybavzfxv",
"Tregehqr Oynapu"].freeze

NAMES.each do |name|
  p decipher(name)
end