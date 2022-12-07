FROM scratch
ADD hello /
# error no shell to run
# RUN echo "docker buildx ls" > /something.txt
ADD README.md /
ADD a.txt /final.txt
ADD b.txt /final.txt

CMD ["/hello"]
