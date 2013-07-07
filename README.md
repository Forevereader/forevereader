# Forevereader Main Engine

## 기본 설명
Evernote에 지정된 note를 기준을 rss주소를 수집 rss데이터를 지정된 notebook에 update시켜 준다.

## working model & flow
* SQL db에서 user token을 꺼내옴
* user token을 사용해 evernote에서 evereader-url 노트를 가져옴
* evereader-url note에 문자열을 파싱해 url목록을 생성
* url기준으로 rss feed데이터를 수집함
* 수집된 rss feed데이터를 evereader노트북에 삽입해줌

## Adpative Scehduling
* 각 working flow의 각 단계를 message에 정보를 누적해감
* 각 working flow의 message전달은 Message Queue에서 전담하여 working flow의 각 working modeling을 독립적으로 유지
* Scheduler는 각 worker에서 처리해야 하는 Queue의 사이즈를 모니터링 하며 Message가 일정이상 쌓여있을 경우 worker을 늘림.
* 반대로 처리해야하는 Queue의 사이즈가 0일 경우 worker를 줄임

## Scale out을 위한 comment
* Message Queue를 독립 프로세스로 유지 (혹은 AWS의 Simple Queue Service활용)
* bottle neck인 working model을 개별 프로세스로 분할 해줌 (네트웍 지연등일 경우는 개별 서버로 분할)

