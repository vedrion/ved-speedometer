# Speedometer

A lightweight and easy-to-use speedometer script for FiveM that displays your vehicle's speed, RPM, fuel level, and gear.

## Preview

![Preview](https://imgur.com/RG1NYNe.png)

## Installation

### 1. 📥 Download the Script
Clone or download this repository to your computer.

### 2. 📂 Add to Server Resources
Move the downloaded folder to the `resources` directory of your FiveM server.

### 3. 🛠️ Update `server.cfg`
- Open your `server.cfg` file, located in your server's main directory.
- Add `ensure fivem-speedometer` to ensure the script starts with your server:

## Changelog

**Version 1.1.0**

- **Added Features:**
  - **Gear Change Sounds:** Introduced sounds that play upon gear changes in the speedometer.

  - **Configuration File:** Added a new file named `config.lua` for easier customization.

  - **Fuel System:** Added support for a fuel system that integrates with the speedometer.

  - **In-Game Command:** Added a command to toggle speedometer settings in-game. The command name is configurable in `config.lua` to suit your preferences.

- **Configurations:**
  - **Measurement Type:** A new config, `UseMetricMeasurements`, allows you to directly switch between measurement types (KM/H or MPH).

  - **Display Options:** Added configuration to show or hide RPM and gear information in the speedometer.

  - **Sound Settings:** Included an option to enable or disable gear change sounds.

  - **Fuel System Settings:** You can add your own fuel system, with default support for `cdn-fuel`, `LegacyFuel`, `ox-fuel`, and `nd-fuel`.

  - **In-Game Settings:** Players can use an in-game command to configure the following settings:

    - **Show/Hide RPM**
    - **Show/Hide Gear**
    - **Enable/Disable Sound Effects**
    - **Change Metric (KM/H or MPH)**

## Contributing

Feel free to fork this repository and create a pull request for any improvements or features!

## License

This project is licensed under the MIT License.

## Acknowledgements

Thanks to [tunasayin](https://github.com/tunasayin/speedometer) for their work, which I built upon and improved with additional features for this project.
