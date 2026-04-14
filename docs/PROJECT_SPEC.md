# 신탁 앱 토이프로젝트 - 프로젝트 명세서

## 프로젝트 개요

재개발 신탁 관련 본 앱 개발 전, Flutter 감잡기 + 공공 API 통신 연습용 토이프로젝트.
3개의 독립된 기능을 탭 기반으로 구성한다.

### 롤모델
- [얼마집](https://www.howmuchhome.co/) — 도시정비사업 디지털 플랫폼
- 본 프로젝트는 얼마집의 핵심 기능(소유권 인증, 투표, 커뮤니티) 개발 전 API 연동 감잡기가 목적

---

## 기술 스택

| 항목 | 선택 |
|------|------|
| 프레임워크 | Flutter (최신 stable) |
| 언어 | Dart |
| 상태관리 | Riverpod |
| HTTP 클라이언트 | Dio (Retrofit 미사용 — 아래 참고) |
| 라우팅 | go_router |
| 지도 | flutter_naver_map (NMap SDK) |
| 아키텍처 | Feature-first + Repository 패턴 |
| 코드 생성 | freezed + json_serializable (모델) |

### Retrofit 미사용 사유
- 토이프로젝트 특성상 API 엔드포인트가 3개뿐이라 Retrofit의 이점이 크지 않음
- 법령 API가 XML 응답이라 Retrofit의 JSON 자동 변환 이점 없음
- 등기 API 응답 구조가 불확실하여 직접 파싱이 더 유연
- **본 프로젝트에서는 API가 많아지고 JSON 응답이 일관될 때 Retrofit 도입 예정**

---

## 프로젝트 구조

```
lib/
├── main.dart
├── app.dart                          # MaterialApp + GoRouter + BottomNav 설정
├── core/
│   ├── network/
│   │   ├── dio_client.dart           # Dio 인스턴스, interceptor, base URL 설정
│   │   └── api_exception.dart        # 공통 에러 핸들링
│   ├── constants/
│   │   └── api_keys.dart             # API 키 관리 (환경변수 or .env)
│   └── theme/
│       └── app_theme.dart
├── features/
│   ├── law/                          # 탭1: 법령 검색
│   │   ├── data/
│   │   │   ├── datasource/
│   │   │   │   └── law_remote_datasource.dart
│   │   │   ├── model/
│   │   │   │   └── law_article.dart  # freezed 모델
│   │   │   └── repository/
│   │   │       └── law_repository.dart
│   │   └── presentation/
│   │       ├── law_search_screen.dart
│   │       ├── law_detail_screen.dart
│   │       └── provider/
│   │           └── law_provider.dart  # Riverpod provider
│   ├── registry/                     # 탭2: 등기 통계
│   │   ├── data/
│   │   │   ├── datasource/
│   │   │   │   └── registry_remote_datasource.dart
│   │   │   ├── model/
│   │   │   │   └── registry_stat.dart
│   │   │   └── repository/
│   │   │       └── registry_repository.dart
│   │   └── presentation/
│   │       ├── registry_screen.dart
│   │       └── provider/
│   │           └── registry_provider.dart
│   └── map/                          # 탭3: 네이버 지도
│       └── presentation/
│           ├── map_screen.dart
│           └── provider/
│               └── map_provider.dart
```

---

## 탭 1: 법령 검색 (국가법령정보센터 Open API)

### API 정보
- **엔드포인트**: `http://www.law.go.kr/DRF/lawSearch.do`
- **인증**: 공공데이터포털에서 인증키 발급 (무료, 즉시)
- **문서**: https://www.law.go.kr/LSO/openApi.do
- **응답 형식**: XML (기본) 또는 JSON

### 구현 기능
1. **법령 검색**: 키워드 입력 → 법령 리스트 표시
   - 검색어 예시: "도시정비", "빈집특례", "신탁"
   - 파라미터: `query`, `display`(표시 건수), `page`
2. **법령 상세 조회**: 리스트에서 항목 탭 → 조문 전체 표시
   - 조문 단위로 파싱하여 보기 좋게 표시
   - 조문 번호, 제목, 내용 구분

### UI
- SearchBar + ListView (검색 결과)
- 상세 화면: 조문 목차 + 스크롤 뷰
- 로딩/에러/빈 상태 처리

### 학습 포인트
- Dio를 활용한 REST API 통신
- XML 파싱 (xml2json 또는 xml 패키지)
- 검색 디바운싱
- 리스트/디테일 네비게이션 패턴

---

## 탭 2: 등기 통계 (등기정보광장 Open API)

### API 정보
- **엔드포인트**: `https://data.iros.go.kr` 하위 API
- **인증**: 등기정보광장 회원가입 → 인증키 발급 (무료, 승인 불필요)
- **일일 한도**: 1,000건
- **응답 형식**: JSON 또는 XML

### 구현 기능
1. **지역 선택**: 시도 → 시군구 드롭다운
2. **등기 현황 조회**: 선택 지역의 부동산등기 통계 표시
   - 소유권이전(매매) 건수 추이
   - 부동산 유형별 분류
3. **간단한 차트**: 월별/분기별 추이를 bar chart 또는 line chart로 표시

### UI
- 지역 선택 드롭다운 (시도/시군구)
- 통계 카드 (주요 수치)
- 차트 (fl_chart 패키지)
- 로딩/에러/빈 상태 처리

### 학습 포인트
- 드롭다운 연동 (부모-자식 셀렉터)
- JSON 파싱 + 모델 매핑
- 차트 라이브러리 활용
- 상태에 따른 UI 분기

---

## 탭 3: 네이버 지도

### SDK 정보
- **패키지**: `flutter_naver_map`
- **키 발급**: 네이버 클라우드 플랫폼 → Application 등록 → NCP Map SDK 키 발급
- **무료**: 모바일 다이내믹맵 무제한 제공

### 구현 기능
1. **지도 표시**: 기본 지도 렌더링 (서울 중심)
2. **마커 표시**: 특정 좌표에 마커 추가
   - 탭 시 정보 윈도우 표시
3. **폴리곤 오버레이**: 하드코딩된 좌표로 구역 경계 그리기
   - 색상/투명도 설정
   - 향후 정비구역 데이터 연동 대비
4. **현재 위치**: GPS 기반 현재 위치 표시

### 설정
- Android: `AndroidManifest.xml`에 NCP 클라이언트 ID 추가
- iOS: `AppDelegate.swift`에 NCP 클라이언트 ID 추가
- 위치 권한: `geolocator` 패키지

### 학습 포인트
- 네이티브 SDK 연동 (플랫폼별 설정)
- 지도 위 오버레이 조작
- 위치 권한 처리
- Platform Channel 이해

---

## 디자인 가이드 (토스 스타일 참고)

### 디자인 원칙
- **미니멀 & 화이트 스페이스**: 여백을 넉넉히, 요소 간 간격 충분히
- **큰 타이포그래피**: 핵심 수치/제목은 크고 굵게 (24~32sp), 보조 텍스트는 작고 연하게
- **카드 기반 레이아웃**: 정보 단위를 둥근 모서리 카드(radius 16)로 그룹핑
- **단일 액션 포커스**: 한 화면에 하나의 핵심 행동만 유도
- **바텀시트 활용**: 상세 정보나 선택지는 모달 대신 바텀시트

### 컬러
- 배경: `#F5F6F8` (연한 그레이)
- 카드 배경: `#FFFFFF`
- 주요 텍스트: `#191F28`
- 보조 텍스트: `#8B95A1`
- 프라이머리: `#3182F6` (토스 블루)
- 성공: `#00C853`
- 경고/에러: `#F04452`
- 구분선: `#E5E8EB`

### 타이포그래피
- 폰트: Pretendard (Google Fonts에서 사용 가능)
- Heading: 24sp Bold
- Subheading: 18sp SemiBold
- Body: 15sp Regular
- Caption: 13sp Regular, 보조 컬러

### 컴포넌트 스타일
- **카드**: 배경 white, radius 16, elevation 0, padding 20
- **버튼**: radius 12, height 52, 풀와이드, Bold 텍스트
- **인풋**: 밑줄 스타일 (underline) 또는 filled 스타일, radius 12
- **BottomNavigationBar**: 배경 white, 아이콘 + 라벨, 선택 시 프라이머리 컬러
- **리스트 아이템**: 좌측 아이콘/썸네일 + 텍스트 + 우측 chevron, 세로 패딩 16
- **바텀시트**: radius 상단 24, 드래그 핸들 표시
- **로딩**: Shimmer 효과 (shimmer 패키지)

### 화면별 적용
- **법령 검색**: 상단 큰 SearchBar (filled 스타일) → 카드형 리스트 → 상세는 깔끔한 조문 뷰
- **등기 통계**: 상단 지역 선택 칩/드롭다운 → 큰 숫자 통계 카드 → 차트 카드
- **지도**: 풀스크린 지도 + 하단 플로팅 정보 카드

---

## 공통 요구사항

### 에러 핸들링
- Dio interceptor에서 공통 에러 처리
- 네트워크 미연결 시 안내 UI
- API 에러 코드별 분기 (400, 401, 500 등)

### 환경변수
- API 키는 `.env` 파일로 관리 (flutter_dotenv)
- `.env`는 `.gitignore`에 추가
- `.env.example` 파일 제공

```
# .env.example
LAW_API_KEY=your_law_api_key_here
REGISTRY_API_KEY=your_registry_api_key_here
NAVER_MAP_CLIENT_ID=your_naver_map_client_id_here
```

### 코드 컨벤션
- Dart 공식 스타일 가이드 준수
- `analysis_options.yaml`에 strict lint 설정
- freezed 모델 사용, `build_runner`로 코드 생성

### 테스트 (Optional)
- 우선순위 낮음. 핵심 기능 구현 완료 후 여유 있으면 작성
- 각 Repository에 대한 unit test
- API 통신은 mock 처리 (mocktail)

---

## 향후 본 프로젝트 연계

이 토이프로젝트에서 검증한 내용이 본 신탁 앱에 그대로 이어짐:

| 토이프로젝트 | 본 프로젝트 |
|-------------|-----------|
| 법령 API 통신 | 앱 내 법령 안내 기능 |
| 등기 통계 API | 등기부등본 실제 열람 (CODEF/법원 계약) |
| 네이버 지도 + 폴리곤 | 정비구역 지도 표시 |
| Dio + Repository 패턴 | 전체 API 레이어 재사용 |
| Riverpod 상태관리 | 전체 앱 상태관리 |
| 본인인증 (미구현) | 포트원 + NICE/다날 본인인증 |
| 투표 (미구현) | 재개발 찬반 투표 시스템 |
| 커뮤니티 (미구현) | 인증된 소유자 전용 커뮤니티 |

---

## 실행 순서

1. Flutter 프로젝트 생성
2. pubspec.yaml 의존성 추가
3. 프로젝트 구조 생성
4. core/network 레이어 구현 (Dio 클라이언트)
5. 탭1 법령 검색 구현 (API 통신 첫 연습)
6. 탭2 등기 통계 구현
7. 탭3 네이버 지도 구현
8. BottomNavigationBar로 3탭 통합
9. 에러 핸들링/로딩 상태 정리
10. (Optional) 테스트 작성

---

## 레퍼런스

### API 키 발급
- [국가법령정보센터 Open API](https://open.law.go.kr/LSO/main.do) — 회원가입 후 마이페이지에서 인증키 발급
- [등기정보광장 Open API](https://data.iros.go.kr) — 회원가입 후 인증키 발급
- [네이버 클라우드 플랫폼 Application](https://console.ncloud.com/naver-service/application) — Application 등록 후 Maps 활성화 → 클라이언트 ID 발급

### 기타
- [안드로이드 개발자가 빠르게 적용할 수 있는 Flutter 프로젝트 구성](https://dev.to/kingori/andeuroideu-gaebaljaga-bbareuge-jeogyonghal-su-issneun-flutter-peurojegteu-guseong-1n83)
