# 🚀 Quick Deploy Guide - Streamlit Cloud

## 3-Step Deployment (5 minutes)

### ✅ Step 1: Ensure Code is on GitHub
Your code should already be on GitHub at: `https://github.com/Shreyas099/weather-forecast-app`

If not, push it:
```bash
git push origin main
```

### ✅ Step 2: Deploy on Streamlit Cloud

1. **Visit**: https://share.streamlit.io/
2. **Sign in** with your GitHub account
3. **Click**: "New app"
4. **Fill in**:
   - Repository: `Shreyas099/weather-forecast-app`
   - Branch: `main`
   - Main file path: `app.py`
5. **Click**: "Deploy!"

### ✅ Step 3: Wait & Access

- Build takes 2-3 minutes
- Your app will be live at: `https://weather-forecast-app.streamlit.app`
- Streamlit Cloud auto-updates when you push to GitHub!

---

## 🎯 Why Streamlit Cloud?

- ✅ **Zero configuration** - Just connect GitHub
- ✅ **Free forever** - No credit card needed
- ✅ **Auto-deploy** - Updates automatically
- ✅ **Handles ML libraries** - TensorFlow, statsmodels work out of the box
- ✅ **Official support** - Built by Streamlit team

---

## 🔄 Updating Your App

1. Make changes locally
2. Push to GitHub:
   ```bash
   git add .
   git commit -m "Update app"
   git push origin main
   ```
3. Streamlit Cloud automatically redeploys (1-2 minutes)

---

## 🐛 Troubleshooting

**Build fails?**
- Check logs in Streamlit Cloud dashboard
- Verify `requirements.txt` is correct
- Try `requirements-deploy.txt` (uses tensorflow-cpu)

**App errors?**
- Test locally first: `streamlit run app.py`
- Check logs in Streamlit Cloud
- Verify all imports work

**Need help?**
- Streamlit Cloud docs: https://docs.streamlit.io/streamlit-community-cloud
- Check `DEPLOYMENT_STREAMLIT_CLOUD.md` for detailed guide

---

**That's it! Your app should be live in minutes! 🎉**

