FROM centos:7
RUN yum update -y
RUN yum install bzip2 wget -y
RUN wget -nv https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
RUN chmod u+x Miniconda-latest-Linux-x86_64.sh

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.27-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN conda install python==3.5.4
RUN python --version
RUN conda install pandas
RUN conda install jupyter
# Add Tini
ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
COPY data.csv /home
COPY pandas_notebook.ipynb /home

ENV CSV_FILE_DIR /home

ENTRYPOINT ["/tini", "--"]
EXPOSE 9000
CMD ["jupyter", "notebook", "--port=9000", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

# Part two
RUN yum install java-1.8.0-openjdk* -y
RUN java -version

ENV SCALA_TAR_URL http://www.scala-lang.org/files/archive
ENV SCALA_VERSION 2.10.4
ENV SBT_VERSION 0.13.6

#install scala
RUN wget $SCALA_TAR_URL/scala-$SCALA_VERSION.tgz
RUN tar xvf scala-$SCALA_VERSION.tgz
RUN mv scala-$SCALA_VERSION /usr/lib
RUN rm scala-$SCALA_VERSION.tgz
RUN ln -s /usr/lib/scala-$SCALA_VERSION /usr/lib/scala

ENV PATH $PATH:/usr/lib/scala/bin

RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
RUN tar xf spark-2.0.0-bin-hadoop2.7.tgz
RUN mkdir /usr/local/spark
RUN cp -r spark-2.0.0-bin-hadoop2.7/* /usr/local/spark
ENV PATH $PATH:$HOME/bin:/usr/local/spark/bin
RUN spark-submit --version

COPY spark_notebook.ipynb /home
RUN conda install -c conda-forge pyspark
RUN export PYSPARK_DRIVER_PYTHON=jupyter
RUN export PYSPARK_DRIVER_PYTHON_OPTS='notebook'

RUN pip install --pre toree
RUN jupyter toree install --spark_home='/usr/local/spark'
RUN conda install matplotlib
COPY solution_to_data_science.ipynb /home
COPY dsbase.csv /home
