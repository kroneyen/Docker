FROM centos:7

### setting  OS LANG && python folder 
USER root
ENV LANG en_US.UTF-8 
RUN mkdir -p /root/python_conf
#ENV work_conf /root/python_dir/conf/

### create work folder 
WORKDIR "/root/python_conf"

### adding google-chrome.repo mapping 
COPY google-chrome.repo /etc/yum.repos.d/ 
COPY crontab_default.sh random_range.sh req.txt redis-cli mysql kill_chrome.sh ./
#COPY ./crontab_default.sh  $work_conf
#COPY ./random_range.sh $work_conf
#COPY ./req.txt $work_conf
#COPY ./redis-cli $work_conf

### install OS && chrome  package

#RUN yum update -y 
RUN yum update -y && yum install -y yum-utils \
    wget \
    curl \
    Xvfb \
    zip \
    unzip \
    crontabs \
    google-chrome-stable \
    vim-enhanced \
    xorg-x11-xauth \
    xorg-x11-fonts-* \
    xorg-x11-font-utils \
    xorg-x11-fonts-Type1 \
    && curl https://centos7.iuscommunity.org/ius-release.rpm \
    && yum groupinstall -y fonts


### install  python 3X & pip 
RUN yum install -y python36 \
    python36-pip \
    python36-lib \
    python36-setuptools

### install python module 

RUN pip3.6 install -r req.txt

### install chromedriver  && setting PATH ChromeDriver 81.0.4044.138
RUN wget https://chromedriver.storage.googleapis.com/81.0.4044.138/chromedriver_linux64.zip 
RUN unzip chromedriver_linux64.zip 
RUN cp chromedriver /usr/bin/; cp chromedriver /usr/local/bin ; cp redis-cli /usr/local/bin

### adding --no-sandbox avoid chrome : unknown error: DevToolsActivePort file doesn't exist    
RUN sed -i 's/exec -a "$0" "$HERE\/chrome" "$@"'/'exec -a "$0" "$HERE\/chrome" "$@" --no-sandbox/g' /opt/google/chrome/google-chrome

### execute python contable 
RUN /bin/sh crontab_default.sh 
#&& /bin/sh random_range.sh

#CMD ["/bin/sh","random_range.sh"]
