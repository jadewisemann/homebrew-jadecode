cask "jadecode" do
  version "0.1.4-alpha"
  sha256 "912a237792163b44ba96861c2c8aa86fa4cf6c2de48a9a83cb4aaf38540f5ba5"

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
    서버를 따로 띄울 필요가 없습니다. 앱을 열면 떠 있는 서버에 붙고,
    없으면 앱 안에서 로컬 백엔드를 직접 띄웁니다.

      open /Applications/jadecode.app

    워크스페이스 기본 위치: ~/jc/work (없으면 자동으로 만듭니다)
    에이전트(claude·opencode·omp·pi)는 각자 설치·로그인이 필요합니다:

      jadecode agents
  EOS
end
