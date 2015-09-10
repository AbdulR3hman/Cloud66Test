#!/usr/bin/env ruby

################################################################################################################
## Author; Abdul (not that it was a master piece)

@txt = ARGV[0]
@sub = ARGV[1]



@outer_counter = 0
@inner_counter = 0
@matches_counter = 0
@inner_monitor = false
@char_position = 0

while @outer_counter < @txt.length do

  #Start of a match
  while @txt[@outer_counter].to_s.downcase == @sub[@inner_counter].to_s.downcase && @outer_counter < @txt.length && @inner_counter < @sub.length do

    @char_position = @outer_counter unless @char_position != 0
    @inner_monitor = true unless @inner_counter+1 != @sub.length

    @outer_counter+=1
    @inner_counter+=1
  end

  if @inner_monitor
    @matches_counter+=1
    puts "Match No. #{@matches_counter} start @ position is #{@char_position}"
  end

  #Reset counters and monitors
  @inner_counter = 0
  @char_position = 0
  @inner_monitor = false

  @outer_counter+=1
end


## Notes;
## I have assumed that we are matching text for text and not word for word, meaning;
## If the main text is; "This is amazing" and we are matching "is" then we would match it to thIS and is...
## Secondly, I also assume we are matching the 'FULL' substring to the main text; meaning;
## main text is "This is amazin" and the substring is "amazing" then the substring won't be mapped
##
##
## Also, I have not used any checks, the spec was simple and so I kept everything simple;
##
##  And the following points I would use to improve this;
##  1- for arguments use one of the following gems; OptionParser or Thor gem but in all fairness, its small project
##  2- I'd most defiantly use the string library more, like the include? but as the spec said, no cheating hahaha
##  3- I wrap my work usually in a class and tedie my work into small methods, but the problem was simple and I did
##      Not want to make a hug fuss about solving it, my moto; keep it simple!!!
##  4- Finally, Happy coding!!!
##
################################################################################################################
