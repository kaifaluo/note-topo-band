<TeXmacs|1.99.13>

<style|<tuple|generic|chinese>>

<\body>
  <section|1D Free Electron>

  <subsection|1D Spinless s-band>

  Consider an 1D spinless free electron <math|\<cal-H\><rsub|1d>=<frac|\<hbar\><rsup|2>k<rsup|2>|2m>-\<mu\>>
  maintaining time-reversal symmetry <math|<wide|T|^>=<wide|K|^>> and spatial
  inversion symmetry(SIS) <math|<wide|P|^>=<wide|1|^>>, and its Fermi wave
  vectors are <math|\<pm\>k<rsub|F>>. Note that no TA phonons here. Construct
  a mean-field Hamiltonian having electron and electron-LA phonon coupling
  included:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<cal-H\><rsub|D
    W>=>|<cell|\<cal-H\><rsub|1d><around*|(|k+k<rsub|F>|)>\<oplus\>\<cal-H\><rsub|1d><around*|(|k-k<rsub|F>|)>+<wide|\<cal-H\>|\<bar\>><rsub|e-ph>>|<cell|>>|<row|<cell|=>|<cell|<around*|(|<tabular*|<tformat|<table|<row|<cell|<frac|\<hbar\><rsup|2><around*|(|k+k<rsub|F>|)><rsup|2>|2m>-\<mu\>>|<cell|D<rsub|1d><around*|(|\<b-k\>|)>V<rsub|q>q\<cdot\><around*|\<langle\>|<wide|\<b-X\>|^><rsub|L,q>|\<rangle\>>>>|<row|<cell|\<dagger\>>|<cell|<frac|\<hbar\><rsup|2><around*|(|k-k<rsub|F>|)><rsup|2>|2m>-\<mu\>>>>>>|)>>|<cell|,<eq-number>>>>>
  </eqnarray*>

  where representations of TRS and SIS are
  <math|<wide|T|^>=\<mu\><rsub|1><wide|K|^>> and
  <math|<wide|P|^>=\<mu\><rsub|1>>, respectively. Constrained by TRS, only
  one lowest-order term is left:

  <\equation>
    D<rsub|1d>= g<rsub|0>+o<around*|(|<with|font-series|bold|k>|)>,
  </equation>

  which is exactly mean-field electron-phonon coupling from the deformation
  potential approximation.\ 

  <subsection|1D Spinful s-band>

  Pick up the spin degree of freedom back, on the basis
  <math|\<Psi\>=<around*|(|<around*|\||\<uparrow\>|\<rangle\>>,<around*|\||\<downarrow\>|\<rangle\>>,<around*|\||\<uparrow\>|\<rangle\>>,<around*|\||\<downarrow\>|\<rangle\>>|)><rsup|T>>,
  the Hamiltonian density in mean-field level is

  <\eqnarray*>
    <tformat|<cwith|1|1|2|2|cell-halign|l>|<table|<row|<cell|<wide|\<cal-H\>|~><rsub|D
    W>=>|<cell|\<sigma\><rsub|0>\<cal-H\><rsub|1d><around*|(|k+k<rsub|F>|)>\<oplus\>\<sigma\><rsub|0>\<cal-H\><rsub|1d><around*|(|k-k<rsub|F>|)>+<wide|\<cal-H\>|\<bar\>><rsub|e-ph>>|<cell|>>|<row|<cell|=>|<cell|<around*|(|<tabular*|<tformat|<table|<row|<cell|\<sigma\><rsub|0><around*|[|<frac|\<hbar\><rsup|2><around*|(|k+k<rsub|F>|)><rsup|2>|2m>-\<mu\>|]>>|<cell|<wide|D|~><rsub|1d><around*|(|\<b-k\>|)>V<rsub|q>q\<cdot\><around*|\<langle\>|<wide|\<b-X\>|^><rsub|L,q>|\<rangle\>>>>|<row|<cell|\<dagger\>>|<cell|\<sigma\><rsub|0><around*|[|<frac|\<hbar\><rsup|2><around*|(|k-k<rsub|F>|)><rsup|2>|2m>-\<mu\>|]>>>>>>|)>>|<cell|,<eq-number>>>>>
  </eqnarray*>

  which have <math|<wide|<wide|T|~>|^>=\<mu\><rsub|x><around*|(|i\<sigma\><rsub|y><wide|K|^>|)>>,
  <math|<wide|<wide|P|~>|^>=\<mu\><rsub|x>\<sigma\><rsub|0>>, and
  <math|<wide|C|^><rsub|\<infty\>>> along <math|z>-axis. Then only one
  lowest-order term allowed by symmetries is:

  <\equation>
    <wide|D|~><rsub|1d>=g<rsub|0>\<sigma\><rsub|0>
  </equation>

  Note that <math|\<sigma\><rsub|x>> and <math|\<sigma\><rsub|y>> are not
  allowed since there is no transverse phonon in 1D system if only
  electron-phonon interaction considered here. Longitudinal acoustic phonon
  modes do not carry angular momentum, and are unable to couple with
  electrons with different spins.

  <subsection|1D Spinless s&p-band>

  The well know SSH model is <math|<with|font|cal|H><rsub|SSH>=>

  \;

  \;

  <section|3D Free Electron>

  Consider a 3D spinful free electron with electron-phonon coupling term

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<cal-H\><rsub|3d>=>|<cell|<frac|\<hbar\><rsup|2>|2m><around*|(|<tabular*|<tformat|<table|<row|<cell|<around*|[|<with|font-series|bold|k><rsub|\<perp\>><rsup|2>+<around*|(|k<rsub|z>+k<rsub|F>|)><with|font-series|bold|><rsup|2>|]><rsup|>\<sigma\><rsub|0>>|<cell|>>|<row|<cell|>|<cell|<around*|[|<with|font-series|bold|k><rsub|\<perp\>><rsup|2>+<around*|(|k<rsub|z>-k<rsub|F>|)><with|font-series|bold|><rsup|2>|]><rsup|>\<sigma\><rsub|0>>>>>>|)>-\<mu\>+<wide|\<cal-H\>|\<bar\>><rsub|e-ph>>|<cell|<eq-number>>>>>
  </eqnarray*>

  If constrained by <math|<wide|T|^>=<wide|\<mu\>|^><rsub|x><around*|(|i<wide|\<sigma\>|^><rsub|y><wide|K|^>|)>>,
  <math|<wide|P|^>=<wide|\<mu\>|^><rsub|x><wide|\<sigma\>|^><rsub|x>> and
  <math|<wide|C|^><rsub|\<infty\>><rsub|>> along <math|z>-axis, only one
  symmetry-perserved term\ 

  <\equation>
    D<rsub|3d,L>=g<rsub|0>\<sigma\><rsub|0>
  </equation>

  left is able to couple states with the same spin, originated from LA
  phonons. It is also consistant with the Kramers' theorem that the degenracy
  of two states with spin up and spin down is protected by TRS.\ 

  However, if a chiral phonon is possible to couple with electrons,
  <math|<wide|C|^><rsub|\<infty\>><rsub|>> must be broken and
  <math|<wide|T|^>> is also should be broken to allow the existence of
  non-zero angular momentum of phonon. Apply a magnetic field
  <math|<around*|(|0,0,B|)>>, its magnetic Hamiltonian under trial
  wavefunction basis {<math|<around*|\||n|\<rangle\>>>,<math|<around*|\||n|\<rangle\>>,<around*|\||n|\<rangle\>>,<around*|\||n|\<rangle\>>>}
  is

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<cal-H\><rsub|e,3d>=>|<cell|<frac|\<hbar\><rsup|2>|2m><around*|(|<tabular*|<tformat|<table|<row|<cell|<around*|[|<frac|2|l<rsub|B><rsup|2>>n+<around*|(|k<rsub|z>+k<rsub|F>|)><rsup|2>|]>\<sigma\><rsub|0>>|<cell|0>>|<row|<cell|0>|<cell|<around*|[|<frac|2|l<rsub|B><rsup|2>>n+<around*|(|k<rsub|z>-k<rsub|F>|)><rsup|2>|]>\<sigma\><rsub|0>>>>>>|)>-\<mu\>>|<cell|,<eq-number>>>>>
  </eqnarray*>

  Beyond quantum limit, effectively only the zeroth landau bands matter, so
  we have:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<cal-H\><rsub|3d><rsup|<around*|(|0|)>>=>|<cell|<frac|\<hbar\><rsup|2>|2m><around*|(|<tabular*|<tformat|<table|<row|<cell|<around*|[|<around*|(|k<rsub|z>+k<rsub|F>|)><rsup|2>-\<mu\>|]>\<sigma\><rsub|0>>|<cell|>>|<row|<cell|>|<cell|<around*|[|<around*|(|k<rsub|z>-k<rsub|F>|)><rsup|2>-\<mu\>|]>\<sigma\><rsub|0>>>>>>|)>+<wide|\<cal-H\>|\<bar\>><rsub|e-ph><rsup|<around*|(|0|)>>>|<cell|.<eq-number>>>>>
  </eqnarray*>

  and coupling between chiral-phonon and electrons is

  <\eqnarray*>
    <tformat|<table|<row|<cell|D<rsub|3d,T>=>|<cell|g<rsub|1>\<sigma\><rsub|1>+g<rsub|2>\<sigma\><rsub|2>>|<cell|<eq-number>>>>>
  </eqnarray*>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.3|1>>
    <associate|auto-5|<tuple|2|1>>
    <associate|auto-6|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>1D
      Free Electron> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>1D Spinless s-band
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>1D Spinful s-band
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>1D Spinless s&p-band
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>3D
      Free Electron> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>