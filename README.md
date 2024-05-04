# custom-overlay-fmod
FMODのcore APIをvcpkgのcustom overlayとして使えるようにするレポジトリ。

## Install
1. [FMOD](https://www.fmod.com/download)をダウンロード、解凍。
2. 任意のディレクトリに、vcpkgのcustom overlay用のディレクトリを作成。<br>
  `mkdir custom-overlay && cd custom-overlay`
4. 本プロジェクトをgit cloneする。<br>
  `git clone https://github.com/kdr250/custom-overlay-fmod.git fmod`
5. 解凍したFMODのファイルを所定の位置にコピーする。<br>
  FMOD Programmers API/api/core/inc内のファイルを、このプロジェクトのinclude内にコピー。<br>
  FMOD Programmers API/api/core/lib内のファイルを、このプロジェクトのlib内にコピー。
6. 最終的に以下のようなディレクトリ構成になる。
<pre>
.
└── custom-overlay
    └── fmod
        ├── include
            ├── fmod_codec.h
            ├── fmod_common.h
            ├── fmod_dsp_effects.h
            ├── fmod_dsp.cs
            ├── fmod_dsp.h
            ├── fmod_errors.cs
            ├── fmod_errors.h
            ├── fmod_output.h
            ├── fmod.cs
            ├── fmod.h
            └── fmod.hpp 
        ├── lib
            ├── libfmod.dylib ※Macの場合
            ├── fmod.dll ※Windowsの場合
            └── fmod_vc.lib ※Windowsの場合
        ├── fmod-config.cmake
        ├── LICENSE
        ├── portfile.cmake
        ├── usage
        └── vcpkg.json
</pre>
７. vcpkgでインストールする。(triplet指定などは適宜指定すること)<br>
```
vcpkg install fmod --overlay-ports=Your/Path/To/custom-overlay
```

8. 以下のusageが表示されればインストールできたはず。<br>
<pre>
find_package(FMOD REQUIRED)
target_link_libraries(main PRIVATE FMOD::FMOD)
</pre>

9. あとはFMODを使いたいプロジェクトのCMakeLists.txtでfind_packageすれば良い。
10. FMOD Studio APIも使いたい場合は[custom-overlay-fmod-studio](https://github.com/kdr250/custom-overlay-fmod-studio)もインストールすること。

## 参考にしたURL
[チュートリアル: vcpkg を使用してライブラリをパッケージ化する](https://learn.microsoft.com/ja-jp/vcpkg/get_started/get-started-packaging?pivots=shell-bash)<br>
[What's a simple straightforward find_package set of files for CMake](https://stackoverflow.com/questions/73830279/whats-a-simple-straightforward-find-package-set-of-files-for-cmake)
