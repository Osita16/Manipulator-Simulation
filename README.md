# Manipulator-Simulation

A Simulink/MATLAB simulation for a robotic manipulator, focusing on both its forward and inverse kinematics. This project provides a platform for modeling, simulating, and analyzing the motion of robotic arms, making it useful for research, education, and prototyping robotic applications.

## Features

- **Forward Kinematics:** Calculate the end-effector position/orientation given the joint parameters.
- **Inverse Kinematics:** Compute the required joint angles to achieve a desired end-effector position/orientation.
- **Simulink Integration:** Visual and interactive simulation using Simulink models.
- **MATLAB Scripts:** Scripts for computation, demonstration, and analysis.
- **Customizable Manipulator Parameters:** Easily adjust link lengths, joint limits, and other parameters.
- **Visualization:** 2D/3D plots to visualize manipulator movement and workspace.

## Getting Started

### Prerequisites

- MATLAB (Recommended: R2020a or newer)
- Simulink toolbox

### Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/Osita16/Manipulator-Simulation.git
    cd Manipulator-Simulation
    ```

2. **Open MATLAB:**

   - Add the cloned folder to your MATLAB path:
     ```matlab
     addpath(genpath('path_to/Manipulator-Simulation'));
     ```

3. **Open and Run Simulink Model:**
   - Open the main Simulink file (e.g., `manipulator_model.slx`) in MATLAB.
   - Click 'Run' in Simulink to start the simulation.

4. **Run MATLAB Scripts:**
   - Scripts such as `forward_kinematics.m` and `inverse_kinematics.m` can be run directly from the MATLAB command window.

## Usage

- **Forward Kinematics:**  
  Use the provided script or Simulink block to compute the end-effector's position for given joint angles.
- **Inverse Kinematics:**  
  Use the inverse kinematics script to calculate joint angles for a desired end-effector position.
- **Simulink Simulation:**  
  Adjust parameters in the Simulink model to simulate different manipulator configurations.

## File Structure

```
Manipulator-Simulation/
│
├── forward_kinematics.m
├── inverse_kinematics.m
├── manipulator_model.slx
├── README.md
└── ...
```

- `forward_kinematics.m`: MATLAB script for forward kinematics calculation.
- `inverse_kinematics.m`: MATLAB script for inverse kinematics calculation.
- `manipulator_model.slx`: Main Simulink model file.

###DEMO

https://github.com/user-attachments/assets/326fd2b6-59ca-4b8c-81b8-44e966479eea

## Customization

- Modify manipulator parameters (link lengths, number of joints, joint limits) in the appropriate scripts or model mask parameters.
- Extend the model to include dynamics, control algorithms, or additional sensors.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for suggestions, bug fixes, or enhancements.


---

**Author:** [Osita16](https://github.com/Osita16)  
**Project Repository:** [Manipulator-Simulation](https://github.com/Osita16/Manipulator-Simulation)
