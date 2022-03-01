---
layout: post
title: "Building Kaldi with MacPorts"
date: 2022-02-27
---

*Last updated: 2022-03-01*

Introduction
------------

This post contains instructions for building the Kaldi programs and libraries
on macOS[^linux] assuming you are using MacPorts as your package manager.
Currently, there are two methods for building Kaldi. The first one uses a set
of bash scripts and Makefiles, while the second, newer one is based on CMake.
While the Kaldi documentation states that the CMake method is not as well
tested and some features are missing currently, I chose this route for a couple
of reasons:

- The old build process is not robust enough to detect the presence of OpenBLAS
  installed using MacPorts, and suggests that the user download the Intel MKL
  library.
- The old build process builds the programs and libraries within the source
  tree, which makes it harder to generate different variants of the build, and
  also makes it harder to clean up build outputs. In contrast, CMake supports
  *out-of-source* builds, which overcome these limitations.


Prerequisites
-------------

You will need CMake, OpenFST, and wget. You can install both with MacPorts:

```bash
sudo port install cmake openfst wget
```

Steps
-----

First, clone the Kaldi repo and `cd` into it.

```bash
git clone https://github.com/kaldi-asr/kaldi
cd kaldi
```

Since we will use the MacPorts-provided OpenFST distribution, we don't need to
install it from source within the Kaldi project - comment out the following
line in `kaldi/CMakeLists.txt`:

```cmake
include(cmake/third_party/openfst.cmake)
```

Then, add the following lines below it:

```cmake
include_directories("/opt/local/include")
link_directories("/opt/local/lib")
```

The lines above will tell CMake to add `/opt/local/include` as a place for the
compiler to look for header files, and `/opt/local/lib` as a place for the
compiler to look for libraries to link to the Kaldi programs[^macports-note].

Then, you can run the following commands to build the Kaldi programs and
libraries.

```bash
mkdir -p build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=dist
make -j install
```

The default value for `CMAKE_INSTALL_PREFIX` is `/usr/local`, but we change it
by setting the option `-DCMAKE_INSTALL_PREFIX=dist`, which tells CMake to
set the output directory for the compiled programs and libraries to the
`dist` folder (i.e., `kaldi/build/dist`, if your current working directory is
`build`).

You will need to modify your `PATH` environment variable in order to run the
test scripts. If you've been following the instructions so far, you can run
this command to append the location of the Kaldi binaries to your `PATH`:

```bash
export PATH=$PATH:<path_to_kaldi>/build/dist/bin
```

In the above, you would replace `<path_to_kaldi>` with the path to your local
clone of the `kaldi` repository.

This will tell your shell to look in the `kaldi/build/dist/bin` folder for the Kaldi
programs. If you want this setting to persist across terminal sessions, then
you should add the line to your `~/.bash_profile`.

You can then run the `yesno` example to see if Kaldi was built successfully.
To do so, `cd` into the `kaldi/egs/yesno/s5` folder and run the following
command:

```bash
./run.sh
```

Here is the output you should get:

