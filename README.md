[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=18675703)
# CSSE6400 Week 3 Practical

Containerisation of our Todo application using Docker and Docker Compose.

Please see the [instructions](https://csse6400.uqcloud.net/practicals/week03) for more details.

Update this README file with appropriate information about your project,
including how to run it.

There are [resources](https://www.makeareadme.com) available to help you write a good README file.


- The only difference between the dockerfile I wrote and the provided one is the position of the line continuation character - I havbe no fucking clue why that makes a difference but somehow it does. Either that or I'm an idiot and did something else wrong which is probably more likely.

- I should try and better understand the commands in the docker file - this includes using docker's docs and just asking LLM's to explain each part.


FROM python:latest

# Install pipx & poetry
RUN apt-get update && apt-get install -y pipx
RUN pipx ensurepath

RUN pipx install poetry

# Set working directory and install poetry dependencies
WORKDIR /app
COPY pyproject.toml ./
RUN pipx run poetry install --no-root

# Copy source code
COPY todo todo

# Run the application
CMD ["pipx", "run", "poetry", "run", "flask", "--app" \
    "todo", "run", "--host", "0.0.0.0", "--port", "6400"]