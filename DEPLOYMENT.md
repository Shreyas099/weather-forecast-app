# Deployment Guide for Hugging Face Spaces

## Quick Deployment Steps

### 1. Create Hugging Face Account & Space
1. Go to https://huggingface.co and sign up/login
2. Click your profile → **New Space**
3. Fill in:
   - **Space name**: `weather-forecast-app` (or your choice)
   - **SDK**: **Streamlit**
   - **Hardware**: **CPU Basic** (free tier)
   - **Visibility**: Public or Private

### 2. Upload Files
Upload these files to your Space repository:

**Required Files:**
- ✅ `app.py` - Main Streamlit application
- ✅ `noaa_api.py` - NOAA API data fetcher
- ✅ `sarima_model.py` - SARIMA model implementation
- ✅ `lstm_model.py` - LSTM model implementation
- ✅ `hybrid_model.py` - Hybrid model combining both
- ✅ `requirements.txt` - Python dependencies
- ✅ `README.md` or `README_HF.md` - Documentation

**Optional Files:**
- `.streamlit/config.toml` - Streamlit configuration
- `.gitignore` - Git ignore rules

### 3. File Structure in Hugging Face Space
Your Space should have this structure:
```
your-space-name/
├── app.py
├── noaa_api.py
├── sarima_model.py
├── lstm_model.py
├── hybrid_model.py
├── requirements.txt
├── README.md
└── .streamlit/
    └── config.toml
```

### 4. Verify Requirements
Make sure `requirements.txt` includes all dependencies. Hugging Face will automatically install them during build.

### 5. Deploy
1. Commit and push your files to the Space repository
2. Hugging Face will automatically:
   - Install dependencies from `requirements.txt`
   - Build your Streamlit app
   - Deploy it live

### 6. Access Your App
Your app will be available at:
```
https://huggingface.co/spaces/YOUR_USERNAME/YOUR_SPACE_NAME
```

## Important Notes

### API Rate Limits
- NOAA API has rate limits
- The app includes error handling and fallback to synthetic data
- For production, consider caching or using alternative data sources

### Build Time
- First build may take 5-10 minutes
- Subsequent updates are faster (1-3 minutes)

### Resource Usage
- **CPU Basic** is sufficient for this app
- Model training happens on-demand (client-side)
- If you need faster training, upgrade to GPU

### Troubleshooting

**Build Fails:**
- Check `requirements.txt` for correct package versions
- Verify all Python files have correct syntax
- Check Hugging Face Space logs for errors

**App Runs but Errors:**
- Check browser console for JavaScript errors
- Verify NOAA API is accessible
- Check Streamlit logs in Space settings

**Slow Performance:**
- Model training is computationally intensive
- Consider reducing training epochs for faster results
- Use smaller sequence lengths for LSTM

## Customization

### Change App Title/Description
Edit the frontmatter in `README_HF.md`:
```yaml
title: Your Custom Title
emoji: 🌤️
colorFrom: purple
colorTo: pink
```

### Modify Theme
Edit `.streamlit/config.toml`:
```toml
[theme]
primaryColor = "#your-color"
backgroundColor = "#your-bg-color"
```

### Add Environment Variables
If needed, add secrets in Space settings:
1. Go to Space → Settings → Secrets
2. Add key-value pairs
3. Access in code: `os.environ['YOUR_SECRET']`

## Support

For issues:
1. Check Hugging Face Space logs
2. Review Streamlit documentation
3. Check NOAA API status
4. Open an issue on your repository

