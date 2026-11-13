# homebrew-jadecode

[jadecode](https://github.com/jadewisemann/jadecode) 의 Homebrew tap 입니다.

## 설치

```sh
brew install --cask jadewisemann/jadecode/jadecode
```

`jadewisemann/jadecode/jadecode` 는 `tap`/`cask` 를 한 번에 지정하는 축약형입니다.
먼저 tap 을 추가하고 쓰려면:

```sh
brew tap jadewisemann/jadecode
brew install --cask jadecode
```

## 왜 Homebrew 로 설치하나

Homebrew 는 내려받은 파일에 `com.apple.quarantine` 을 붙이지 않습니다.
그래서 브라우저로 DMG 를 받았을 때처럼 "손상되었습니다"·"확인되지 않은 개발자"
경고를 매번 겪지 않습니다.

이 빌드는 Apple Developer 인증서로 서명·공증되지 않았습니다(ad-hoc 서명).
그래도 Homebrew 설치 경로에서는 quarantine 이 없으므로 Gatekeeper 가 막지 않습니다.

## 업그레이드

```sh
brew upgrade --cask jadecode
```

`brew update` 뒤 새 릴리즈가 나왔는지 확인합니다.

## 첫 실행

앱을 열기 전에 서버가 필요합니다. cask 가 넣어 주는 `jadecode` CLI 로 띄웁니다:

```sh
jadecode run --open
```

이 명령이 워크스페이스(`~/jc/work`)를 준비하고 서버를 백그라운드로 띄운 뒤 앱을 엽니다.
워크스페이스를 직접 고르려면 `--ws <디렉터리>` 를 붙입니다.

에이전트(`claude`·`opencode`·`omp`·`pi`)는 각자 설치·로그인이 필요합니다:

```sh
jadecode agents
```

## 지우기

```sh
brew uninstall --cask jadecode
```

워크스페이스(`~/jc/work`)는 지워지지 않습니다. 필요하면 직접 지우세요.

## 이 tap 을 유지하는 방법

`Casks/jadecode.rb` 는 손으로 고치지 않습니다. jadecode 본체 저장소의
릴리즈 워크플로가 릴리즈가 **공개될 때** `tools/update-cask.py` 로 다시 만들어
이 저장소에 커밋합니다. 자세한 절차와 필요한 토큰 설정은
[jadecode 저장소의 docs/homebrew.md](https://github.com/jadewisemann/jadecode/blob/main/docs/homebrew.md)
에 있습니다.

## 문제가 생기면

- cask 가 오래됐다: `brew update` 후 다시 시도
- 앱이 안 열린다: `jadecode run --open` 으로 서버가 떠 있는지 확인
- 그 밖의 문제: https://github.com/jadewisemann/jadecode/issues
