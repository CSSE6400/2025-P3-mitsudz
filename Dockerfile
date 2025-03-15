FROM python:latest

# Install pipx & poetry
RUN apt-get update && apt-get install -y pipx
RUN pipx ensurepath

RUN pip3 install poetry

# Set working directory and install poetry dependencies
WORKDIR /app
COPY pyproject.toml ./
RUN pipx run poetry install --no-root

# Copy source code
COPY todo todo

# Run the application
CMD ["pipx", "run", "poetry", "run", "flask", "--app" \
    "todo", "run", "--host", "0.0.0.0", "--port", "6400"]