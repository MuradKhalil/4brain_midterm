FROM python:3.8

# Step 2: Add requirements.txt file 
COPY requirements.txt .

# Step 3: Install required pyhton dependencies from requirements file
RUN pip install -r requirements.txt

# Step 4: Copy the trained model and app
COPY /models/my_model /models/my_model
COPY /src/models /src/models

# Step 5: Set working directory to previously added app directory
WORKDIR /src/models

# Step 6: Expose the port FastAPI is running on
EXPOSE 8080

# Step 9: Run FastAPI
CMD ["uvicorn", "app:app", "--host=0.0.0.0", "--port=8080"]