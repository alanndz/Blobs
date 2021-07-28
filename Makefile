NAME ?= aLn-Blobs
BLOB ?= Test
LOWER := $(shell echo "$(BLOB)" | sed -e 's/\(.*\)/\L\1/')
DATE := $(shell date "+%Y%m%d-%H%M")
ZIP := $(NAME)-$(BLOB)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md* *.zip* extract-files.sh *.txt*

normal: $(ZIP)

$(ZIP):
	@echo "id=aln.blobs.$(LOWER)" > module.prop
	@echo "name=aLn Blobs $(BLOB)" >> module.prop
	@echo "version=v1.0" >> module.prop
	@echo "versionCode=1" >> module.prop
	@echo "author=alanndz" >> module.prop
	@echo "description=Testing blobs $(BLOB)" >> module.prop
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf module.prop
	@rm -vrf system
	@echo "Done."
