# Alamouti_spacetime_code_matlab
**Project Title**: Alamouti Space-Time Coding Simulation for Wireless Communication

**Project Brief**:

**Objective**: Design and implement an Alamouti Space-Time Coding simulation to analyze its performance in a wireless communication system.

**Description**:

In this project, I developed a comprehensive simulation of the Alamouti Space-Time Coding technique for wireless communication systems. This coding technique is a powerful method to enhance communication reliability and capacity in challenging wireless environments.

**Methods and Actions**:

1. **Initialization and Input Generation**:
   - Initialized the project with necessary setup, including clearing variables and figures.
   - Generated random input bits (`txBits_1` and `txBits_2`) for transmission.

2. **Modulation**:
   - Created a modular `myModulator` function to map input bits to QPSK constellation points.
   - Employed QPSK modulation to represent the data as complex symbols.

3. **Channel Modeling**:
   - Simulated Rayleigh fading channels for both transmitter-to-receiver paths (`channel_1` and `channel_2`).
   - Introduced Additive White Gaussian Noise (AWGN) to the communication channel.

4. **Alamouti Encoding**:
   - Developed an `myAlamoutiEncoder` function to encode modulated symbols using Alamouti Space-Time Coding.
   - Encoded symbols considering channel gains and noise.

5. **Alamouti Decoding**:
   - Implemented an `myAlamoutiDecoder` function to decode received symbols.
   - Utilized Alamouti's decoding scheme, ensuring coherent detection and channel estimation.
   
6. **Demodulation**:
   - Created a modular `myDemodulator` function for demodulating received symbols.
   - Calculated the distance between received symbols and constellation points for demodulation.

7. **Error Probability Calculation**:
   - Evaluated the error probability (`Pe`) by comparing the demodulated bits with the original input bits.
   - Iterated over various Signal-to-Noise Ratio (SNR) values to generate an error probability curve.

8. **Visualization and Analysis**:
   - Plotted a semilogarithmic graph depicting SNR versus Error Probability to analyze system performance.
   - Set appropriate axes limits and labels for clarity.

**Results**:

The simulation provides insights into the performance of the Alamouti Space-Time Coding technique under various SNR conditions. The error probability curve demonstrates the robustness of the system in combating noise and fading channels.

**Skills Demonstrated**:
- MATLAB Programming
- Modulation and Demodulation Techniques
- Alamouti Space-Time Coding
- Simulation and Analysis of Wireless Communication Systems

**Conclusion**:

This project showcases a practical implementation of Alamouti Space-Time Coding in a wireless communication context. It provides valuable experience in simulating and evaluating the performance of advanced communication techniques. The results indicate the potential for improved wireless communication reliability in challenging environments.
