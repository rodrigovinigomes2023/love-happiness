#!/bin/sh
# Instala love e happiness. Padrão: só para o seu usuário (~/.local).
#   ./install.sh               instala
#   ./install.sh --remover     remove (use o mesmo PREFIX da instalação)
#   sudo PREFIX=/usr/local ./install.sh   para todo o sistema
set -eu

PREFIX=${PREFIX:-$HOME/.local}
BIN="$PREFIX/bin"
SHARE="$PREFIX/share/love-happiness"
MARCA='love / happiness'
cd "$(dirname "$0")"

nosso() { grep -q "$MARCA" "$1" 2>/dev/null; }
existe() { [ -e "$1" ] || [ -L "$1" ]; }

remover() {
  for c in love happiness; do
    # só apaga o que é nosso
    if existe "$BIN/$c" && nosso "$BIN/$c"; then
      rm -f "$BIN/$c"
    fi
  done
  rm -rf "$SHARE/love" "$SHARE/happiness"
  rmdir "$SHARE" 2>/dev/null || true
  echo "Removido de $PREFIX."
}

instalar() {
  comandos=""
  for c in love happiness; do
    # Arquivo de outro programa no mesmo lugar: não passa por cima.
    if existe "$BIN/$c" && ! nosso "$BIN/$c"; then
      echo "Já existe $BIN/$c e não é deste projeto. Nada foi instalado." >&2
      echo "Use outro PREFIX ou remova o arquivo antes." >&2
      exit 1
    fi
    # Outro programa com o mesmo nome em outra pasta do PATH (o LÖVE, motor
    # de jogos, usa "love"): instalar aqui esconderia ou seria escondido.
    outro=$(command -v "$c" 2>/dev/null || true)
    if [ -n "$outro" ] && [ "$outro" != "$BIN/$c" ] && ! nosso "$outro"; then
      echo "Aviso: já existe outro '$c' em $outro (o LÖVE usa 'love')."
      echo "       Pulei o '$c' para não atrapalhar esse programa."
      continue
    fi
    comandos="$comandos $c"
  done
  [ -n "$comandos" ] || { echo "Nada para instalar." >&2; exit 1; }

  mkdir -p "$BIN" "$SHARE"
  rm -rf "$SHARE/love" "$SHARE/happiness"
  cp -R data/love data/happiness "$SHARE/"
  for c in $comandos; do
    rm -f "$BIN/$c"
    cp bin/love "$BIN/$c"
    chmod 755 "$BIN/$c"
  done

  echo "Instalado em $BIN:$comandos"
  case ":$PATH:" in
    *":$BIN:"*) ;;
    *) echo "Atenção: $BIN não está no seu PATH." ;;
  esac
}

case "${1:-}" in
  '') instalar ;;
  --remover|--uninstall) remover ;;
  -h|--help) sed -n '2,5p' "$0" | sed 's/^# \{0,1\}//' ;;
  *) echo "Opção desconhecida: $1 (use --remover ou --help)" >&2; exit 2 ;;
esac
