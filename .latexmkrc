# $always_view_file_via_temporary = 0;
## Whether ps and pdf files are initially to be made in a temporary
## directory and then moved to the final location.   (This  applies
## to dvips, dvipdf, and ps2pdf operations, and the filtering oper-
## ators on dvi and ps files.   It  does  not  apply  to  pdflatex,
## unfortunately.)

## This use of a temporary file solves a problem that the making of
## these files can occupy a substantial time.   If  a  viewer  sees
## that  the  file has changed, it reads the new file, and this can
## cause havoc if the program writing the file has not yet finished
## its work.

## See the $pvc_view_file_via_temporary variable for a setting that
## applies only if preview-continuous mode (-pvc option)  is  used.
## See $tmpdir for the setting of the directory where the temporary
## file is created.


# $auto_rc_use = 1;
## Whether to automatically read the standard  initialization  (rc)
## files, which are the system RC file, the user's RC file, and the
## RC file in the current directory.  The command line option -norc
## can  be  used to turn this setting off.  Each RC file could also
## turn this setting off, i.e., it could set $auto_rc_use  to  zero
## to prevent automatic reading of the later RC files.

## This  variable does not affect the reading of RC files specified
## on the command line by the -r option.


# $aux_dir = "";
## The directory in which auxiliary files (aux, log, etc) are to be
## written  by  a  run of (pdf)latex.  If this variable is not set,
## but $out_dir is set, then $aux_dir is set to $out_dir, which  is
## the directory to which general output files are to be written.

## Important  note.   The  effect  of  $aux_dir,  if different from
## $out_dir, is achieved by given  (pdf)latex  the  -aux-directory.
## Currently  (Dec.  2011) this only works on the MiKTeX version of
## (pdf)latex.


# $banner = 0;
## If nonzero, the banner message is printed across each page  when
## converting  the  dvi  file to postscript.  Without modifying the
## variable $banner_message, this is equivalent to  specifying  the
## -d option.

## Note that if $banner is nonzero, the $postscript_mode is assumed
## and the postscript file is always generated, even if it is newer
## than the dvi file.

# $banner_intensity = 0.95;
## Equivalent to the -bi option, this is a decimal number between 0
## and 1 that specifies how dark to print the banner message. 0  is
## black, 1 is white.  The default is just right if your toner car-
## tridge isn't running too low.

# $banner_message = "DRAFT";
## The banner message to print across each page when converting the
## dvi file to postscript.  This is equivalent to the -bm option.

# $banner_scale = 220.0;
## A  decimal  number  that  specifies how large the banner message
## will be printed.  Experimentation is necessary to get the  right
## scale  for  your message, as a rule of thumb the scale should be
## about equal to 1100 divided by the number of characters  in  the
## message.   The  Default  is just right for 5 character messages.
## This is equivalent to the -bs option.

# @BIBINPUTS;
## This is an array variable, now mostly obsolete,  that  specifies
## directories  where  latexmk  should  look  for  .bib  files.  By
## default it is set from the BIBINPUTS environment variable of the
## operating  system.   If  that environment variable is not set, a
## single element list consisting of the current directory is  set.
## The format of the directory names depends on your operating sys-
## tem, of course.  Examples for setting this variable are:

##         @BIBINPUTS = ( ".", "C:\bibfiles" );
##         @BIBINPUTS = ( ".", "\\server\bibfiles" );
##         @BIBINPUTS = ( ".", "C:/bibfiles" );
##         @BIBINPUTS = ( ".", "//server/bibfiles" );
##         @BIBINPUTS = ( ".", "/usr/local/texmf/bibtex/bib" );

## Note that under MS Windows, either a  forward  slash  "/"  or  a
## backward  slash "\" can be used to separate pathname components,
## so the first two and the second  two  examples  are  equivalent.
## Each  backward slash should be doubled to avoid running afoul of
## Perl's rules for writing strings.

## Important note: This variable is now mostly  obsolete  in  the  current
## version of latexmk, since it has a better method of searching for files
## using the kpsewhich command.  However, if your system is an unusual one
## without the kpsewhich command, you may need to set the variable @BIBIN-
## PUTS.

# $biber = "biber %O %S";
## The biber processing program.

# $biber_silent_switch = "--onlylog";
## Switch(es) for the biber processing program when silent mode  is
## on.

# $bibtex = "bibtex %O %S";
## The BibTeX processing program.

# $bibtex_silent_switch = "-terse";
## Switch(es) for the BibTeX processing program when silent mode is
## on.

