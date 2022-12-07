FROM scratch
ADD hello /
RUN echo "docker buildx ls" > /something.txt
RUN echo "b" > /something.txt
CMD ["/hello"]
