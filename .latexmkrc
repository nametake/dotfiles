#!/usr/bin/perl
#$latex         = 'platex %O %S';
#$bibtex        = 'pbibtex %O %B';
#$dvipdf        = 'dvipdfmx %O %S';
#$pdf_mode      = 3; # use dvipdf

$latex            = 'platex -synctex=1';
$latex_silent     = 'platex -synctex=1 -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode      = 3; # generates pdf via dvipdfmx