# $bibtex_use = 1;
## Under what conditions to run BibTeX or biber.  When latexmk dis-
## covers  from the log file that one (or more) BibTeX/biber-gener-
## ated bibliographies are used, it can run BibTeX or  biber  when-
## ever  it  appears  necessary  to regenerate the bbl file(s) from
## their source bib database file(s).

## But sometimes, the bib file(s) are not available  (e.g.,  for  a
## document  obtained  from an external archive), but the bbl files
## are provided.  In that case use of BibTeX or biber  will  result
## in  incorrect  overwriting of the precious bbl files.  The vari-
## able $bibtex_use controls whether this  happens.   Its  possible
## values are: 0: never use BibTeX or biber.  1: only use BibTeX or
## biber if the bib files exist.  2: run BibTeX or  biber  whenever
## it  appears  necessary  to update the bbl files, without testing
## for the existence of the bib files.

# $cleanup_includes_cusdep_generated = 0;
## If nonzero, specifies that cleanup also deletes files  that  are
## generated by custom dependencies.  (When doing a clean up, e.g.,
## by use of the -C option, custom dependencies are those listed in
## the .fdb_latexmk file from a previous run.)

# $cleanup_includes_generated = 0;
## If  nonzero,  specifies that cleanup also deletes files that are
## detected in log file as being generated (see the \openout  lines
## in  the  log  file).  It will also include files made from these
## first generation generated files.

# $cleanup_mode = 0;
## If nonzero, specifies cleanup mode: 1 for full  cleanup,  2  for
## cleanup  except  for dvi, ps and pdf files, 3 for cleanup except
## for dep and aux files.  (There is also extra cleaning as  speci-
## fied  by  the  $clean_ext,  $clean_full_ext  and @generated_exts
## variables.)

## This variable is equivalent to specifying one of the -c or -C  options.
## But there should be no need to set this variable from an RC file.

$clean_ext = "bbl nav out snm run.xml";
## Extra  extensions of files for latexmk to remove when any of the
## clean-up options (-c or -C) is  selected.   The  value  of  this
## variable  is  a  string  containing  the extensions separated by
## spaces.

## It is also possible to specify a more general pattern of file to
## be  deleted, by using the place holder %R, as in commands.  Thus
## setting

##    $clean_ext = "out %R-blx.bib";

## in an initialization file will imply that when a clean-up opera-
## tion  is  specified,  not  only  is  the  standard  set of files
## deleted, but also files of the  form  FOO.out  and  FOO-blx.bib,
## where  FOO  stands  for the basename of the file being processed
## (as in FOO.tex).


# $clean_full_ext = "";
## Extra extensions of files for latexmk  to  remove  when  the  -C
## option is selected, i.e., extensions of files to remove when the
## .dvi, etc files are to be cleaned-up.

# @cus_dep_list = ();
## Custom dependency list -- see section on "Custom  Dependencies".

@default_files = ("main.tex");
## Default list of files to be processed.

## Normally,  if  no  filenames  are specified on the command line,
## latexmk processes all tex files specified in the  @default_files
## variable,  which by default is set to all tex files ("*.tex") in
## the current directory.  This is a convenience: just run  latexmk
## and  it will process an appropriate set of files.  But sometimes
## you want only some of these files to be processed.  In this case
## you  set the @default_files in an initialization file (e.g., the
## file "latexmkrc" in the current directory).  Then  if  no  files
## are  specified on the command line then the files you specify by
## setting @default_files are processed.

## Three examples:

##      @default_files = ("paper_current");

##      @default_files = ("paper1", "paper2.tex");

##      @default_files = ("*.tex", "*.dtx");

## Note that more than file may be  given,  and  that  the  default
## extension  is  ".tex".  Wild cards are allowed.  The parentheses
## are  because  @default_files  is  an  array  variable,  i.e.,  a
## sequence of filename specifications is possible.

# $dependents_list = 0;
## Whether  to  display  a  list(s) of dependencies at the end of a
## run.

# $dvi_filter = empty;
## The dvi file filter to be run on the  newly  produced  dvi  file
## before  other  processing.   Equivalent  to  specifying  the -dF
## option.

# $dvi_mode = See below for default;
## If nonzero, generate a dvi version of the document.   Equivalent
## to the -dvi option.

## The  variable  $dvi_mode defaults to 0, but if no explicit requests are
## made for other types of file (postscript, pdf), then $dvi_mode will  be
## set  to  1.  In addition, if a request for a file for which a .dvi file
## is a prerequisite, then $dvi_mode will be set to 1.

