---
title: Hybrid Weather Forecast
emoji: 🌤️
colorFrom: purple
colorTo: pink
sdk: streamlit
sdk_version: 1.28.0
app_file: app.py
pinned: false
license: mit
---

# Hybrid SARIMA-LSTM Weather Forecasting App

A modern weather forecasting application that combines Seasonal ARIMA (SARIMA) and Long Short-Term Memory (LSTM) neural networks to predict 7-day weather forecasts.

## Features

- 🌍 **Multiple Locations**: Support for any location worldwide
- 📊 **7-Day Forecasts**: Predicts weather for the next week
- 🎯 **On-Demand Training**: Train models in real-time
- 🎨 **Modern UI**: Beautiful interactive visualizations
- 📡 **Real-time Data**: Fetches data from NOAA Weather API

## How to Use

1. Enter a city name or coordinates in the sidebar
2. Adjust model parameters (optional)
3. Click "Train Model & Generate Forecast"
4. View your 7-day weather forecast!

## Model Architecture

The hybrid model combines:
- **SARIMA**: Captures linear trends and seasonal patterns
- **LSTM**: Learns nonlinear patterns in residuals
- **Final Forecast**: SARIMA prediction + LSTM residual prediction

Based on research: "Hybrid SARIMA-LSTM Model for Local Weather Forecasting"

