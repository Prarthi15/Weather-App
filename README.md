# Weather App Using OpenWeatherMap API

This project is a weather application that uses the OpenWeatherMap API to display current weather conditions, including temperature, humidity, wind speed, and more, for a searched city. The application features a responsive design, suitable for both desktop and mobile devices, and provides daily weather forecasts with visually appealing icons and background images.

## Table of Contents

- [Features](#features)
- [Demo](#demo)
- [Installation](#installation)
- [Usage](#usage)
- [Technologies Used](#technologies-used)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)

## Features

- Search weather conditions for any city.
- Display current temperature, weather type, humidity, wind speed, and more.
- Show daily weather forecast for the next few days.
- Responsive design for both desktop and mobile views.
- Dynamic background images and icons based on weather conditions.

## Demo
![home.png]()

## Installation

To get a local copy up and running, follow these steps:

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/weather-app-using-openweathermap-api.git
    cd weather-app-using-openweathermap-api
    ```

2. **Open the project in your preferred code editor.**

3. **Update API key:**

   Open the `scripts/script.js` file and replace `'YOUR_API_KEY'` with your actual API key from OpenWeatherMap.

    ```javascript
    const API_KEY = 'YOUR_API_KEY';
    ```

## Usage

1. Open `index.html` in your web browser.

2. Enter the name of the city you want to search for in the search bar.

3. View the current weather conditions and the daily forecast.

## Technologies Used

- HTML5
- CSS3
- JavaScript
- OpenWeatherMap API

## Folder Structure

```plaintext
weather-app-using-openweathermap-api/
├── icons/
│   └── (weather icons and favicon)
├── media/
│   └── (background images and other media files)
├── scripts/
│   ├── script.js
│   └── mobile.js
├── styles/
│   └── style.css
├── index.html
└── README.md