# $dvi_previewer = "start xdvi %O %S" under UNIX;
## The command to invoke  a  dvi-previewer.   [Default  is  "start"
## under  MS-WINDOWS;  under  more recent versions of Windows, this
## will cause to be run whatever command the system has  associated
## with .dvi files.]

# $dvi_previewer_landscape = "start xdvi %O %S";
## The  command  to  invoke  a  dvi-previewer  in  landscape  mode.
## [Default is "start" under MS-WINDOWS; under more recent versions
## of  Windows, this will cause to be run whatever command the sys-
## tem has associated with .dvi files.]

# $dvipdf = "dvipdf %O %S %D";
## Command to convert dvi to pdf file.  A common reconfiguration is
## to  use the dvipdfm command, which needs its arguments in a dif-
## ferent order:

##      $dvipdf = "dvipdfm %O -o %D %S";

## WARNING: The default dvipdf  script  generates  pdf  files  with
## bitmapped fonts, which do not look good when viewed by acroread.
## That script should be modified to give  dvips  the  options  "-P
## pdf" to ensure that type 1 fonts are used in the pdf file.

# $dvips = "dvips %O -o %D %S";
## The  program to used as a filter to convert a .dvi file to a .ps
## file.  If pdf is going to be generated from pdf, then the  value
## of the $dvips_pdf_switch -- see below -- will be included in the
## options substituted for "%O".

# $dvips_landscape = "dvips -tlandscape %O -o %D %S";
## The program to used as a filter to convert a .dvi file to a  .ps
## file in landscape mode.

# $dvips_pdf_switch = "-P pdf";
## Switch(es)  for  dvips  program when pdf file is to be generated
## from ps file.

# $dvips_silent_switch = "-q";
## Switch(es) for dvips program when silent mode is on.

# $dvi_update_command = "";
## When the dvi previewer is set to be updated by  running  a  com-
## mand,  this is the command that is run.  See the information for
## the variable $dvi_update_method for further information, and see
## information  on  the  variable $pdf_update_method for an example
## for the analogous case of a pdf previewer.

# $dvi_update_method = 2 under UNIX, 1 under MS-Windows;
## How the dvi viewer updates its display when  the  dvi  file  has
## changed.     The    values    here    apply   equally   to   the
## $pdf_update_method and to the $ps_update_method variables.
##     0 => update is automatic,
##     1=> manual update by user, which may only mean a mouse click
## on the viewer's window or may mean a more serious action.
##     2  =>  Send  the  signal,  whose  number  is in the variable
## $dvi_update_signal.  The default value under  UNIX  is  suitable
## for xdvi.
##     3  => Viewer cannot do an update, because it locks the file.
## (As with acroread under MS-Windows.)
##     4 => run a command to do the update.  The command is  speci-
## fied by the variable $dvi_update_command.

## See  information on the variable $pdf_update_method for an exam-
## ple of updating by command.

# $dvi_update_signal = Under UNIX: SIGUSR1, which  is  a  system-dependent value;
## The number of the signal that is sent to the dvi viewer when  it
## is  updated  by  sending  a signal -- see the information on the
## variable $dvi_update_method.   The  default  value  is  the  one
## appropriate for xdvi on a UNIX system.

# $fdb_ext = "fdb_latexmk";
## The  extension  of the file which latexmk generates to contain a
## database of information on source files.  You will not  normally
## need to change this.

# $force_mode = 0;
## If  nonzero, continue processing past minor latex errors includ-
## ing unrecognized cross references.  Equivalent to specifying the
## -f option.

# @generated_exts  [(  aux  ,  bbl  , idx , ind , lof , lot , out , toc ,;
# $fdb_ext )];
## This  contains a list of extensions for files that are generated
## during a LaTeX run and that are read in by LaTeX in later  runs,
## either directly or indirectly.

## This  list  has  two  uses:  (a)  to set the kinds of file to be
## deleted in a cleanup operation (with the -c, -C, -CA, -g and -gg
## options),  and  (b)  in  the determination of whether a rerun of
## (pdf)LaTeX is needed after a run that gives an error.

## (Normally, a change of a source file during a run should provoke
## a  rerun.  This includes a file generated by LaTeX, e.g., an aux
## file, that is read in on subsequent runs.  But after a run  that
## results  in  an error, a new run should occur until the user has
## made a change in the files.  But the user may have corrected  an
## error in a source .tex file during the run.  So latexmk needs to
## distinguish user-generated and automatically generated files; it
## determines  the  automatically  generated  files  as  those with
## extensions in the list in @generated_exts.)

