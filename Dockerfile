FROM postgres:11.5
RUN apt update \
  && apt install -y postgresql-11-mysql-fdw=2.5.* \
  && rm -rf /var/lib/apt/lists/*
