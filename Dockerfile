FROM python:3.9

RUN pip install mkdocs
RUN pip install mkdocs-material
RUN pip install mkdocs-mermaid2-plugin
RUN pip install mkdocs-awesome-pages-plugin
RUN pip install pymdown-extensions

WORKDIR /docs

COPY . /docs

EXPOSE 8000

CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
#CMD ["mkdocs", "gh-deploy"]