#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

GENESISD=${GENESISD:-$SRCDIR/genesisd}
GENESISCLI=${GENESISCLI:-$SRCDIR/genesis-cli}
GENESISTX=${GENESISTX:-$SRCDIR/genesis-tx}
GENESISQT=${GENESISQT:-$SRCDIR/qt/genesis-qt}

[ ! -x $GENESISD ] && echo "$GENESISD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
GENXVER=($($GENESISCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for genesisd if --version-string is not set,
# but has different outcomes for genesis-qt and genesis-cli.
echo "[COPYRIGHT]" > footer.h2m
$GENESISD --version | sed -n '1!p' >> footer.h2m

for cmd in $GENESISD $GENESISCLI $GENESISTX $GENESISQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${GENXVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${GENXVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
