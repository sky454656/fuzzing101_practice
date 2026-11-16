# Fuzzing101 Practice

Fuzzing101 실습에서 작성한 설정·스크립트와 생성한 퍼징 결과를 보관한 저장소입니다. 원본 라이브러리 소스와 라이브러리 파일은 포함하지 않았습니다.

## 폴더 구조

| 위치 | 내용 |
|---|---|
| [fuzzing_gimp/](fuzzing_gimp/) | GIMP 실습 설정 및 딕셔너리 |
| [fuzzing_libtiff/](fuzzing_libtiff/) | LibTIFF 실습 문서, Docker 설정, 실행 스크립트 |
| [fuzzing_libxml2/](fuzzing_libxml2/) | Libxml2 실습 딕셔너리 |
| [fuzzing_tcpdump/](fuzzing_tcpdump/) | TCPdump BOOTP 실습 문서, 실행 스크립트, 재현 PCAP |
| [fuzzing_vlc/](fuzzing_vlc/) | VLC 실습 문서, Docker 설정, Makefile |
| [artifacts/](artifacts/) | 프로젝트별 실습 입력, out 전체, 크래시, hang, 커버리지, 설정·로그를 담은 압축본 |
| [build-executables/](build-executables/) | 퍼징을 위해 빌드한 실행 파일 압축본. 공유·정적 라이브러리와 헤더는 제외 |

Libexif와 Xpdf 실습 자료는 최상위 별도 폴더 대신 artifacts/와 build-executables/의 프로젝트별 압축본에서 찾을 수 있습니다.

## 압축본 사용

artifacts/와 build-executables/의 파일명은 실습 프로젝트 이름에 대응합니다. 압축을 풀면 원래의 fuzzing/ 하위 경로가 보존됩니다.

크기 때문에 나눈 Libexif 산출물과 LibTIFF 실행 파일은 WSL 또는 Linux에서 다음과 같이 합칩니다.

```bash
cat artifacts/fuzzing_libexif.tar.gz.part-* > fuzzing_libexif.tar.gz
cat build-executables/fuzzing_libtiff.tar.gz.part-* > fuzzing_libtiff-build.tar.gz
```

각 압축본의 파일 수와 복원용 SHA-256은 [산출물 안내](artifacts/README.md)와 [빌드 실행 파일 안내](build-executables/README.md)를 참고하세요.

## 범위

- AFL/AFL++ 크래시 입력과 hang 입력은 원시 퍼징 결과입니다. 파일 수가 곧 확인된 취약점 수를 뜻하지 않습니다.
- 빌드 실행 파일은 빌드 증빙용입니다. 실행에 필요한 원본 라이브러리 파일은 포함되지 않아 단독으로 실행되지 않을 수 있습니다.
- 원본 라이브러리 소스, 다운로드한 원본 소스 압축 파일, Git 메타데이터, 디버거 명령 기록은 제외했습니다.