## A convenient way to add an extra extension to the list,  without
## losing  the already defined ones is to use a push command in the
## line in an RC file.  E.g.,

##                 push @generated_exts, "end";

## adds the extension "end" to the  list  of  predefined  generated
## extensions.   (This extension is used by the RevTeX package, for
## example.)
# $go_mode = 0;
## If nonzero, process files regardless of timestamps, and is  then
## equivalent to the -g option.

# %hash_calc_ignore_pattern;
## !!!This variable is for experts only!!!

## The  general rule latexmk uses for determining when an extra run
## of some program is needed is that one of the  source  files  has
## changed.   But  consider for example a latex package that causes
## an encapsulated postscript file (an "eps" file) to be made  that
## is  to  be read in on the next run.  The file contains a comment
## line giving its creation date and time.  On  the  next  run  the
## time  changes,  latex  sees  that  the eps file has changed, and
## therefore reruns latex.  This causes an infinite loop,  that  is
## only  terminated  becaues  latexmk  has a limit on the number of
## runs to guard against pathological situations.

## But the changing line has no real effect, since it is a comment.
## You can instruct latex to ignore the offending line as follows:

##    $hash_calc_ignore_pattern{'eps'} = '^%%CreationDate: ';

## This creates a rule for files with extension .eps about lines to
## ignore.  The left-hand side is a Perl idiom for setting an  item
## in  a hash.  Note that the file extension is specified without a
## period.  The value, on the right-hand side, is a string contain-
## ing  a  regular expresssion.  (See documentation on Perl for how
## they are to be specified in general.)  This  particular  regular
## expression  specifies that lines beginning with "%%CreationDate:
## " are to be ignored in deciding whether  a  file  of  the  given
## extension .eps has changed.

## There  is  only one regular expression available for each exten-
## sion.  If you need more one pattern to specify lines to  ignore,
## then  you  need  to  combine  the patterns into a single regular
## expression.  The simplest method is separate the different  sim-
## ple  patterns  by a vertical bar character (indicating "alterna-
## tion" in the jargon of regular expressions).  For example,

##    $hash_calc_ignore_pattern{'eps'}     =      '^%%CreationDate:
## |^%%Title: ';

## causes   lines  starting  with  either  "^%%CreationDate:  "  or
## "^%%Title: " to be ignored.

## It may happen that a pattern to be ignored is specified in,  for
## example,  in  a system or user initialization file, and you wish
## to remove this in a file read later.  To do this, you use perl's
## delete function, e.g.,

##     delete $hash_calc_ignore_pattern{'eps'};


# $kpsewhich = "kpsewhich %S";
## The  program  called to locate a source file when the name alone
## is not sufficient.  Most filenames used by latexmk  have  suffi-
## cient  path  information  to  be found directly.  But sometimes,
## notably when .bib files are found from the log file of a  bibtex
## or  biber  run, the name of the file, but not its path is known.
## The program specified by $kpsewhich is used to find it.

## See also the @BIBINPUTS variable for another  way  that  latexmk
## also uses to try to locate files; it applies only in the case of
## .bib files.

# $landscape_mode = 0;
## If nonzero, run in landscape mode, using the landscape mode pre-
## viewers  and dvi to postscript converters.  Equivalent to the -l
## option.  Normally not needed with current previewers.

# $latex = "latex %O %S";
## The LaTeX processing program.  Note that as with other programs,
## you  can  use  this  variable not just to change the name of the
## program used, but also specify options to the program.  E.g.,

##                     $latex = "latex --src-specials";

# %latex_input_extensions;
## This variable specifies the extensions tried by latexmk when  it
## finds  that a LaTeX run resulted in an error that a file has not
## been found, and the file is given without  an  extension.   This
## typically  happens  when LaTeX commands of the form \input{file}
## or \includegraphics{figure}, when the relevant source file  does
## not exist.

## In  this  situation, latexmk searches for custom dependencies to
## make the missing file(s), but restricts  it  to  the  extensions
## specified  by the variable %latex_input_extensions.  The default
## extensions are 'tex' and 'eps'.

## (For Perl experts: %latex_input_extensions is a hash whose  keys
## are  the  extensions.   The values are irrelevant.)  Two subrou-
## tines are provided for manipulating this and the  related  vari-
## able      %pdflatex_input_extensions,      add_input_ext     and
## remove_input_ext.  They are used as in  the  following  examples
## are possible lines in an initialization file:

