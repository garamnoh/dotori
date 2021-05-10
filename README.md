# 도토리
자바를 자바라의 세미프로젝트
---
### 다음을 확인해주세요 - 공통 사안

1. Window -> Preferences -> Installed JREs에서 체크되어있는 것의 버전이 11인지 확인해주세요(참고로 팀장님과 기영킴의 버전은 11.0.9-2입니다, 이 버전은 각 Dynamic Project마다 틀어질 수도 있으므로 만약 그런 경우에는 프로젝트 우클릭 -> Preferences -> Java Build Path -> Libraries -> Modulepath에서 버전을 확인,변경해주세요).
2. 해당 Dynamic Project 우클릭 -> Preferences -> Project Facets에서 'Java'의 버전이 11로 되어있는지 확인해주세요.
3. (참고) 버전을 변경할 시에 컴파일러의 버전도 함께 바꿔줘야 합니다. Window -> Preferences -> Java -> Compiler에서 Compiler compliance level이 11로 되어있는지 확인해주세요.
4. 인코딩을 확인해주세요. Window -> Preferences -> {General -> Workspace, Web -> CSS Files, Web->HTML Files, Web -> JSP Files, XML -> XML Files}의 인코딩이 모두 UTF-8이어야 합니다.
6. 관리자 계정으로 "아이디 admin@gmail.com / 비밀번호 admin"을 만들어두었습니다. 테스트 로그인에 사용해주세요.

### 깃허브에서 내 저장소로 받아와서 프로젝트 실행시키는 방법

1. 수업 시간에 해오던 대로 Dynamic Web Project를 새로 생성합니다. 다만 Generate web.xml deployment descriptor는 체크하지 않습니다(이렇게 하는 이유는 최초 pull을 했을 때 기존에 있던 파일과 충돌이 일어나서 pull을 거부하기 때문입니다. 만약 체크했다면 나중에 web -> WEB-INF -> web.xml을 지워주셔도 됩니다)
2. 또 하나의 충돌(최초 pull거부)을 방지하기 위하여 web -> META-INF -> MANIFEST.MF파일을 삭제해주세요.
3. 이제 파일 탐색기에서 해당 workspace 아래의 해당 프로젝트 폴더에 깃 초기화(git init .)를 한 후 깃허브의 저장소와 연결하고(git remote add origin 깃허브주소) pull(git pull origin master)을 해줍시다. 그러면 깃허브에 있는 것들이 프로젝트로 들어옵니다.
4. clone을 하지 않는 이유는 .settings, .classpath, .project등이 ignore되었기 때문입니다. Workspace 안에 바로 clone하셔서 이클립스에서 import하셔도 읽히지 않습니다.
5. ignore처리된 것 중 다른 중요한 것은 "/resources/"입니다. 이 안의 것은 보안을 위하여 ignore처리하였습니다. 이것은 직접 만들어주셔야 합니다. 이클립스에서 resources 소스폴더를 생성하고 아래에 해당 패키지와 파일들을 약속한대로 만들어주거나 복사해줍시다. 소스 폴더가 아니면 해당 파일들이 컴파일과 함께 default output folder안으로 들어가지 않는다는 것을 주의해주세요. default output folder안으로 들어가지 않으면 경로를 올바르게 읽을 수 없습니다.
6. 다 했으면 서버를 올리고 실행시켜봅시다. 그러면 web/WEB-INF/classes안에 자동으로 컴파일된 파일들이 생성되면서 정상적으로 실행됩니다.
7. 또한 보안을 위하여 데이터베이스를 구성할 .sql파일은 올리지 않았습니다. 약속한대로 .sql파일을 가지고 있다면 그것을 SQLDeveloper에서 실행하여 데이터베이스를 구성하시면 됩니다. 따라서 깃허브 외에 직접 구성해야 할 파일은 /resources/에 들어가는 파일들과 .sql파일입니다.

