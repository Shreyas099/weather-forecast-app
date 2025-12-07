# Troubleshooting Hugging Face Space Configuration Error

## Common Causes and Solutions

### ❌ Issue: Files in `src` Folder
**Problem**: If your files are inside a `src` folder, Hugging Face can't find them.

**Solution**: 
- All files must be in the **root directory** of your Space
- Move all Python files (`app.py`, `noaa_api.py`, etc.) to the root
- Delete the `src` folder if it exists

**Correct Structure:**
```
your-space-name/
├── app.py              ← Must be in root
├── noaa_api.py         ← Must be in root
├── sarima_model.py     ← Must be in root
├── lstm_model.py       ← Must be in root
├── hybrid_model.py      ← Must be in root
├── requirements.txt    ← Must be in root
├── README.md
└── .streamlit/
    └── config.toml
```

### ❌ Issue: Missing `app.py` in Root
**Problem**: Hugging Face looks for `app.py` in the root directory.

**Solution**: 
- Ensure `app.py` is directly in the root, not in any subfolder
- Check that `README_HF.md` has `app_file: app.py` in the frontmatter

### ❌ Issue: Import Errors
**Problem**: Python can't find the modules.

**Solution**: 
- All `.py` files must be in the same directory (root)
- Imports are correct: `from noaa_api import NOAADataFetcher`
- Don't use relative imports like `from .noaa_api import ...`

### ❌ Issue: Missing Dependencies
**Problem**: Some packages might not install correctly.

**Solution**: 
- Check `requirements.txt` has all dependencies
- TensorFlow might need specific version for CPU-only environments
- Consider pinning versions more strictly

### ✅ Quick Fix Checklist

1. **Verify File Structure**:
   - [ ] `app.py` is in root directory
   - [ ] All `.py` files are in root directory
   - [ ] No files in `src` or other subfolders (except `.streamlit/`)

2. **Check README_HF.md**:
   - [ ] Has correct frontmatter with `sdk: streamlit`
   - [ ] Has `app_file: app.py`

3. **Verify requirements.txt**:
   - [ ] All packages listed
   - [ ] Versions are compatible

4. **Check Build Logs**:
   - Go to Space → Settings → Logs
   - Look for import errors or missing files

## Step-by-Step Fix

1. **Delete the `src` folder** (if it exists in your Space)
2. **Move all files to root**:
   - `app.py`
   - `noaa_api.py`
   - `sarima_model.py`
   - `lstm_model.py`
   - `hybrid_model.py`
   - `requirements.txt`
   - `README.md` or `README_HF.md`

3. **Commit and push** the changes

4. **Wait for rebuild** (usually 2-5 minutes)

5. **Check the logs** if error persists

## Alternative: If You Must Use a `src` Folder

If you really need a `src` folder structure, you would need to:

1. Update imports in `app.py`:
```python
import sys
sys.path.append('src')
from src.noaa_api import NOAADataFetcher
from src.hybrid_model import HybridSARIMALSTM
```

2. Update imports in `hybrid_model.py`:
```python
from src.sarima_model import SARIMAModel
from src.lstm_model import LSTMModel
```

**But this is NOT recommended** - Hugging Face Spaces work best with files in root.

## Still Having Issues?

1. Check the **Build Logs** in Space Settings
2. Verify all files are committed and pushed
3. Try deleting and recreating the Space
4. Check Hugging Face status page for service issues