##     remove_input_ext( 'latex', 'tex' );

## removes the extension 'tex' from latex_input_extensions

##     add_input_ext( 'latex', 'asdf' );

## add  the  extension 'asdf to latex_input_extensions.  (Naturally
## with such an extension, you should have made an appropriate cus-
## tom dependency for latexmk, and should also have done the appro-
## priate programming in the LaTeX source file to enable  the  file
## to  be  read.   The standard extensions are handled by LaTeX and
## its graphics/graphicx packages.


# $latex_silent_switch = "-interaction=batchmode";
## Switch(es) for the LaTeX processing program when silent mode  is
## on.
## If  you  use MikTeX, you may prefer the results if you configure
## the options to include -c-style-errors, e.g., by  the  following
## line in an initialization file

##   $latex_silent_switch   =   "-interaction=batchmode   -c-style-
## errors";


# $lpr = "lpr %O %S" under UNIX/LINUX, "NONE lpr" under MS-WINDOWS;
## The command to print postscript files.

## Under MS-Windows (unlike UNIX/LINUX), there is no standard  pro-
## gram for printing files.  But there are ways you can do it.  For
## example, if you have gsview installed, you could use it with the
## option "/p":

##     $lpr = '"c:/Program Files/Ghostgum/gsview/gsview32.exe" /p';

## If gsview is installed in a different directory, you  will  need
## to  make the appropriate change.  Note the combination of single
## and double quotes around the name.  The  single  quotes  specify
## that  this is a string to be assigned to the configuration vari-
## able $lpr.  The double quotes are part of the string  passed  to
## the  operating  system to get the command obeyed; this is neces-
## sary because one part of the command name ("Program Files") con-
## tains a space which would otherwise be misinterpreted.

# $lpr_dvi = "NONE lpr_dvi";
## The printing program to print dvi files.

# $lpr_pdf = "NONE lpr_pdf";
## The printing program to print pdf files.

## Under  MS-Windows  you  could  set  this to use gsview, if it is
## installed, e.g.,

##     $lpr = '"c:/Program Files/Ghostgum/gsview/gsview32.exe" /p';

## If  gsview  is installed in a different directory, you will need
## to make the appropriate change.  Note the double  quotes  around
## the name: this is necessary because one part of the command name
## ("Program Files") contains a space which would otherwise be mis-
## interpreted.


# $make = "make";
## The make processing program.


# $makeindex = "makeindex %O -o %D %S";
## The index processing program.

# $max_repeat = 5;
## The  maximum  number  of  times  latexmk will run latex/pdflatex
## before deciding that there may be an infinite loop and  that  it
## needs to bail out, rather than rerunning latex/pdflatex again to
## resolve cross-references, etc.  The  default  value  covers  all
## normal cases.
## (Note  that  the  "etc"  covers  a lot of cases where one run of
## latex/pdflatex generates files to be read in on a later run.)

# $new_viewer_always = 0;
## This variable applies  to  latexmk  only  in  continuous-preview
## mode.  If $new_viewer_always is 0, latexmk will check for a pre-
## viously running previewer on the same file, and if one  is  run-
## ning  will  not  start a new one.  If $new_viewer_always is non-
## zero, this check will be skipped, and latexmk will behave as  if
## no viewer is running.


$out_dir = "build";
## The  directory  in which output files are to be written by a run
## of (pdf)latex.  See also the variable $aux_dir.

## The effect of this variable is achieved by  using  the  -output-
## directory  option  of (pdf)latex.  This exists in the usual cur-
## rent (Dec. 2011) implementations, i.e., MiKTeX and TeXLive.  But
## it may not be present in other versions.



$pdf_mode = 2;
## If  zero,  do  NOT  generate  a pdf version of the document.  If
## equal to 1, generate a pdf version of the document using  pdfla-
## tex.  If equal to 2, generate a pdf version of the document from
## the ps file, by using the command specified by the $ps2pdf vari-
## able.   If  equal  to  3, generate a pdf version of the document
## from the dvi file, by using the command specified by the $dvipdf
## variable.

## Equivalent to the -pdf-, -pdf, -pdfdvi, -pdfps options.

# $pdflatex = "pdflatex %O %S";
## The  LaTeX  processing  program  in the version that makes a pdf
## file instead of a dvi file.

# %pdflatex_input_extensions;
## This variable specifies the extensions tried by latexmk when  it
## finds  that  a pdfLaTeX run resulted in an error that a file has
## not been found, and the file  is  given  without  an  extension.
## This   typically   happens  when  LaTeX  commands  of  the  form
## \input{file}  or  \includegraphics{figure},  when  the  relevant
## source file does not exist.

