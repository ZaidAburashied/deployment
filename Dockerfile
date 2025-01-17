# Use the official Python base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8501 for Streamlit
EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/


# Run the Streamlit app
ENTRYPOINT ["streamlit", "run", "--server.address", "0.0.0.0", "stream.py"]
