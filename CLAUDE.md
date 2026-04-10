# Trust Example - Flutter 토이프로젝트

재개발 신탁 앱 본 개발 전 API 연동 연습용 토이프로젝트.

## 프로젝트 명세
- 전체 명세: docs/PROJECT_SPEC.md 참고

## 핵심 규칙
- 아키텍처: Feature-first + Repository 패턴
- 상태관리: Riverpod
- HTTP: Dio
- 라우팅: go_router
- 모델: freezed + json_serializable
- 디자인: 토스 스타일 (미니멀, 카드 기반, Pretendard 폰트)
- API 키는 .env로 관리 (절대 커밋 금지)

## 탭 구성
1. 법령 검색 (국가법령정보센터 API)
2. 등기 통계 (등기정보광장 API)
3. 네이버 지도 (flutter_naver_map)
