# Deployment Guide: Streamlit Cloud (Recommended)

## Why Streamlit Cloud?

✅ **Official Streamlit hosting** - Built by Streamlit team  
✅ **Free tier available** - Perfect for projects  
✅ **Automatic dependency management** - Handles requirements.txt  
✅ **GitHub integration** - Deploy directly from your repo  
✅ **Easy setup** - No Docker or complex config needed  
✅ **Handles ML libraries** - Works great with TensorFlow, statsmodels  

## 🚀 Quick Deployment (5 minutes)

### Step 1: Push to GitHub
Make sure your code is pushed to GitHub:
```bash
git push origin main
```

### Step 2: Deploy on Streamlit Cloud

1. **Go to Streamlit Cloud**:
   - Visit: https://share.streamlit.io/
   - Sign in with GitHub

2. **Create New App**:
   - Click "New app"
   - Select your repository: `Shreyas099/weather-forecast-app`
   - Branch: `main`
   - Main file path: `app.py`

3. **Advanced Settings** (Optional):
   - Python version: 3.9 or 3.10 (recommended)
   - Secrets: Add any API keys if needed (not required for this app)

4. **Deploy**:
   - Click "Deploy!"
   - Wait 2-3 minutes for build
   - Your app will be live at: `https://weather-forecast-app.streamlit.app`

## 📋 Requirements Check

Your `requirements.txt` is already set up correctly! Streamlit Cloud will:
- Install all dependencies automatically
- Handle TensorFlow CPU version
- Set up all Python packages

## ⚙️ Configuration

### Optional: Add `packages.txt` for system packages
If you need system-level packages, create `packages.txt`:
```
# Usually not needed for this app
```

### Optional: Add `.streamlit/secrets.toml` for secrets
If you need API keys later:
```toml
[secrets]
NOAA_API_KEY = "your-key-here"
```

## 🔄 Updating Your App

1. Make changes locally
2. Commit and push to GitHub:
   ```bash
   git add .
   git commit -m "Update app"
   git push origin main
   ```
3. Streamlit Cloud automatically redeploys (usually within 1-2 minutes)

## 🎯 Benefits Over Other Platforms

| Feature | Streamlit Cloud | Hugging Face | Railway | Render |
|---------|----------------|--------------|---------|--------|
| **Ease of Setup** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Free Tier** | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |
| **ML Libraries** | ✅ Excellent | ✅ Good | ⚠️ May need config | ⚠️ May need config |
| **Auto Deploy** | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |
| **Official Support** | ✅ Yes | ❌ No | ❌ No | ❌ No |

## 🐛 Troubleshooting

### Build Fails
- Check Streamlit Cloud logs
- Verify `requirements.txt` syntax
- Ensure Python version is compatible (3.8-3.11)

### App Runs but Errors
- Check app logs in Streamlit Cloud dashboard
- Verify all imports work locally first
- Test with `streamlit run app.py` locally

### Slow Performance
- Model training is CPU-intensive
- Consider reducing epochs for faster results
- Streamlit Cloud free tier has resource limits

## 📊 Resource Limits (Free Tier)

- **RAM**: 1 GB
- **CPU**: Shared
- **Storage**: 1 GB
- **Bandwidth**: Generous

For this app, free tier is sufficient!

## 🔗 Your App URL

After deployment, your app will be at:
```
https://weather-forecast-app.streamlit.app
```

Or a custom domain if you upgrade.

---

## Alternative: Railway (If Streamlit Cloud doesn't work)

If you prefer Railway:

1. Go to: https://railway.app/
2. Sign in with GitHub
3. New Project → Deploy from GitHub
4. Select your repository
5. Add build command: `pip install -r requirements.txt`
6. Add start command: `streamlit run app.py --server.port $PORT`
7. Deploy!

---

## Alternative: Render

1. Go to: https://render.com/
2. New → Web Service
3. Connect GitHub repository
4. Settings:
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `streamlit run app.py --server.port $PORT --server.address 0.0.0.0`
5. Deploy!

---

**Recommendation: Start with Streamlit Cloud - it's the easiest and most reliable for Streamlit apps!**

