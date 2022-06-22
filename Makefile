TTX_FILES = lol1k.ttx lol1m.ttx lol1b.ttx
TTF_FILES = $(TTX_FILES:%.ttx=%.ttf)
all: $(TTF_FILES)

%.ttf: %.ttx
	ttx -o $@ $^

%.base64: %
	{ \
		echo -n "data:application/x-font-ttf;base64,"; \
		uuencode -m $^ < $^ | head -n -1 | tail -n +2 | tr -d '\n'; \
	} > $@
