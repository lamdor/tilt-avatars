# syntax=docker/dockerfile:1
FROM base

ENV PIP_DISABLE_PIP_VERSION_CHECK="1"

WORKDIR /app
COPY api/requirements.txt ./
RUN --mount=type=cache,target=/root/.cache/pip \
  pip install -r requirements.txt

COPY api/ ./api/

ENV FLASK_APP=./api/app.py
ENV FLASK_ENV=development

RUN <<EOF
echo hello
EOF

CMD [ "flask", "run", "--host", "0.0.0.0" ]
