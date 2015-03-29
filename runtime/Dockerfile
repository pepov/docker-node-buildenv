FROM ajnasz/nodejs-base

MAINTAINER Lajos Koszti <koszti.lajos@ustream.tv>

# Set instructions on build.
# ONBUILD ADD package.json /app/
ONBUILD ADD . /app

# Define working directory.
WORKDIR /app

EXPOSE 3000

CMD ["npm", "start"]
