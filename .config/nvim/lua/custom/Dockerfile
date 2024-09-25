ARG ELIXIR_VER
FROM elixir:${ELIXIR_VER}

ARG USER UID GID
ENV USER="${USER}" \
    UID="${UID}" \
    GID="${GID}"

RUN apt update && \
    apt install -y \
    	build-essential git && \
    groupadd -g ${GID} ${USER} && \
    useradd --uid ${UID} --gid ${GID} -m -s /bin/bash ${USER}

USER ${USER}

ENTRYPOINT ["/app/mason/bin/elixir-ls" ]