## In  this  situation, latexmk searches for custom dependencies to
## make the missing file(s), but restricts  it  to  the  extensions
## specified   by  the  variable  %pdflatex_input_extensions.   The
## default extensions are 'tex', 'pdf', 'jpg, and 'png'.

## (For Perl experts: %pdflatex_input_extensions is  a  hash  whose
## keys  are the extensions.  The values are irrelevant.)  Two sub-
## routines are provided for  manipulating  this  and  the  related
## variable      %latex_input_extensions,     add_input_ext     and
## remove_input_ext.  They are used as in  the  following  examples
## are possible lines in an initialization file:

##     remove_input_ext( 'pdflatex', 'tex' );

## removes the extension 'tex' from pdflatex_input_extensions

##     add_input_ext( 'pdflatex', 'asdf' );

## add  the  extension  'asdf to pdflatex_input_extensions.  (Natu-
## rally with such an extension, you should have made an  appropri-
## ate custom dependency for latexmk, and should also have done the
## appropriate programming in the LaTeX source file to  enable  the
## file  to be read.  The standard extensions are handled by pdfla-
## tex and its graphics/graphicx packages.)


# $pdflatex_silent_switch = "-interaction=batchmode";
## Switch(es) for the pdflatex program (specified in  the  variable
## $pdflatex when silent mode is on.

## If  you  use MikTeX, you may prefer the results if you configure
## the options to include -c-style-errors, e.g., by  the  following
## line in an initialization file

##   $latex_silent_switch   =   "-interaction=batchmode   -c-style-
## errors";


# $pdf_previewer = "start acroread %O %S";
## The command to invoke a pdf-previewer.  [Default is  changed  to
## "start"  on  MS-WINDOWS;  under more recent versions of Windows,
## this will cause to be run whatever command the system has  asso-
## ciated with .pdf files.]

## WARNING: Potential problem under MS-Windows: if acroread is used
## as the pdf previewer, and it is actually viewing a pdf file, the
## pdf file cannot be updated.  Thus makes acroread a bad choice of
## previewer if you use latexmk's previous-continuous mode  (option
## -pvc)   under  MS-windows.   This  problem  does  not  occur  if
## ghostview, gv or gsview is used to view pdf files.

# $pdf_update_command = "";
## When the pdf previewer is set to be updated by  running  a  com-
## mand,  this is the command that is run.  See the information for
## the variable $pdf_update_method.

# $pdf_update_method = 1 under UNIX, 3 under MS-Windows;
## How the pdf viewer updates its display when  the  pdf  file  has
## changed.  See the information on the variable $dvi_update_method
## for the codes.  (Note that information needs be changed slightly
## so  that for the value 4, to run a command to do the update, the
## command is specified by the  variable  $pdf_update_command,  and
## for  the  value  2,  to  specify update by signal, the signal is
## specified by $pdf_update_signal.)

## Note that acroread under MS-Windows (but not UNIX) locks the pdf
## file, so the default value is then 3.

## Arranging to use a command to get a previewer explicitly updated
## requires three variables to be set.  For example:

##     $pdf_previewer = "start xpdf -remote %R %O %S";
##     $pdf_update_method = 4;
##     $pdf_update_command = "xpdf -remote %R -reload";

## The first setting arranges for the xpdf program to  be  used  in
## its  "remote server mode", with the server name specified as the
## rootname of the TeX  file.   The  second  setting  arranges  for
## updating to be done in response to a command, and the third set-
## ting sets the update command.


# $pdf_update_signal = Under UNIX: SIGHUP,  which  is  a  system-dependent value;
## The number of the signal that is sent to the pdf viewer when  it
## is  updated  by  sending  a signal -- see the information on the
## variable $pdf_update_method.   The  default  value  is  the  one
## appropriate for gv on a UNIX system.

# $pid_position[1 under UNIX, -1 under MS-Windows];
## The  variable  $pid_position  is  used  to specify which word in
## lines of the output from $pscmd corresponds to the  process  ID.
## The  first word in the line is numbered 0.  The default value of
## 1 (2nd word in line) is correct for Solaris 2.6 and Linux.  Set-
## ting  the  variable to -1 is used to indicate that $pscmd is not
## to be used.

# $postscript_mode = 0;
## If nonzero, generate  a  postscript  version  of  the  document.
## Equivalent to the -ps option.

