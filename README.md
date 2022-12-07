## Build c
```bash
gcc -o hello -static main.c
```

```bash
docker buildx ls

docker buildx inspect

docker run
```

## build image from empty image

```
FROM scratch

```

## docker build
```
docker build -t hello .
```

## run

```bash
docker run -ti --rm hello
```

## inspect
```bash

# export image as tar
docker save -o hello.tar hello
tar -xf hello.tar

├── 38962ea395da196e611eea890f5e6a1e788b73f2eb9a45b75420adda74bf13da
│   ├── VERSION
│   ├── json
│   └── layer.tar
├── 50acac095653737b5754f83da7d8115144b8a48d48eeb2672272bce3b9af6a41
│   ├── VERSION
│   ├── json
│   └── layer.tar
├── 69e7ba3ca780f393962799407ece0d2b6d093d57cc4a2531ede981dfc6368a9c
│   ├── VERSION
│   ├── json
│   └── layer.tar
├── 9c76429262ecbb0e72ffe6d73b4e51abbc33b4085e72d61cf9d51c0ceaf2c873
│   ├── VERSION
│   ├── json
│   └── layer.tar
├── c6248237bb653bc492ca01400961b8e2cfabc3153c5c38540b4bcb9e338b7a9e.json
├── hello.tar
├── manifest.json
└── repositories

# check layers

$ jq '.[0].Layers[]' -r manifest.json
38962ea395da196e611eea890f5e6a1e788b73f2eb9a45b75420adda74bf13da/layer.tar
50acac095653737b5754f83da7d8115144b8a48d48eeb2672272bce3b9af6a41/layer.tar
9c76429262ecbb0e72ffe6d73b4e51abbc33b4085e72d61cf9d51c0ceaf2c873/layer.tar
69e7ba3ca780f393962799407ece0d2b6d093d57cc4a2531ede981dfc6368a9c/layer.tar

# extract files from layer.tar
for f in */layer.tar; do dir=`dirname $f`; mkdir -p "$dir/layer"; tar xf $f -C "$dir/layer"; done

.
├── 38962ea395da196e611eea890f5e6a1e788b73f2eb9a45b75420adda74bf13da
│   ├── VERSION
│   ├── json
│   └── layer
│       └── hello
├── 50acac095653737b5754f83da7d8115144b8a48d48eeb2672272bce3b9af6a41
│   ├── VERSION
│   ├── json
│   └── layer
│       └── README.md
├── 9c76429262ecbb0e72ffe6d73b4e51abbc33b4085e72d61cf9d51c0ceaf2c873
│   ├── VERSION
│   ├── json
│   └── layer
│       └── final.txt
├── 69e7ba3ca780f393962799407ece0d2b6d093d57cc4a2531ede981dfc6368a9c
│   ├── VERSION
│   ├── json
│   └── layer
│       └── final.txt
├── c6248237bb653bc492ca01400961b8e2cfabc3153c5c38540b4bcb9e338b7a9e.json
├── hello.tar
├── manifest.json
└── repositories

# check the content of final.txt
$ cat 9c76429262ecbb0e72ffe6d73b4e51abbc33b4085e72d61cf9d51c0ceaf2c873/layer/final.txt
a
$ cat 69e7ba3ca780f393962799407ece0d2b6d093d57cc4a2531ede981dfc6368a9c/layer/final.txt
b
```
