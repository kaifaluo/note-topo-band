<TeXmacs|1.99.13>

<style|<tuple|generic|british>>

<\body>
  <doc-data|<doc-title|CDW in ZrTe5>|<doc-author|<\author-data|<author-name|Kaifa
  Luo>>
    \;
  </author-data>>|<doc-date|<date>>>

  The coupling term for electrons and LA phonons is

  <\eqnarray*>
    <tformat|<cwith|2|2|2|2|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<cwith|3|3|2|2|cell-halign|l>|<cwith|1|1|2|2|cell-halign|l>|<table|<row|<cell|<wide|H|^><rsub|e-ph,L>=>|<cell|<big|sum><rsub|\<b-k\><rsub|>>g<rsub|L>V<rsub|q<rsub|z>>q<rsub|z><around*|[|<wide|X|^><rsub|L,q<rsub|z>><wide|C|^>
    <rsup|\<dagger\>><rsub|\<b-k\>+<frac|q<rsub|z>|2><with|font-series|bold|e><rsub|z>><wide|C|^><rsub|\<b-k\>-<frac|q<rsub|z>|2><with|font-series|bold|e><rsub|z>>+h.c.|]>>|<cell|>>|<row|<cell|=>|<cell|<big|sum><rsub|\<b-k\><rsub|>><around*|[|g<rsub|L>V<rsub|q<rsub|z>>q<rsub|z><sqrt|<frac|N<rsub|ion>\<hbar\>|2M\<omega\><rsub|q<rsub|z>>>>|]><around*|[|<around*|(|<wide|b|^><rsub|L,q<rsub|z>>+<wide|b|^><rsup|\<dagger\>><rsub|L,-q<rsub|z>>|)><wide|C|^>
    <rsup|\<dagger\>><rsub|\<b-k\>+<frac|q<rsub|z>|2><with|font-series|bold|e><rsub|z>><wide|C|^><rsub|\<b-k\>-<frac|q<rsub|z>|2><with|font-series|bold|e><rsub|z>>+h.c.|]>>|<cell|<eq-number>>>|<row|<cell|\<equiv\>>|<cell|<big|sum><rsub|<with|font-series|bold|k>>\<alpha\><rsub|L,q<rsub|z>><around*|[|<around*|(|<wide|b|^><rsub|L,q<rsub|z>>+<wide|b|^><rsub|L,-q<rsub|z>><rsup|\<dagger\>>|)><wide|C|^>
    <rsup|\<dagger\>><rsub|\<b-k\>+<frac|q<rsub|z>|2><with|font-series|bold|e><rsub|z>><wide|C|^><rsub|\<b-k\>-<frac|q<rsub|z>|2><with|font-series|bold|e><rsub|z>>+h.c.|]>>|<cell|>>>>
  </eqnarray*>

  where we used <math|<wide|X|^><rsub|L><around*|(|q<rsub|z>|)>=<around*|(|\<hbar\>/2\<rho\>\<omega\><rsub|q<rsub|z>>|)><rsup|<frac|1|2>><around*|(|<wide|b|^><rsub|q<rsub|z>>+<wide|b|^><rsup|\<dagger\>><rsub|-q<rsub|z>>|)>>,
  and

  <\equation>
    \<alpha\><rsub|L,q>=<sqrt|<frac|N<rsub|ion>\<hbar\>|2M\<omega\><rsub|L,q>>>q
    V<rsub|q>
  </equation>

  and

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|H|^><rsub|e-ph,L>=>|<cell|<big|sum><rsub|\<b-k\><rsub|>>\<Delta\><rsub|L><wide|C|^>
    <rsup|\<dagger\>><rsub|\<b-k\>+<frac|q<rsub|z>|2><with|font-series|bold|e><rsub|z>><wide|C|^><rsub|\<b-k\>-<frac|q<rsub|z>|2><with|font-series|bold|e><rsub|z>>+h.c.>|<cell|,>>|<row|<cell|\<Delta\><rsub|L>=>|<cell|g<rsub|L><sqrt|<frac|2N<rsub|ion>\<hbar\>|M
    v<rsub|s,L>q<rsub|z>>><frac|-Z e<rsup|2>|\<epsilon\><around*|(|q<rsub|z><rsup|2>+\<kappa\><rsup|2>|)>>q<rsub|z><around*|\<langle\>|<wide|b|^><rsub|L,q<rsub|z>>|\<rangle\>>>|<cell|>>|<row|<cell|\<rightarrow\><around*|\<langle\>|<wide|b|^><rsub|L,q<rsub|z>>|\<rangle\>>=>|<cell|<around*|[|g<rsub|L><sqrt|<frac|2N<rsub|ion>\<hbar\>|M
    v<rsub|s,L>q<rsub|z>>><frac|-Z e<rsup|2>|\<epsilon\><around*|(|q<rsub|z><rsup|2>+\<kappa\><rsup|2>|)>>q<rsub|z>|]><rsup|-1>\<Delta\><rsub|L>>|<cell|.>>>>
  </eqnarray*>

  The mean-field Hamiltonian reads,

  <\equation>
    <wide|<wide|H|\<bar\>>|^><rsub|e-ph,L><rsup|>=<big|sum><rsub|<with|font-series|bold|k>><around*|\||\<Delta\>|\|><around*|(|e<rsup|i\<phi\>><wide|d|^><rsub|<with|font-series|bold|k>+k<rsub|F><with|font-series|bold|e><rsub|z>><wide|<with|font-series|bold|d>|^><rsub|<with|font-series|bold|k>-k<rsub|F><with|font-series|bold|e><rsub|z>>+h.c.|)>
  </equation>

  where <math|\<Delta\>=<around*|\||\<Delta\>|\|>e<rsup|-i\<phi\>>=\<alpha\><rsub|2k<rsub|F>><around*|(|<around*|\<langle\>|<wide|b|^><rsub|2k<rsub|F>>|\<rangle\>>+<around*|\<langle\>|<wide|b|^><rsub|-2k<rsub|F>><rsup|\<dagger\>>|\<rangle\>>|)>\<rightarrow\>2\<alpha\><rsub|2k<rsub|F>><around*|\<langle\>|<wide|b|^><rsub|2k<rsub|F>>|\<rangle\>>>
  is the order parameter.

  Then we will obtain the mean-field Hamiltonian for phonon,

  <\eqnarray*>
    <tformat|<cwith|2|2|2|2|cell-halign|l>|<cwith|3|3|2|2|cell-halign|l>|<cwith|4|4|2|2|cell-halign|l>|<table|<row|<cell|<wide|H|^><rsub|ph>=>|<cell|<big|sum><rsub|q<rsub|z>>\<hbar\>\<omega\><rsub|L,q<rsub|z>><wide|b|^><rsub|q<rsub|z>><rsup|\<dagger\>><wide|b|^><rsub|q<rsub|z>>\<longrightarrow\>2\<hbar\>\<omega\><rsub|L,2k<rsub|F>><around*|\<langle\>|<wide|b|^><rsub|2k<rsub|F>>|\<rangle\>><rsup|2>>|<cell|<eq-number>>>|<row|<cell|=>|<cell|<frac|\<hbar\>\<omega\><rsub|L,2k<rsub|F>><around*|\||\<Delta\><rsub|L>|\|><rsup|2>|2<around*|\||\<alpha\><rsub|2k<rsub|F>><rsup|>|\|><rsup|2>>>|<cell|>>|<row|<cell|=>|<cell|<around*|[|<frac|g<rsub|L><rsup|2>N<rsub|ion>Z<rsup|2>
    e<rsup|4>|M v<rsub|s,L><rsup|2>\<epsilon\><rsup|2>><frac|1|<around*|(|q<rsub|z><rsup|2>+\<kappa\><rsup|2>|)><rsup|2>>|]><rsup|-1>\<Delta\><rsub|L><rsup|2>>|<cell|>>|<row|<cell|\<equiv\>>|<cell|<around*|[|<frac|g<rsub|L0>|<around*|(|q<rsub|z><rsup|2>+\<kappa\><rsup|2>|)><rsup|2>>|]><rsup|-1>\<Delta\><rsub|L><rsup|2>>|<cell|>>>>
  </eqnarray*>

  now we have the total Hamiltonian for electron-LA phonon system

  <\eqnarray*>
    <tformat|<cwith|2|2|2|2|cell-halign|l>|<table|<row|<cell|<with|font|cal|H><rsub|D
    W,L>>|<cell|<around*|(|<tabular*|<tformat|<cwith|1|2|1|2|cell-halign|c>|<cwith|1|2|1|2|cell-halign|c>|<cwith|1|2|1|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<cell|<sqrt|\<hbar\><rsup|2>v<rsub|z><rsup|2><around*|(|k<rsub|z>+<frac|q|2>|)><rsup|2>+m<rsub|0><rsup|2>>>|<cell|<around*|\||\<Delta\><rsub|L>|\|>e<rsup|i\<phi\>>>>|<row|<cell|\<dagger\>>|<cell|<sqrt|\<hbar\><rsup|2>v<rsub|z><rsup|2><around*|(|k<rsub|z>-<frac|q|2>|)><rsup|2>+m<rsub|0><rsup|2>>>>>>>|)>+<around*|[|<frac|g<rsub|L0>|<around*|(|q<rsub|z><rsup|2>+\<kappa\><rsup|2>|)><rsup|2>>|]><rsup|-1><around*|\||\<Delta\><rsub|L>|\|><rsup|2>>|<cell|,>>|<row|<cell|g<rsub|L0>=>|<cell|<frac|g<rsub|L><rsup|2>N<rsub|ion>Z<rsup|2>
    e<rsup|4>|M v<rsub|s,L><rsup|2>\<epsilon\><rsup|2>>\<rightarrow\>537
    eV/nm>|<cell|.>>>>
  </eqnarray*>

  <subsubsection|Gap Equation and Ground-state Energy>

  By standard RPA approach, effective dielectric constant at zero temperature
  for zeroth landau band <math|E<rsub|k<rsub|z>><rsup|<around*|(|0+|)>>> in
  long wavelength limit is

  <\eqnarray*>
    <tformat|<cwith|1|1|2|2|cell-halign|l>|<cwith|3|3|2|2|cell-halign|l>|<cwith|4|4|2|2|cell-halign|l>|<cwith|5|5|2|2|cell-halign|l>|<table|<row|<cell|>|<cell|\<kappa\><rsup|2><around*|(|T=0|)>>|<cell|>>|<row|<cell|=>|<cell|lim<rsub|\<omega\><rsub|n>\<rightarrow\>0,q\<rightarrow\>0><frac|-e<rsup|2>|2\<pi\>\<epsilon\>l<rsub|B><rsup|2>><frac|1|\<beta\>><big|sum><rsub|m><big|int><rsub|-\<infty\>><rsup|+\<infty\>><frac|d
    k<rsub|z>|2\<pi\>><frac|1|<around*|[|i\<hbar\>\<omega\><rsub|m>-<around*|(|E<rsub|k<rsub|z>><rsup|<around*|(|0+|)>>-E<rsub|F>|)>|]>><frac|1|<around*|[|i\<hbar\><around*|(|\<omega\><rsub|m>+\<omega\><rsub|n>|)>-<around*|(|E<rsub|k<rsub|z>><rsup|<around*|(|0+|)>>-E<rsub|F>|)>|]>>>|<cell|>>|<row|<cell|\<approx\>>|<cell|lim<rsub|\<omega\><rsub|n>\<rightarrow\>0,q\<rightarrow\>0><frac|-e<rsup|2>|2\<pi\>\<epsilon\>l<rsub|B><rsup|2>><big|int><rsub|-\<infty\>><rsup|+\<infty\>><frac|d
    k<rsub|z>|2\<pi\>><frac|\<partial\>f<around*|(|E<rsub|k<rsub|z>><rsup|<around*|(|0+|)>>|)>|\<partial\>E<rsub|k<rsub|z>><rsup|<around*|(|0+|)>>>>|<cell|<eq-number>>>|<row|<cell|=>|<cell|<frac|e<rsup|2>|2\<pi\>\<epsilon\>l<rsub|B><rsup|2>><big|int><rsub|0><rsup|1><frac|1|2\<pi\>\<hbar\>v<rsub|F>>d
    f<around*|(|E<rsub|k<rsub|z>><rsup|<around*|(|0+|)>>|)>>|<cell|>>|<row|<cell|=>|<cell|<frac|e<rsup|3>B|4\<pi\><rsup|2>\<epsilon\>\<hbar\><rsup|2>v<rsub|F>
    >>|<cell|,>>>>
  </eqnarray*>

  and the electron-LA phonon coupling is followed:

  <\eqnarray*>
    <tformat|<cwith|1|1|2|2|cell-halign|l>|<table|<row|<cell|<around*|\||\<alpha\><rsub|L,q>|\|>=>|<cell|<sqrt|<frac|N<rsub|ion>\<hbar\>|2M\<omega\><rsub|L,q>>>q
    <frac|Z e<rsup|2>|\<epsilon\><around*|(|q<rsup|2>+\<kappa\><rsup|2>|)>>>|<cell|.<eq-number>>>>>
  </eqnarray*>

  Mean field Hamiltonian of LA phonon is somehow simple,

  <\eqnarray*>
    <tformat|<cwith|1|-1|2|-1|cell-halign|l>|<table|<row|<cell|H<rsub|ph,L>=>|<cell|<big|sum><rsub|<with|font-series|bold|q>>\<hbar\>\<omega\><rsub|L,<with|font-series|bold|q>><around*|\<langle\>|<wide|b|^><rsub|L,<with|font-series|bold|q>><rsup|\<dagger\>>|\<rangle\>><around*|\<langle\>|<wide|b|^><rsub|L,<with|font-series|bold|q>>|\<rangle\>>>|<cell|>>|<row|<cell|=>|<cell|2\<hbar\>\<omega\><rsub|L,2k<rsub|F>><around*|\||<around*|\<langle\>|<wide|b|^><rsub|L,2k<rsub|F>>|\<rangle\>>|\|><rsup|2>>|<cell|<eq-number>>>|<row|<cell|=>|<cell|<frac|\<hbar\>v<rsub|s,L>|2<around*|\||\<alpha\><rsub|L,2k<rsub|F>>|\|><rsup|2>><around*|\||\<Delta\><rsub|L,2k<rsub|F>>|\|><rsup|2>>|<cell|>>|<row|<cell|\<equiv\>>|<cell|<frac|<around*|\||\<Delta\><rsub|L,2k<rsub|F>>|\|><rsup|2>|g<rsub|L,2k<rsub|F>>>>|<cell|>>>>
  </eqnarray*>

  where coefficient for electron-LA phonon coupling is

  <\eqnarray*>
    <tformat|<table|<row|<cell|g<rsub|L,2k<rsub|F>>=>|<cell|<frac|2<around*|\||\<alpha\><rsub|L,2k<rsub|F>>|\|><rsup|2>|\<hbar\>v<rsub|s,L>>=<frac|N<rsub|ion>Z<rsup|2>
    e<rsup|4>|M v<rsub|s,L><rsup|2>\<epsilon\><rsup|2>>
    <frac|q|<around*|(|q<rsup|2>+\<kappa\><rsup|2>|)><rsup|2>><mid|\|><rsub|q=2k<rsub|F>>>|<cell|,<eq-number>>>>>
  </eqnarray*>

  then Hamitonian valid in <math|<around*|[|-k<rsub|F>,k<rsub|F>|]>> \ and
  energy for ground-state reads

  <\eqnarray*>
    <tformat|<cwith|2|2|2|2|cell-halign|l>|<table|<row|<cell|<wide|H|\<bar\>><rsub|g>*<around*|(|k<rsub|z>+k<rsub|F>|)>=>|<cell|<around*|(|<tabular*|<tformat|<table|<row|<cell|E<rsub|k<rsub|z>+k<rsub|F>><rsup|<around*|(|0+|)>><rsub|>>|<cell|<around*|\||\<Delta\><rsub|L,2k<rsub|F>>|\|>e<rsup|i\<phi\>>>>|<row|<cell|\<dagger\>>|<cell|E<rsub|k<rsub|z>-k<rsub|F>><rsup|<around*|(|0+|)>><rsub|>>>>>>|)>+<frac|<around*|\||\<Delta\><rsub|L,2k<rsub|F>>|\|><rsup|2>|g<rsub|L,2k<rsub|F>>>>|<cell|,<eq-number>>>|<row|<cell|E<rsub|g><around*|(|<around*|\||\<Delta\><rsub|L,2k<rsub|F>>|\|>|)>=>|<cell|<big|int><rsub|-k<rsub|F>><rsup|+k<rsub|F>>\<Theta\><around*|(|E<rsub|F>-E<rsub|g,k<rsub|z>><rsup|<around*|(|0+|)>>|)>E<rsub|g,k<rsub|z>><rsup|<around*|(|0+|)>>d
    k<rsub|z>+<frac|<around*|\||\<Delta\><rsub|L,2k<rsub|F>>|\|><rsup|2>|g<rsub|L,2k<rsub|F>>>>|<cell|.>>>>
  </eqnarray*>

  The gap equation is straightforwardly obtained by self-consistant
  condition:

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|\<partial\>E<rsub|g>|\<partial\><around*|\||\<Delta\><rsub|L,2k<rsub|F>>|\|>>=0\<Rightarrow\>>|<cell|<around*|\||\<Delta\><rsub|L,2k<rsub|F>>|\|>=<around*|\||<around*|(|\<hbar\>v<rsub|F>k<rsub|F>|)>csch<around*|(|<frac|4\<pi\><rsup|2>\<hbar\><rsup|2>v<rsub|F>|g<rsub|2k<rsub|F>>e
    B>|)>|\|>>|<cell|.<eq-number>>>>>
  </eqnarray*>

  Note that <math|k<rsub|F>> and <math|v<rsub|F>> are also
  <math|B>-dependent:

  <\eqnarray*>
    <tformat|<cwith|1|-1|2|2|cell-halign|l>|<table|<row|<cell|k<rsub|F>=>|<cell|<frac|2\<pi\><rsup|2>\<hbar\>n<rsub|0>|e
    B>>|<cell|,>>|<row|<cell|v<rsub|F>=>|<cell|<frac|\<partial\>E<rsub|k<rsub|z>><rsup|<around*|(|0+|)>>|\<partial\>k<rsub|z>><around*|\||<rsub|k<rsub|z>=k<rsub|F>>|\<nobracket\>>>|<cell|.>>>>
  </eqnarray*>

  <subsubsection|Model Parameter and Reproduction>

  \;

  Pseudo-code:

  <\algorithm>
    <math|><math|n<rsub|0>,\<epsilon\><rsub|r>,g<rsub|L0>,a>;
    <math|\<hbar\>,\<epsilon\><rsub|0>,e>;
    <math|M<rsub|0>,M<rsub|\<perp\>>,M<rsub|z>,v<rsub|z>>

    (<math|B,\<eta\>,numKz>)

    <hrule>

    <math|b z=<frac|2\<pi\>|a>>; <math|L<rsub|z>=a\<times\>numKz>;
    <math|l<rsub|B>=<sqrt|<frac|\<hbar\>|e B>>>;
    <math|k<rsub|F>=2\<pi\><rsup|2>l<rsub|B><rsup|2>n<rsub|0>>

    <math|k<rsub|z>list=List<around*|(|-k<rsub|F>,k<rsub|F>,numKz|)>>

    <math|m<rsub|0>=M<rsub|0>+<frac|M<rsub|\<perp\>>|l<rsub|B><rsup|2>>+M<rsub|z>k<rsub|z><rsup|2>>;

    <\math>
      E<rsub|k<rsub|z>><rsup|<around*|(|0|)>>=<sqrt|m<rsub|0><rsup|2>+\<hbar\><rsup|2>v<rsub|z><rsup|2>k<rsub|z><rsup|2>>
    </math>

    <math|\<mu\>=E<rsub|k<rsub|z>=k<rsub|F>><rsup|<around*|(|0|)>>>;
    <math|v<rsub|F>=<frac|m<rsub|0><around*|(|2M<rsub|z>k<rsub|z>|)>+\<hbar\><rsup|2>v<rsub|z><rsup|2>k<rsub|z>|<rsub|E<rsub|k<rsub|z>><rsup|<around*|(|0|)>>>><around*|\||<rsub|k<rsub|z>=k<rsub|F>>|\<nobracket\>>>

    <math|\<kappa\>=<sqrt|<frac|e<rsup|3>B|4\<pi\><rsup|2>\<epsilon\><rsub|0>\<epsilon\><rsub|r>\<hbar\><rsup|2>v<rsub|F>
    >>>

    <math|<around*|\||\<Delta\><rsub|L>|\|>=<around*|\||<around*|(|\<hbar\>v<rsub|F>k<rsub|F>|)>csch<around*|[|<frac|4\<pi\><rsup|2>\<hbar\><rsup|2>v<rsub|F><around*|(|<around*|(|2k<rsub|F><rsup|>|)><rsup|2>+\<kappa\><rsup|2>|)><rsup|2>|e
    B g<rsub|L0>>|]>|\|>>

    \;

    <math|E<rsub|g><around*|(|k<rsub|z>|)>=-<frac|1|2\<pi\>l<rsub|B><rsup|2>L<rsub|z>><sqrt|<around*|(|E<rsub|k<rsub|z>><rsup|<around*|(|0|)>>-\<mu\>|)><rsup|2>+<around*|\||\<Delta\><rsub|L>|\|><rsup|2>>>;
    <math|E<rsub|g>=<big|int><rsub|-k<rsub|F>><rsup|+k<rsub|F>>E<rsub|g><around*|(|k<rsub|z>|)>d
    k<rsub|z>>
  </algorithm>

  \;

  <\big-table|<tabular|<tformat|<table|<row|<cell|<block*|<tformat|<table|<row|<cell|Dirac>|<cell|<math|v<rsub|x>>>|<cell|<math|v<rsub|y>>>|<cell|<math|v<rsub|z>>>|<cell|<math|M<rsub|0>>>|<cell|<math|M<rsub|1>>>|<cell|<math|M<rsub|z>>>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|Material>|<cell|<math|\<varepsilon\><rsub|r>>>|<cell|<math|n<rsub|0>>>|<cell|<math|a>>|<cell|<math|N<rsub|ion>>>|<cell|<math|M>>|<cell|<math|Z>>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|Constant>|<cell|<math|e>>|<cell|<math|\<epsilon\><rsub|0>>>|<cell|<math|\<hbar\>>>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>>>>>>>>>>
    Model parameters of ZrTe5.
  </big-table>

  The key results are reproduced as shown in
  Fig.(<reference|Fig:CDWinZrTe5>).

  <\big-figure|<image|figs/fig-EgOfCDW.png|400pt|100pt||>>
    <label|Fig:CDWinZrTe5>Incommensurate and <math|8a>-commensurate CDWs in
    <math|ZrTe<rsub|5>> when <math|B=1.8 T>.
  </big-figure>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|Fig:CDWinZrTe5|<tuple|1|3>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|1|2>>
    <associate|auto-4|<tuple|1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1>|>
        Incommensurate and <with|mode|<quote|math>|8a>-commensurate CDWs in
        <with|mode|<quote|math>|ZrTe<rsub|5>> when
        <with|mode|<quote|math>|B=1.8 T>.
      </surround>|<pageref|auto-4>>
    </associate>
    <\associate|table>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1>|>
        Model parameters of ZrTe5.
      </surround>|<pageref|auto-3>>
    </associate>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Gap Equation and Ground-state
      Energy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|2<space|2spc>Model Parameter and
      Reproduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>
    </associate>
  </collection>
</auxiliary>