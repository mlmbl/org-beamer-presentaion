#!/usr/bin/env perl
$pdf_mode = 4;  # lualatexを使うための設定
$lualatex = 'lualatex %O -synctex=1 -interaction=nonstopmode -halt-on-error %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars';
$makeindex = 'mendex %O -o %D %S';
$max_repeat = 5;

# クリーンアップ対象ファイルの拡張子
$clean_ext = 'aux bbl bcf blg idx ind lof lot out toc gz';

# ログ出力の簡略化
$silence_logfile_warnings = 1;