## If  some  other  request is made for which a postscript file is needed,
## then $postscript_mode will be set to 1.

# $preview_continuous_mode = 0;
## If nonzero, run a previewer to view the document,  and  continue
## running latexmk to keep .dvi up-to-date.  Equivalent to the -pvc
## option.  Which previewer is run depends on the  other  settings,
## see the command line options -view=, and the variable $view.

# $preview_mode = 0;
## If nonzero, run a previewer to preview the document.  Equivalent
## to the -pv option.  Which previewer is run depends on the  other
## settings,  see the command line options -view=, and the variable
## $view.

# $printout_mode = 0;
## If nonzero, print the document using lpr.  Equivalent to the  -p
## option.  This is recommended not to be set from an RC file, oth-
## erwise you could waste lots of paper.

# $print_type =  ["ps";
## Type of file  to  printout:  possibilities  are  "dvi",  "none",
## "pdf", or "ps".

# $pscmd Command used to get all the processes currently run by the user.;
## The -pvc option uses  the  command  specified  by  the  variable
## $pscmd  to  determine  if there is an already running previewer,
## and to find the process ID (needed if latexmk  needs  to  signal
##  the previewer about file changes).

## Each line of the output of this command is assumed to correspond
## to one process.  See the $pid_position variable for how the pro-
## cess number is determined.

## The  default  for  pscmd  is  "NONE" under MS-Windows and cygwin
## (i.e.,  the  command  is  not  used),  "ps  --width  200  -f  -u
## $ENV{USER}"  under  linux,  "ps  -ww -u $ENV{USER}" under darwin
## (Macintosh OS-X), and "ps -f -u $ENV{USER}" under other  operat-
## ing  systems (including other flavors of UNIX).  In these speci-
## fications "$ENV{USER}" is substituted by the username.

# $ps2pdf = "ps2pdf %O %S %D";
## Command to convert ps to pdf file.

# $ps_filter = empty;
## The postscript file filter to  be  run  on  the  newly  produced
## postscript file before other processing.  Equivalent to specify-
## ing the -pF option.

# $ps_previewer = "start gv %O %S", but "start %O %S" under MS-WINDOWS;
## The command to invoke a ps-previewer.  (The  default  under  MS-
## WINDOWS  will  cause  to  be run whatever command the system has
## associated with .ps files.)

## Note that gv could be used with the -watch  option  updates  its
## display  whenever the postscript file changes, whereas ghostview
## does not.  However, different versions of gv have slightly  dif-
## ferent  ways  of  writing  this  option.  You can configure this
## variable apppropriately.

## WARNING: Linux systems may have installed one (or more) versions
## of  gv  under  different  names, e.g., ggv, kghostview, etc, but
## perhaps not one called gv.

# $ps_previewer_landscape = "start gv -swap %O  %S",  but  "start  %O  %S" under MS-WINDOWS;
## The command to invoke a ps-previewer in landscape mode.

# $ps_update_command = "";
## When the postscript previewer is set to be updated by running  a
## command,  this  is the command that is run.  See the information
## for the variable $ps_update_method.

# $ps_update_method = 0 under UNIX, 1 under MS-Windows;
## How the postscript viewer updates its display when the  ps  file
## has    changed.    See   the   information   on   the   variable
## $dvi_update_method for the codes.  (Note that information  needs
## be changed slightly so that for the value 4, to run a command to
## do  the  update,  the  command  is  specified  by  the  variable
## $ps_update_command,  and  for  the value 2, to specify update by
## signal, the signal is specified by $ps_update_signal.)


# $ps_update_signal = Under UNIX:  SIGHUP,  which  is  a  system-dependent value;
## The number of the signal that is sent to the pdf viewer when  it
## is  updated  by  sending a signal -- see $ps_update_method.  The
## default value is the one appropriate for gv on a UNIX system.


# $pvc_view_file_via_temporary = 1;
## The same as $always_view_file_via_temporary, except that it only
## applies in preview-continuous mode (-pvc option).


# $quote_filenames = 1;
## This specifies whether substitutions for placeholders in command
## specifications  (as  in  $pdflatex)  are  surrounded  by  double
## quotes.   If this variable is 1 (or any other value Perl regards
## as true), then quoting is done.  Otherwise quoting is omitted.

## The quoting method used by latexmk is tested to  work  correctly  under
## UNIX  systems  (including Linux and Mac OS-X) and under MS-Windows.  It
## allows the use of  filenames  containing  special  characters,  notably
## spaces.  (But note that many versions of LaTeX and PdfLaTeX cannot cor-
## rectly deal with TeX files whose names contain spaces.  Latexmk's quot-
## ing only ensures that such filenames are correctly treated by the oper-
## ating system in passing arguments to programs.)

