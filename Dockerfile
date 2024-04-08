ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-slim
ARG POETRY_VERSION

WORKDIR /tmp
COPY install.py .
RUN POETRY_HOME=/opt/poetry python install.py --version ${POETRY_VERSION}

WORKDIR /
RUN rm -rf /tmp && mkdir -p /tmp
ENV PATH="${PATH}:/opt/poetry/bin"