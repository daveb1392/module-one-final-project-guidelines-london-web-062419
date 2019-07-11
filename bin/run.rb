require_relative '../config/environment'
require 'rainbow'
ui = UserInterface.new
puts Rainbow('============================================================').blue
puts Rainbow('  ____    _                            ____     ____         ').turquoise 
puts Rainbow(' / ___|  | |_    ___    _ __   _   _  |___ \   / ___|   ___  ').magenta 
puts Rainbow(' \___ \  | __|  / _ \  | __|  | | | |   __) | | |  _   / _ \ ').red
puts Rainbow('  ___) | | |_  | (_) | | |    | |_| |  / __/  | |_| | | (_) |').coral
puts Rainbow(' |____/   \__|  \___/  |_|     \__, | |_____|  \____|  \___/ ').orange
puts Rainbow('                               |___/                         ').yellow
puts Rainbow('=============================================================').limegreen
puts Rainbow('=============================================================').midnightblue
        puts Rainbow('    __                                                ').limegreen
        puts Rainbow('   (`/\                                               ').limegreen
       puts Rainbow('     =\/\ __...--~~~~~-._   _.-~~~~~--...__            ').hotpink
        puts Rainbow('     =\/\               \ /               \\           ').hotpink
        puts Rainbow('      =\/                V                 \\          ').indigo
         puts Rainbow('    //_\___--~~~~~~-._  |  _.-~~~~~~--...__\\          ').orange
        puts Rainbow('     //  ) (..----~~~~._\ | /_.~~~~----.....__\\       ').salmon
       puts Rainbow('     ===( INK )==========\\|//====================     ').coral
       puts Rainbow('     ____\___/__________`---`__________________________').palevioletred
puts Rainbow('=============================================================').peru
puts Rainbow('=============================================================').limegreen
ui.greet