# $recorder = 0;
## Whether to use the -recorder option to latex and  pdflatex.  Use
## of  this option results in a file of extension .fls containing a
## list of the files that these programs  have  read  and  written.
## Latexmk  will  then  use  this  file to improve its detection of
## source files and generated files after a run of latex or  pdfla-
## tex.

## It  is generally recommended to use this option (or to configure
## the $recorder  variable  to  be  on.)   But  it  only  works  if
## (pdf)latex supports the -recorder option, which is true for most
## current implementations

## Note about the name of the .fls file:  Most  implementations  of
## (pdf)latex  produce  an  .fls file with the same basename as the
## main document's LaTeX, e.g., for Document.tex, the .fls file  is
## Document.fls.   However,  some  implementations  instead produce
## files named for the program, i.e.,  latex.fls  or  pdflatex.fls.
## In  this  second  case,  latexmk  copies the latex.fls or pdfla-
## tex.fls to a file with the basename of the main LaTeX  document,
## e.g., Document.fls.


# $search_path_separator = See below for default;
## The character separating paths in the environment variables TEX-
## INPUTS, BIBINPUTS, and BSTINPUTS.  This variable is mainly  used
## by  latexmk when the -outdir, -output-directory, -auxdir, and/or
## -aux-directory options are used.  In that case latexmk needs  to
## communicate  appropriately  modified  search  paths  to $bibtex,
## dvipdf, dvips, and (pdf)latex.

## [Comment to technically savvy readers: (pdf)latex doesn't  actu-
## ally  need  the  modified  search  path,  because it corrects it
## internally.  But, surprisingly, dvipdf  and  dvips  do,  because
## sometimes  graphics  files  get  generated  in the output or aux
## directories.]

## The default under MSWin and Cygwin is ';'  and  under  UNIX-like
## operating  systems  (including Linux and OS-X) is ':'.  Normally
## the defaults give correct behavior.  But there can be  difficul-
## ties  if  your operating system is of one kind, but some of your
## software is running under an emulator  for  the  other  kind  of
## operating  system;  in that case you'll need to find out what is
## needed, and set $search_path_separator  explicitly.   (The  same
## goes,  of  course, for unusual operating systems that are not in
## the MSWin, Linux, OS-X, Unix collection.)


# $sleep_time = 2;
## The time to sleep (in seconds) between checking for source  file
## changes when running with the -pvc option.  This is subject to a
## minimum of one second delay, except  that  zero  delay  is  also
## allowed.

## A  value  of  exactly 0 gives no delay, and typically results in
## 100% CPU usage, which may not be desirable.

# $texfile_search = "";
## This is an obsolete variable,  replaced  by  the  @default_files
## variable.

## For   backward   compatibility,  if  you  choose  to  set  $tex-
## file_search, it is a string of  space-separated  filenames,  and
## then latexmk replaces @default_files with the filenames in $tex-
## file_search to which is added "*.tex".

# $tmpdir = See below for default;
## Directory to store temporary files  that  latexmk  may  generate
## while running.

## The  default  under  MSWindows  (including  cygwin),  is  to set
## $tmpdir to the value of the first of  whichever  of  the  system
## environment  variables  TMPDIR  or TEMP exists, otherwise to the
## current directory.  Under other operating systems  (expected  to
## be  UNIX/Linux, including OS-X), the default is the value of the
## system environment  variable  TMPDIR  if  it  exists,  otherwise
## "/tmp".

# $use_make_for_missing_files = 0;
## Whether to use make to try and make files that are missing after
## a run of latex or pdflatex, and for which  a  custom  dependency
## has  not been found.  This is generally useful only when latexmk
## is used as part of a bigger project which is built by using  the
## make program.

## Note that once a missing file has been made, no further calls to
## make will be made on a subsequent run of latexmk to  update  the
## file.   Handling  this  problem is the job of a suitably defined
## Makefile.  See the section "USING latexmk WITH make" for how  to
## do  this.   The intent of calling make from latexmk is merely to
## detect dependencies.

# $view = "default";
## Which kind of file is to be previewed if a  previewer  is  used.
## The  possible  values  are  "default",  "dvi", "ps", "pdf".  The
## value of "default" means that the "highest" of the kinds of file
## generated is to be used (among dvi, ps and pdf).
