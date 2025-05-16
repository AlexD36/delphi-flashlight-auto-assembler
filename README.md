
# Flashlight Auto Assembler
![Delphi](https://img.shields.io/badge/Delphi-Embarcadero-red?style=flat-square)

**Flashlight Auto Assembler** is an automated assembly line simulator built in Delphi that visually simulates the step-by-step construction of a flashlight. The project demonstrates how individual parts (the casing, battery, LED, and cap) are assembled along a production line until a complete product is formed and exits the line.

## Features

- **Step-by-Step Assembly:** The flashlight is built in multiple phases. The casing moves to stations where the battery, LED (composed of a bulb and base), and a trapezoidal cap are added.
- **Synchronized Movement:** Once each component is mounted, it moves along with the casing—representing the fully assembled product.
- **Dynamic Animation:** After the final assembly, the complete flashlight continues to move off the production line.
- **Styled Visuals:** Utilizes Delphi VCL components (TShape and TImage) to create visually appealing and realistic component representations.

## Installation

### Requirements

- Delphi 12 (or later)
- Basic knowledge of Delphi VCL application development

### Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/YourUsername/LanternaAutoAssembler.git
   ```
2. **Open the Project:**
   - Launch Delphi.
   - Open the project file (e.g., `LanternaAutoAssembler.dproj`) located in the repository.

## Usage

1. **Compile and Run:**  
   Build the project in Delphi and run the application. The main form is set to a fixed resolution of 1600x900.

2. **Start the Simulation:**  
   Click the **Start** button to initiate the assembly process. The casing moves to three stations where the battery, LED (bulb plus base), and the trapezoidal cap are mounted sequentially. Once complete, the assembled flashlight continues to move off the production line.

## Customization

- **Component Appearance:**  
  Adjust dimensions, shapes, and colors of each TShape component in `Unit2.pas` to suit your design preferences.

- **Animation Settings:**  
  Modify timer intervals and station positions (`FPosEtapa1`, `FPosEtapa2`, and `FPosEtapa3`) for customized animation speed and alignment.

- **Extensions:**  
  Enhance the simulation by adding sound effects, reset functionality, or simulating multiple assembly lines.


  ## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! Please fork this repository and submit pull requests with your improvements or new features.
