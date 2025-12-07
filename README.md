# Hybrid SARIMA-LSTM Weather Forecasting App

![Python](https://img.shields.io/badge/python-3.8+-blue.svg)
![Streamlit](https://img.shields.io/badge/streamlit-1.28+-red.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Hugging Face](https://img.shields.io/badge/🤗%20Hugging%20Face-Spaces-yellow.svg)

A modern weather forecasting application that combines Seasonal ARIMA (SARIMA) and Long Short-Term Memory (LSTM) neural networks to predict 7-day weather forecasts. Based on the research paper "Hybrid SARIMA-LSTM Model for Local Weather Forecasting: A Residual-Learning Approach for Data-Driven Meteorological Prediction".

## 🌟 Features

- **Hybrid Model**: Combines SARIMA for linear/seasonal patterns and LSTM for nonlinear residuals
- **Multiple Locations**: Support for any location worldwide via city name or coordinates
- **7-Day Forecasts**: Predicts weather for the next week (168 hours)
- **On-Demand Training**: Train models in real-time with customizable parameters
- **Modern UI**: Beautiful Streamlit interface with interactive visualizations
- **Real-time Data**: Fetches data from NOAA Weather API

## 📋 Requirements

- Python 3.8+
- See `requirements.txt` for all dependencies

## 🚀 Quick Start

### Local Installation

1. Clone or download this repository
2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run the Streamlit app:
```bash
streamlit run app.py
```

4. Open your browser to `http://localhost:8501`

## 🚢 Deployment on Hugging Face Spaces

### Step 1: Create a Hugging Face Account
1. Go to [huggingface.co](https://huggingface.co) and create an account
2. Create a new Space (click your profile → New Space)

### Step 2: Configure Your Space
- **Space name**: `weather-forecast-app` (or your preferred name)
- **SDK**: Streamlit
- **Hardware**: CPU Basic (or GPU if you have access)
- **Visibility**: Public or Private

### Step 3: Upload Files
Upload all files from this repository to your Hugging Face Space:
- `app.py`
- `noaa_api.py`
- `sarima_model.py`
- `lstm_model.py`
- `hybrid_model.py`
- `requirements.txt`
- `README.md` (this file)

### Step 4: Create `app.py` in Space Root
Hugging Face Spaces automatically looks for `app.py` in the root directory. Make sure your main Streamlit app is named `app.py`.

### Step 5: Configure `requirements.txt`
Ensure your `requirements.txt` includes all dependencies. Hugging Face will automatically install them.

### Step 6: Optional - Create `.streamlit/config.toml`
You can create a `.streamlit` folder with `config.toml` for custom configuration:

```toml
[theme]
primaryColor = "#667eea"
backgroundColor = "#ffffff"
secondaryBackgroundColor = "#f0f2f6"
textColor = "#262730"
font = "sans serif"
```

### Step 7: Deploy
1. Push your code to the Space repository
2. Hugging Face will automatically build and deploy your app
3. Your app will be available at: `https://huggingface.co/spaces/YOUR_USERNAME/YOUR_SPACE_NAME`

## 📖 Usage

1. **Select Location**: 
   - Enter a city name (e.g., "New York, NY") or coordinates
   - The app will automatically find the nearest weather station

2. **Configure Model Parameters** (optional):
   - Adjust SARIMA parameters (p, d, q, seasonal period)
   - Adjust LSTM parameters (sequence length, units, epochs)

3. **Train Model**:
   - Click "Train Model & Generate Forecast"
   - Wait for the model to fetch data, train, and generate predictions

4. **View Results**:
   - Interactive forecast charts
   - Daily summary table
   - Download forecast as CSV

## 🏗️ Architecture

### Model Components

1. **SARIMA Model** (`sarima_model.py`):
   - Captures linear trends and seasonal patterns
   - Automatically selects optimal order using AIC
   - Handles stationarity through differencing

2. **LSTM Model** (`lstm_model.py`):
   - Two-layer LSTM network
   - Learns nonlinear patterns in SARIMA residuals
   - Uses additional features (dewpoint, pressure, wind speed, visibility)

3. **Hybrid Model** (`hybrid_model.py`):
   - Combines SARIMA and LSTM predictions
   - Final forecast = SARIMA forecast + LSTM residual forecast

### Data Pipeline

1. **NOAA API** (`noaa_api.py`):
   - Fetches historical weather data
   - Gets current observations
   - Handles location geocoding

2. **Preprocessing**:
   - Data cleaning and alignment
   - Feature extraction
   - Time series preparation

3. **Training**:
   - SARIMA fits on historical data
   - LSTM trains on SARIMA residuals
   - Models stored in session state

4. **Prediction**:
   - Generates 168-hour (7-day) forecasts
   - Combines both model outputs

## 📊 Model Performance

Based on the research paper, the hybrid model achieves:
- **MAE**: ~1.48°C
- **RMSE**: ~1.98°C
- Better performance than standalone SARIMA or LSTM models

## 🔧 Customization

### Adjust Model Parameters
- Modify SARIMA order in the sidebar
- Change LSTM architecture (layers, units)
- Adjust training epochs and batch size

### Add More Features
- Extend `noaa_api.py` to fetch additional weather parameters
- Update `hybrid_model.py` to include new features in LSTM

### Change Forecast Horizon
- Modify `forecast_steps` in `app.py` (currently 168 hours = 7 days)

## 📝 Notes

- **Data Limitations**: NOAA API has limited free historical data. The app includes a fallback to synthetic data for demonstration.
- **Training Time**: Model training can take 1-5 minutes depending on data size and parameters.
- **API Rate Limits**: NOAA API has rate limits. The app includes error handling for API failures.

## 🤝 Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## 📄 License

This project is based on academic research. Please cite the original paper if you use this code.

## 🙏 Acknowledgments

- Research paper: "Hybrid SARIMA-LSTM Model for Local Weather Forecasting"
- NOAA Weather API for providing weather data
- Streamlit for the web framework
- Hugging Face for deployment platform

## 📧 Contact

For questions or issues, please open an issue on the repository.

