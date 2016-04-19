project: MPMD-with-Coarray-Fortran-Load-Balancing-Example-Program
project_dir: ./src
output_dir: ./doc/html/publish/
project_github: https://github.com/MichaelSiehl/MPMD-with-Coarray-Fortran-Load-Balancing-Example-Program
summary: MPMD-style Fortran (2008) coarray example program to illustrate a simple PGAS load balancing technique
author: Michael Siehl
github: https://github.com/MichaelSiehl
email: miesiehl@gmail.com
md_extensions: markdown.extensions.toc(anchorlink=True)
               markdown.extensions.smarty(smart_quotes=False)
               markdown.extensions.extra
               markdown_checklist.extension
docmark: <
display: public
         protected
         private
source: true
warn: true
graph: true
extra_mods: iso_fortran_env:https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fFORTRAN_005fENV.html
