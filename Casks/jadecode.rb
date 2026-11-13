cask "jadecode" do
  version "0.1.3-alpha"
  sha256 "debc1b701c321fb2ce54ec49dae7e0d3af2b5fd3648842ce25b7b02f3e1bf7dd"

  url "https://github.com/jadewisemann/jadecode/releases/download/v#{version}/jadecode-#{version}-macos-aarch64.dmg"
  name "jadecode"
  desc "Task-driven kanban where orchestrator bots move cards and worker bots do the work"
  homepage "https://github.com/jadewisemann/jadecode"

  # 릴리즈는 모두 사전판(-alpha/-beta/-rc)이다. GitHub 의 "latest" 는 사전판을
  # 돌려주지 않아 livecheck 가 404 로 실패한다. 새 버전은 cask 갱신 워크플로가
  # 릴리즈 공개 때 직접 넣는다.
  livecheck do
    skip "사전판 릴리즈만 있다"
  end

  # 문자열 비교 형식(">= :sonoma")은 폐기되었다.
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "jadecode.app"

  # 서버·CLI 는 앱 번들 안에 있지만, 터미널에서 쓰려면 심볼릭 링크를 두는 편이 낫다.
  binary "#{appdir}/jadecode.app/Contents/MacOS/jadecode"
  binary "#{appdir}/jadecode.app/Contents/MacOS/jadecode-mcp"

  caveats <<~EOS
    앱을 열기 전에 서버가 필요합니다. 다음 한 줄이 워크스페이스를 준비하고
    서버를 백그라운드로 띄운 뒤 앱을 엽니다:

      jadecode run --open

    워크스페이스 기본 위치: ~/jc/work (바꾸려면 --ws <디렉터리>)
    에이전트(claude·opencode·omp·pi)는 각자 설치·로그인이 필요합니다:

      jadecode agents
  EOS
end