```bash
--2022-03-01 13:41:02--  http://www.openslr.org/resources/1/waves_yesno.tar.gz
Resolving www.openslr.org (www.openslr.org)... 46.101.158.64
Connecting to www.openslr.org (www.openslr.org)|46.101.158.64|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://us.openslr.org/resources/1/waves_yesno.tar.gz [following]
--2022-03-01 13:41:03--  https://us.openslr.org/resources/1/waves_yesno.tar.gz
Resolving us.openslr.org (us.openslr.org)... 46.101.158.64
Connecting to us.openslr.org (us.openslr.org)|46.101.158.64|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4703754 (4.5M) [application/x-gzip]
Saving to: ‘waves_yesno.tar.gz’

     0K .......... .......... .......... .......... ..........  1%  158K 29s
    50K .......... .......... .......... .......... ..........  2%  321K 21s
   100K .......... .......... .......... .......... ..........  3% 16.2M 14s
   150K .......... .......... .......... .......... ..........  4% 23.7M 10s
   200K .......... .......... .......... .......... ..........  5%  301K 11s
   250K .......... .......... .......... .......... ..........  6% 18.4M 9s
   300K .......... .......... .......... .......... ..........  7% 53.8M 8s
   350K .......... .......... .......... .......... ..........  8% 16.8M 7s
   400K .......... .......... .......... .......... ..........  9%  330K 7s
   450K .......... .......... .......... .......... .......... 10% 18.9M 7s
   500K .......... .......... .......... .......... .......... 11% 18.5M 6s
   550K .......... .......... .......... .......... .......... 13% 31.6M 5s
   600K .......... .......... .......... .......... .......... 14% 28.8M 5s
   650K .......... .......... .......... .......... .......... 15% 18.1M 5s
   700K .......... .......... .......... .......... .......... 16% 39.2M 4s
   750K .......... .......... .......... .......... .......... 17% 24.1M 4s
   800K .......... .......... .......... .......... .......... 18%  347K 4s
   850K .......... .......... .......... .......... .......... 19% 16.8M 4s
   900K .......... .......... .......... .......... .......... 20% 35.3M 4s
   950K .......... .......... .......... .......... .......... 21% 24.3M 3s
  1000K .......... .......... .......... .......... .......... 22% 22.7M 3s
  1050K .......... .......... .......... .......... .......... 23% 28.7M 3s
  1100K .......... .......... .......... .......... .......... 25% 24.8M 3s
  1150K .......... .......... .......... .......... .......... 26% 14.3M 3s
  1200K .......... .......... .......... .......... .......... 27% 30.8M 3s
  1250K .......... .......... .......... .......... .......... 28% 25.7M 2s
  1300K .......... .......... .......... .......... .......... 29% 44.9M 2s
  1350K .......... .......... .......... .......... .......... 30% 23.7M 2s
  1400K .......... .......... .......... .......... .......... 31% 29.9M 2s
  1450K .......... .......... .......... .......... .......... 32% 38.4M 2s
  1500K .......... .......... .......... .......... .......... 33% 27.4M 2s
  1550K .......... .......... .......... .......... .......... 34% 20.7M 2s
  1600K .......... .......... .......... .......... .......... 35%  378K 2s
  1650K .......... .......... .......... .......... .......... 37% 26.7M 2s
  1700K .......... .......... .......... .......... .......... 38% 14.9M 2s
  1750K .......... .......... .......... .......... .......... 39% 54.9M 2s
  1800K .......... .......... .......... .......... .......... 40% 24.4M 2s
  1850K .......... .......... .......... .......... .......... 41% 22.3M 2s
  1900K .......... .......... .......... .......... .......... 42% 23.9M 2s
  1950K .......... .......... .......... .......... .......... 43% 24.0M 1s
  2000K .......... .......... .......... .......... .......... 44% 51.0M 1s
  2050K .......... .......... .......... .......... .......... 45% 26.3M 1s
  2100K .......... .......... .......... .......... .......... 46% 23.6M 1s
  2150K .......... .......... .......... .......... .......... 47% 26.7M 1s
  2200K .......... .......... .......... .......... .......... 48% 23.4M 1s
  2250K .......... .......... .......... .......... .......... 50% 28.9M 1s
  2300K .......... .......... .......... .......... .......... 51% 36.5M 1s
  2350K .......... .......... .......... .......... .......... 52% 22.3M 1s
  2400K .......... .......... .......... .......... .......... 53% 26.5M 1s
  2450K .......... .......... .......... .......... .......... 54% 22.6M 1s
  2500K .......... .......... .......... .......... .......... 55% 51.6M 1s
  2550K .......... .......... .......... .......... .......... 56% 9.13M 1s
  2600K .......... .......... .......... .......... .......... 57% 57.2M 1s
  2650K .......... .......... .......... .......... .......... 58% 8.61M 1s
  2700K .......... .......... .......... .......... .......... 59% 37.7M 1s
  2750K .......... .......... .......... .......... .......... 60% 15.3M 1s
  2800K .......... .......... .......... .......... .......... 62% 57.7M 1s
  2850K .......... .......... .......... .......... .......... 63% 59.0M 1s
  2900K .......... .......... .......... .......... .......... 64% 49.0M 1s
  2950K .......... .......... .......... .......... .......... 65% 29.1M 1s
  3000K .......... .......... .......... .......... .......... 66% 74.4M 1s
  3050K .......... .......... .......... .......... .......... 67% 54.6M 1s
  3100K .......... .......... .......... .......... .......... 68% 50.8M 1s
  3150K .......... .......... .......... .......... .......... 69% 33.7M 1s
  3200K .......... .......... .......... .......... .......... 70% 52.5M 0s
  3250K .......... .......... .......... .......... .......... 71% 56.1M 0s
  3300K .......... .......... .......... .......... .......... 72%  484K 0s
  3350K .......... .......... .......... .......... .......... 74% 24.6M 0s
  3400K .......... .......... .......... .......... .......... 75% 30.1M 0s
  3450K .......... .......... .......... .......... .......... 76% 22.7M 0s
  3500K .......... .......... .......... .......... .......... 77% 36.4M 0s
  3550K .......... .......... .......... .......... .......... 78% 29.3M 0s
  3600K .......... .......... .......... .......... .......... 79% 3.70M 0s
  3650K .......... .......... .......... .......... .......... 80% 23.8M 0s
  3700K .......... .......... .......... .......... .......... 81% 24.4M 0s
  3750K .......... .......... .......... .......... .......... 82% 34.9M 0s
  3800K .......... .......... .......... .......... .......... 83% 29.3M 0s
  3850K .......... .......... .......... .......... .......... 84% 22.9M 0s
  3900K .......... .......... .......... .......... .......... 85% 35.0M 0s
  3950K .......... .......... .......... .......... .......... 87% 21.9M 0s
  4000K .......... .......... .......... .......... .......... 88% 30.7M 0s
  4050K .......... .......... .......... .......... .......... 89% 35.2M 0s
  4100K .......... .......... .......... .......... .......... 90% 21.5M 0s
  4150K .......... .......... .......... .......... .......... 91% 33.5M 0s
  4200K .......... .......... .......... .......... .......... 92% 22.6M 0s
  4250K .......... .......... .......... .......... .......... 93% 31.9M 0s
  4300K .......... .......... .......... .......... .......... 94% 23.2M 0s
  4350K .......... .......... .......... .......... .......... 95% 31.5M 0s
  4400K .......... .......... .......... .......... .......... 96% 28.1M 0s
  4450K .......... .......... .......... .......... .......... 97% 26.4M 0s
  4500K .......... .......... .......... .......... .......... 99% 26.8M 0s
  4550K .......... .......... .......... .......... ...       100% 28.8M=1.3s

2022-03-01 13:41:05 (3.35 MB/s) - ‘waves_yesno.tar.gz’ saved [4703754/4703754]

x waves_yesno/
x waves_yesno/1_0_0_0_0_0_1_1.wav
x waves_yesno/1_1_0_0_1_0_1_0.wav
x waves_yesno/1_0_1_1_1_1_0_1.wav
x waves_yesno/1_1_1_1_0_1_0_0.wav
x waves_yesno/0_0_1_1_1_0_0_0.wav
x waves_yesno/0_1_1_1_1_1_1_1.wav
x waves_yesno/0_1_0_1_1_1_0_0.wav
x waves_yesno/1_0_1_1_1_0_1_0.wav
x waves_yesno/1_0_0_1_0_1_1_1.wav
x waves_yesno/0_0_1_0_1_0_0_0.wav
x waves_yesno/0_1_0_1_1_0_1_0.wav
x waves_yesno/0_0_1_1_0_1_1_0.wav
x waves_yesno/1_0_0_0_1_0_0_1.wav
x waves_yesno/1_1_0_1_1_1_1_0.wav
x waves_yesno/0_0_1_1_1_1_0_0.wav
x waves_yesno/1_1_0_0_1_1_1_0.wav
x waves_yesno/0_0_1_1_0_1_1_1.wav
x waves_yesno/1_1_0_1_0_1_1_0.wav
x waves_yesno/0_1_0_0_0_1_1_0.wav
x waves_yesno/0_0_0_1_0_0_0_1.wav
x waves_yesno/0_0_1_0_1_0_1_1.wav
x waves_yesno/0_0_1_0_0_0_1_0.wav
x waves_yesno/1_1_0_1_1_0_0_1.wav
x waves_yesno/0_1_1_1_0_1_0_1.wav
x waves_yesno/0_1_1_1_0_0_0_0.wav
x waves_yesno/README~
x waves_yesno/0_1_0_0_0_1_0_0.wav
x waves_yesno/1_0_0_0_0_0_0_1.wav
x waves_yesno/1_1_0_1_1_0_1_1.wav
x waves_yesno/1_1_0_0_0_0_0_1.wav
x waves_yesno/1_0_0_0_0_0_0_0.wav
x waves_yesno/0_1_1_1_1_0_1_0.wav
x waves_yesno/0_0_1_1_0_1_0_0.wav
x waves_yesno/1_1_1_0_0_0_0_1.wav
x waves_yesno/1_0_1_0_1_0_0_1.wav
x waves_yesno/0_1_0_0_1_0_1_1.wav
x waves_yesno/0_0_1_1_1_1_1_0.wav
x waves_yesno/1_1_0_0_0_1_1_1.wav
x waves_yesno/0_1_1_1_0_0_1_0.wav
x waves_yesno/1_1_0_1_0_1_0_0.wav
x waves_yesno/1_1_1_1_1_1_1_1.wav
x waves_yesno/0_0_1_0_1_0_0_1.wav
x waves_yesno/1_1_1_1_0_0_1_0.wav
x waves_yesno/0_0_1_1_1_0_0_1.wav
x waves_yesno/0_1_0_1_0_0_0_0.wav
x waves_yesno/1_1_1_1_1_0_0_0.wav
x waves_yesno/README
x waves_yesno/0_1_1_0_0_1_1_1.wav
x waves_yesno/0_0_1_0_0_1_1_0.wav
x waves_yesno/1_1_0_0_1_0_1_1.wav
x waves_yesno/1_1_1_0_0_1_0_1.wav
x waves_yesno/0_0_1_0_0_1_1_1.wav
x waves_yesno/0_0_1_1_0_0_0_1.wav
x waves_yesno/1_0_1_1_0_1_1_1.wav
x waves_yesno/1_1_1_0_1_0_1_0.wav
x waves_yesno/1_1_1_0_1_0_1_1.wav
x waves_yesno/0_1_0_0_1_0_1_0.wav
x waves_yesno/1_1_1_0_0_1_1_1.wav
x waves_yesno/0_1_1_0_0_1_1_0.wav
x waves_yesno/0_0_0_1_0_1_1_0.wav
x waves_yesno/1_1_1_1_1_1_0_0.wav
x waves_yesno/0_0_0_0_1_1_1_1.wav
Preparing train and test data
Dictionary preparation succeeded
utils/prepare_lang.sh --position-dependent-phones false data/local/dict <SIL> data/local/lang data/lang
Checking data/local/dict/silence_phones.txt ...
--> reading data/local/dict/silence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict/silence_phones.txt is OK

Checking data/local/dict/optional_silence.txt ...
--> reading data/local/dict/optional_silence.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict/optional_silence.txt is OK

Checking data/local/dict/nonsilence_phones.txt ...
--> reading data/local/dict/nonsilence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict/nonsilence_phones.txt is OK

Checking disjoint: silence_phones.txt, nonsilence_phones.txt
--> disjoint property is OK.

Checking data/local/dict/lexicon.txt
--> reading data/local/dict/lexicon.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict/lexicon.txt is OK

Checking data/local/dict/extra_questions.txt ...
--> data/local/dict/extra_questions.txt is empty (this is OK)
--> SUCCESS [validating dictionary directory data/local/dict]

**Creating data/local/dict/lexiconp.txt from data/local/dict/lexicon.txt
fstaddselfloops data/lang/phones/wdisambig_phones.int data/lang/phones/wdisambig_words.int 
prepare_lang.sh: validating output directory
utils/validate_lang.pl data/lang
Checking existence of separator file
separator file data/lang/subword_separator.txt is empty or does not exist, deal in word case.
Checking data/lang/phones.txt ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/lang/phones.txt is OK

Checking words.txt: #0 ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/lang/words.txt is OK

Checking disjoint: silence.txt, nonsilence.txt, disambig.txt ...
--> silence.txt and nonsilence.txt are disjoint
--> silence.txt and disambig.txt are disjoint
--> disambig.txt and nonsilence.txt are disjoint
--> disjoint property is OK

Checking sumation: silence.txt, nonsilence.txt, disambig.txt ...
--> found no unexplainable phones in phones.txt

Checking data/lang/phones/context_indep.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1 entry/entries in data/lang/phones/context_indep.txt
--> data/lang/phones/context_indep.int corresponds to data/lang/phones/context_indep.txt
--> data/lang/phones/context_indep.csl corresponds to data/lang/phones/context_indep.txt
--> data/lang/phones/context_indep.{txt, int, csl} are OK

Checking data/lang/phones/nonsilence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 2 entry/entries in data/lang/phones/nonsilence.txt
--> data/lang/phones/nonsilence.int corresponds to data/lang/phones/nonsilence.txt
--> data/lang/phones/nonsilence.csl corresponds to data/lang/phones/nonsilence.txt
--> data/lang/phones/nonsilence.{txt, int, csl} are OK

Checking data/lang/phones/silence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1 entry/entries in data/lang/phones/silence.txt
--> data/lang/phones/silence.int corresponds to data/lang/phones/silence.txt
--> data/lang/phones/silence.csl corresponds to data/lang/phones/silence.txt
--> data/lang/phones/silence.{txt, int, csl} are OK

Checking data/lang/phones/optional_silence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1 entry/entries in data/lang/phones/optional_silence.txt
--> data/lang/phones/optional_silence.int corresponds to data/lang/phones/optional_silence.txt
--> data/lang/phones/optional_silence.csl corresponds to data/lang/phones/optional_silence.txt
--> data/lang/phones/optional_silence.{txt, int, csl} are OK

Checking data/lang/phones/disambig.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 2 entry/entries in data/lang/phones/disambig.txt
--> data/lang/phones/disambig.int corresponds to data/lang/phones/disambig.txt
--> data/lang/phones/disambig.csl corresponds to data/lang/phones/disambig.txt
--> data/lang/phones/disambig.{txt, int, csl} are OK

Checking data/lang/phones/roots.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 3 entry/entries in data/lang/phones/roots.txt
--> data/lang/phones/roots.int corresponds to data/lang/phones/roots.txt
--> data/lang/phones/roots.{txt, int} are OK

Checking data/lang/phones/sets.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 3 entry/entries in data/lang/phones/sets.txt
--> data/lang/phones/sets.int corresponds to data/lang/phones/sets.txt
--> data/lang/phones/sets.{txt, int} are OK

Checking data/lang/phones/extra_questions.{txt, int} ...
Checking optional_silence.txt ...
--> reading data/lang/phones/optional_silence.txt
--> data/lang/phones/optional_silence.txt is OK

Checking disambiguation symbols: #0 and #1
--> data/lang/phones/disambig.txt has "#0" and "#1"
--> data/lang/phones/disambig.txt is OK

Checking topo ...

Checking word-level disambiguation symbols...
--> data/lang/phones/wdisambig.txt exists (newer prepare_lang.sh)
Checking data/lang/oov.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1 entry/entries in data/lang/oov.txt
--> data/lang/oov.int corresponds to data/lang/oov.txt
--> data/lang/oov.{txt, int} are OK

--> data/lang/L.fst is olabel sorted
--> data/lang/L_disambig.fst is olabel sorted
--> SUCCESS [validating lang directory data/lang]
Preparing language models for test
arpa2fst --disambig-symbol=#0 --read-symbol-table=data/lang_test_tg/words.txt input/task.arpabo data/lang_test_tg/G.fst 
LOG (arpa2fst[5.5]:Read():lm/arpa-file-parser.cc:94) Reading \data\ section.
LOG (arpa2fst[5.5]:Read():lm/arpa-file-parser.cc:149) Reading \1-grams: section.
LOG (arpa2fst[5.5]:RemoveRedundantStates():lm/arpa-lm-compiler.cc:359) Reduced num-states from 1 to 1
fstisstochastic data/lang_test_tg/G.fst 
1.20397 1.20397
Succeeded in formatting data.
steps/make_mfcc.sh --nj 1 data/train_yesno exp/make_mfcc/train_yesno mfcc
utils/validate_data_dir.sh: Successfully validated data-directory data/train_yesno
steps/make_mfcc.sh: [info]: no segments file exists: assuming wav.scp indexed by utterance.
steps/make_mfcc.sh: Succeeded creating MFCC features for train_yesno
steps/compute_cmvn_stats.sh data/train_yesno exp/make_mfcc/train_yesno mfcc
Succeeded creating CMVN stats for train_yesno
fix_data_dir.sh: kept all       31 utterances.
fix_data_dir.sh: old files are kept in data/train_yesno/.backup
steps/make_mfcc.sh --nj 1 data/test_yesno exp/make_mfcc/test_yesno mfcc
utils/validate_data_dir.sh: Successfully validated data-directory data/test_yesno
steps/make_mfcc.sh: [info]: no segments file exists: assuming wav.scp indexed by utterance.
steps/make_mfcc.sh: It seems not all of the feature files were successfully procesed (      29 !=       31); consider using utils/fix_data_dir.sh data/test_yesno
steps/make_mfcc.sh: Less than 95% the features were successfully generated. Probably a serious error.
steps/compute_cmvn_stats.sh data/test_yesno exp/make_mfcc/test_yesno mfcc
Succeeded creating CMVN stats for test_yesno
fix_data_dir.sh: kept       29 utterances out of       31
fix_data_dir.sh: old files are kept in data/test_yesno/.backup
steps/train_mono.sh --nj 1 --cmd utils/run.pl --totgauss 400 data/train_yesno data/lang exp/mono0a
steps/train_mono.sh: Initializing monophone system.
steps/train_mono.sh: Compiling training graphs
steps/train_mono.sh: Aligning data equally (pass 0)
steps/train_mono.sh: Pass 1
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 2
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 3
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 4
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 5
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 6
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 7
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 8
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 9
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 10
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 11
steps/train_mono.sh: Pass 12
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 13
steps/train_mono.sh: Pass 14
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 15
steps/train_mono.sh: Pass 16
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 17
steps/train_mono.sh: Pass 18
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 19
steps/train_mono.sh: Pass 20
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 21
steps/train_mono.sh: Pass 22
steps/train_mono.sh: Pass 23
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 24
steps/train_mono.sh: Pass 25
steps/train_mono.sh: Pass 26
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 27
steps/train_mono.sh: Pass 28
steps/train_mono.sh: Pass 29
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 30
steps/train_mono.sh: Pass 31
steps/train_mono.sh: Pass 32
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 33
steps/train_mono.sh: Pass 34
steps/train_mono.sh: Pass 35
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 36
steps/train_mono.sh: Pass 37
steps/train_mono.sh: Pass 38
steps/train_mono.sh: Aligning data
steps/train_mono.sh: Pass 39
steps/diagnostic/analyze_alignments.sh --cmd utils/run.pl data/lang exp/mono0a
steps/diagnostic/analyze_alignments.sh: see stats in exp/mono0a/log/analyze_alignments.log
4 warnings in exp/mono0a/log/update.*.log
exp/mono0a: nj=1 align prob=-81.81 over 0.05h [retry=0.0%, fail=0.0%] states=11 gauss=372
steps/train_mono.sh: Done training monophone system in exp/mono0a
tree-info exp/mono0a/tree 
tree-info exp/mono0a/tree 
fsttablecompose data/lang_test_tg/L_disambig.fst data/lang_test_tg/G.fst 
fstminimizeencoded 
fstdeterminizestar --use-log=true 
fstpushspecial 
fstisstochastic data/lang_test_tg/tmp/LG.fst 
0.534295 0.533859
[info]: LG not stochastic.
fstcomposecontext --context-size=1 --central-position=0 --read-disambig-syms=data/lang_test_tg/phones/disambig.int --write-disambig-syms=data/lang_test_tg/tmp/disambig_ilabels_1_0.int data/lang_test_tg/tmp/ilabels_1_0.73784 data/lang_test_tg/tmp/LG.fst 
fstisstochastic data/lang_test_tg/tmp/CLG_1_0.fst 
0.534295 0.533859
[info]: CLG not stochastic.
make-h-transducer --disambig-syms-out=exp/mono0a/graph_tgpr/disambig_tid.int --transition-scale=1.0 data/lang_test_tg/tmp/ilabels_1_0 exp/mono0a/tree exp/mono0a/final.mdl 
fstdeterminizestar --use-log=true 
fsttablecompose exp/mono0a/graph_tgpr/Ha.fst data/lang_test_tg/tmp/CLG_1_0.fst 
fstrmsymbols exp/mono0a/graph_tgpr/disambig_tid.int 
fstrmepslocal 
fstminimizeencoded 
fstisstochastic exp/mono0a/graph_tgpr/HCLGa.fst 
0.5342 -0.000375572
HCLGa is not stochastic
add-self-loops --self-loop-scale=0.1 --reorder=true exp/mono0a/final.mdl exp/mono0a/graph_tgpr/HCLGa.fst 
steps/decode.sh --nj 1 --cmd utils/run.pl exp/mono0a/graph_tgpr data/test_yesno exp/mono0a/decode_test_yesno
decode.sh: feature type is delta
steps/diagnostic/analyze_lats.sh --cmd utils/run.pl exp/mono0a/graph_tgpr exp/mono0a/decode_test_yesno
steps/diagnostic/analyze_lats.sh: see stats in exp/mono0a/decode_test_yesno/log/analyze_alignments.log
Overall, lattice depth (10,50,90-percentile)=(1,1,2) and mean=1.1
steps/diagnostic/analyze_lats.sh: see stats in exp/mono0a/decode_test_yesno/log/analyze_lattice_depth_stats.log
local/score.sh --cmd utils/run.pl data/test_yesno exp/mono0a/graph_tgpr exp/mono0a/decode_test_yesno
local/score.sh: scoring with word insertion penalty=0.0,0.5,1.0
%WER 0.00 [ 0 / 232, 0 in , 0 del, 0  ub ] exp/mono0a/decode_te t_ye no/wer_10_0.0
```

There are a couple of ominous lines in the above output:

```
steps/make_mfcc.sh: It seems not all of the feature files were successfully procesed (      29 !=       31); consider using utils/fix_data_dir.sh data/test_yesno
steps/make_mfcc.sh: Less than 95% the features were successfully generated. Probably a serious error.
```

However, my sense is that these are not reflective of errors in compiling the
Kaldi programs and libraries, but rather with either the example scripts or the
test data (let me know if I'm wrong!)

Note that these instructions are accurate as of the date of writing this post
(2022-02-27). These hacks may not be needed for future versions of Kaldi.

[^linux]: Though I have not tried this out, I think the instructions here will
transfer pretty well to a Linux distro (e.g., Ubuntu), with the `port install` commands replaced by
calls to the distro's package manager (e.g., `apt`).

[^macports-note]: `/opt/local` is the default installation prefix for MacPorts.
If you chose a different installation prefix, then substitute that for
`/opt/local`.
