# @(#)cshrc 1.11 89/11/29 SMI 96/07/26 GJP 98/01/24 CPW <equus@astro>


setenv PATH .:${PATH}:~/bin/:/usr/local/idl7
source /usr/local/idl7/idl71/bin/idl_setup
setenv IDL_STARTUP /home/jianwei/startup.idl
setenv IDL_PATH :+/data2/home/jwlv/project/sdss^irs/mapping/soft/irs_cubism/

setenv IMPRO_DIR /data2/home/jwlv/mylib/impro-master
setenv IDL_PATH $IDL_PATH{:}+${IMPRO_DIR}/pro

alias smart '/home/jwlv/project/sdss^irs/hires/smart/smart/smart'

# sdss data directory
setenv SPECTRO_DATA /space/sdss/DR7

# Kcorrect http://howdy.physics.nyu.edu/index.php/Kcorrect

#setenv KCORRECT_DIR /data2/home/jwlv/mylib/kcorrect
#setenv PATH $KCORRECT_DIR/bin:$PATH
#setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:$KCORRECT_DIR/lib
#setenv IDL_PATH ${IDL_PATH}:+$KCORRECT_DIR/pro

#setenv IDL_PATH $IDL_PATH{:i}+${HOME}/mylib
#setenv LD_LIBRARY_PATH /import/astro/software/pgplot/v5.2.0/bin_solaris2.7
#setenv PGPLOT_DIR /import/astro/software/pgplot/v5.2.0/bin_solaris2.7

#if ( $?prompt ) then
#	set autologout=0
#        set currentuser=`whoami`
#	set currenthostalias=`hostname | cut -d. -f1`
#       	alias cd 'cd \!*;set prompt=" ! % ${currentuser}@${currenthostalias} %c> "'
#	limit coredumpsize 0
#       limit stacksize unlimited
#       cd `pwd`
#endif

# PG Fortran stuff
# The online manuals for the software package can be found in:
# /opt/local/pgi/linux86/5.2/doc/
# http://www.pgroup.com/doc/pghpf_ref/hpfwsr.htm
#setenv PGI /opt/local/pgi-x86_64
#set path = ( $PGI/linux86-64/5.2/bin $path /opt/local/iraf/irafbin/bin.redhat/)
#setenv LM_LICENSE_FILE $PGI/license.dat
#setenv MANPATH /usr/share/man:/usr/man:/usr/local/share/man:/usr/local/man:/usr/X11R6/man:/opt/local/man/:$PGI/linux86/5.2/man

# PGPLOT stuff
setenv LD_LIBRARY_PATH $HOME/libs/pgplot
setenv PGPLOT_DIR $HOME/libs/pgplot
setenv PGPLOT_DEV /xwin
setenv PGPLOT_FONT $HOME/libs/pgplot/grfont.dat

# NAG license key
#setenv NAG_KUSARI_FILE $HOME/libs/NAG21/license.lic   # Trial

# MPICH2 setting
#setenv PATH /home/shen/mpich2/bin:${PATH}

### My own setting ###
limit coredumpsize 0
setenv PRINTER prshen

# If you'd like to know your fortune?
#if (-x "`which fortune`" ) then
#echo " "
#fortune -s
#echo " "
#endif

source ~/.myaliases
# umask 022
set prompt = "%B%m%b%~@%t> "
setenv TERM xterm-color

setenv L $HOME/libs/lib11/
setenv P $HOME/libs/progs/
setenv B $HOME/libs/bin/


#echo "Directory: $cwd"
