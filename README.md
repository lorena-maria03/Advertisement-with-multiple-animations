# Advertisement-with-multiple-animations

The way in which the animations are selected is as follows: each animation corresponds to a binary number, and the leftmost digit corresponds to the first switch from left to right, the middle one corresponds to the second switch, the third one corresponds to the third switch, and the fourth switch resets the animation from the beginning.
Therefore:   0 = switch down, 1 = switch up

Animation modes:
000 - word flow from right to left (alba)
001 - word flow from left to right (alba)
011 - letter by letter appearance from left to right (lili)
110 - letter by letter appearance from right to left (lili)
100 - flicker effect (bebe)
010 - gradual appearance from left to right (cola)
101 - gradual appearance from right to left (cola)
111 - word flow from right to left (alba)


--COMPONENTS-- 

Frequency divider
The frequency divider is made using a 27-bit counter, which divides the 100 Mhz board clock. The N has the role of specifying what time this Clock is divided into, for various applications. For example, if the N is 26, the divider will divide my Clock in a fixed second, and if it is 25, it will divide in 0.8 seconds. From this counter I will output the N bit of the counter (indicating the frequency) and this bit will be displayed as the output of the divider. This resource also has the Reset signal, which will reset my counter to 0.

Frequency divider for display
This divider has exactly the same operation mode as the one described above, only that the counter in this divider is 20 bits and divides my Clock at a frequency of 10.5 ms, and its output is 2 bits, whose purpose will be explained in the functionality of the display.

Seven segment display
The 7-segment display receives as input 4 numbers on 4 bits and the Clock on 100 Mhz. The clock is divided at 10.5 ms by 2 bits and is put, as selections, to a 4:1 Multiplexer with 4-bit inputs, which decides (very quickly) which of the 4 mini-displays is activated, through the anode, and this gives the impression to the user that the displays are running at the same time. At the same time, this output is also linked to the 4:1 5-bit Multiplexer, which decides which number is displayed on the same display. The output of the 4:1 5-bit Multiplexer is connected to a Decoder, to decode the number transmitted as input into a 7-bit code, specific to the cathode, which will be displayed on the display.

Multiplexer 4:1
In this project, 4:1 Multiplexers with 4-bit or 5-bit inputs are used. Depending on the entered selection (example in the image), the corresponding entry will be displayed on the output.

Alphabet decoder
The data input from the alphabet decoder is a 5-bit binary number, which enters a register where each number corresponds to a 7-bit code, specific to the cathode, which is transposed as an output from the component.

Multiplexer 8:1

The role of the 8:1 Multiplexer is to make the selection between animation modes. It works exactly like the 4:1 Multiplexer, described above, only this is modified to show 4 outputs, each specific to an anode. In the project, the input is a 3-bit number, and the outputs are 4-bit.

Animations
The animations are all built in the same way, with small differences.
These include the CLK and One_second_enable signals, both of which work as clocks. The One_second_enable signal is the output of the frequency divider, whose functionality was described above.
Before starting the animation, it is checked through the mode signals (which has 3 bits) if it is the desired animation (for example, for "000" -> animation 1). Then, once per clock pulse (that is, one second), a word state counter is incremented. The increment differs from animation to animation, but in most it is 4.
The cathodes of the respective display correspond to each output (Output_1 -> first cathode, Output_2 -> second cathode, etc.), and each output is assigned the state corresponding to the increment, stored in the register with the states of the word. (output_1 <= word(1), output_2 <= word(2) ).
The role of the binary code -> alphabet register is to ease the work of the programmer to change the words displayed in that animation mode, by associating each letter and digit of the alphabet with a decimal number, making its use intuitive (10 -> A, 0 -> 0 , 1 -> 1, 31 -> FREE SPACE).
The way it works is by associating a decimal number with a 5-bit binary number, which, entered in the binary code -> alphabet decoder, will display the corresponding letter / digit.
When it has the value '1', the reset signal will bring the state increment to 0, i.e. to the base word.
