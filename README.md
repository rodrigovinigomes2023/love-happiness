# love & happiness ❤ ☀

Dois comandinhos para o terminal Linux que só fazem uma coisa: mostrar uma frase
de carinho ou de felicidade **no idioma do seu sistema**. É uma brincadeira. 🙂

```console
$ love
❤  O amor cresce onde a gente coloca atenção.

$ happiness
☀  O dia não precisa ser perfeito para ser um bom dia.

$ happiness -l ja
☀  分け合った幸せは、二倍になる。
```

*English below.*

## Instalar

```sh
git clone https://github.com/rodrigovinigomes2023/love-happiness.git
cd love-happiness
./install.sh                          # só para o seu usuário (~/.local/bin)
sudo PREFIX=/usr/local ./install.sh   # ou para todo o sistema
```

Para remover: `./install.sh --remover` (com o mesmo `PREFIX`).

Quer uma frase toda vez que abrir o terminal? Coloque `happiness` no fim do seu `~/.bashrc`.

> ⚠️ O [LÖVE](https://love2d.org), motor de jogos, também usa o comando `love`.
> Se ele já estiver instalado, o instalador avisa e instala só o `happiness`,
> para não esconder o LÖVE nem passar por cima dele.

## Uso

| Comando | O que faz |
|---|---|
| `love` / `happiness` | mostra uma frase no idioma do sistema |
| `love -l fr` ou `love --lang=fr` | força um idioma |
| `love --idiomas` (ou `--languages`) | lista os idiomas disponíveis |
| `love -h` / `love -v` | ajuda / versão |

O idioma segue o do sistema: vem de `LC_ALL`, `LC_MESSAGES` ou `LANG` (o primeiro
preenchido). Se não houver frases nesse idioma, tenta a lista `LANGUAGE`, e por fim
usa inglês. Dá para testar outro idioma com `LANG=fr_FR.UTF-8 love` ou `love -l fr`.
Para desligar as cores, use `NO_COLOR=1`.

**Idiomas:** português, inglês, espanhol, francês, alemão, italiano, russo,
japonês, chinês, coreano, árabe e hindi.

## As frases

Procurei uma base de frases motivacionais aberta em vários idiomas e não achei
nenhuma com licença clara e boa cobertura: as que existem são quase todas só em
inglês ou têm citações de autores com direitos autorais. Então as frases daqui foram
**escritas para este projeto** (algumas inspiradas em ditados populares), sem citar
autor famoso, e estão em **domínio público (CC0)**.

Fica uma frase por linha em `data/<tema>/<idioma>.txt`. Para adicionar um idioma,
crie `data/love/xx.txt` e `data/happiness/xx.txt` (código ISO 639-1) e mande um pull request.
Falantes nativos, revisões são muito bem-vindas: só o português e o inglês foram
revisados por quem fala a língua no dia a dia.

## Como este projeto foi feito

Este projeto segue o método **Feito com IA**: o código foi escrito pela IA (Claude),
e eu cuido do resto, de forma aberta.

- **Quem fez o quê:** eu tive a ideia, defini o que os comandos fazem e testei.
  O Claude escreveu o código e as frases.
- **Testado:** no meu Linux (Ubuntu, bash e dash), com idiomas diferentes,
  instalação e remoção. A data está no relatório.
- **Revisado:** relatório público em [`revisoes/`](revisoes/), feito por uma IA que
  não participou da escrita, junto com checagens que não são IA (`sh -n` e `dash -n`, testes manuais).
- **Privacidade:** não acessa a internet, não guarda nada, não coleta nada.
  Só lê os arquivos de frases.
- **Manutenção:** é um projeto de brincadeira. Issues e pull requests são bem-vindos,
  mas sem prazo de resposta.

Commits e versões são assinados (selo "Verified" no GitHub).

## Licença

Código: [MIT](LICENSE). Frases em `data/`: [CC0 1.0](data/LICENSE) (domínio público).

---

## English

Two tiny Linux terminal commands that do just one thing: print a phrase about
love or happiness **in your system language**. Just for fun.

```sh
git clone https://github.com/rodrigovinigomes2023/love-happiness.git
cd love-happiness && ./install.sh
love        # or: happiness, love -l de, love --idiomas
```

The language follows your system: `LC_ALL`, `LC_MESSAGES` or `LANG`, with `LANGUAGE`
as the fallback list, then English. Try `LANG=fr_FR.UTF-8 love` or `love -l fr`.
Twelve languages so far. The phrases were written for this project (some inspired
by folk sayings) and are public domain (CC0, see data/LICENSE). The code was written by AI (Claude) and tested and
reviewed in the open; see `revisoes/`. Native speakers: corrections and new languages
are very welcome.

Note: the LÖVE game engine also ships a `love` command. If it is installed, the
installer skips `love` and installs only `happiness`.
