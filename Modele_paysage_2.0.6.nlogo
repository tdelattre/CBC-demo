globals [
  grass  ;; keep track of how much plants there is

  ;;initialisation of  lists of agents counts and means for graph smoothing functions
  list_count_trees
  mean_count_trees
  list_count_coccinelles
  mean_count_coccinelles
  list_count_pucerons
  mean_count_pucerons
  pesticides?
  pesticides_duree
  ]

;; pucerons and coccinelles are both breeds of turtle.
breed [pucerons puceron]  ;; pucerons is its own plural, so we use "puceron" as the singular.
breed [coccinelles coccinelle]
breed [trees tree]

trees-own [species]

turtles-own [
  energy
  counter
]       ;; both coccinelles and pucerons have energy
patches-own [
  countdown
  alive
  ]

;to setup
;  clear-all
;  ask patches [
;    set pcolor 52
;    set alive false
;    ;create-tree
;
;  ]
;
;  crt patchNumber [
;    setxy random-xcor random-ycor
;    set color one-of (list 52 44 33)
;       ]
;
;  ask patches [
;    set pcolor [color] of min-one-of turtles [distance myself]
;    if pcolor = 44 [set alive true]
;  ]
;
;  ask turtles [die]
;  create-tree
;
;  ;; check GRASS? switch.
;  ;; if it is true, then grass grows and the pucerons eat it
;  ;; if it false, then the pucerons don't need to eat
;  if Consommation_des_plantes? [
;    ask patches [
;      set countdown random Temps_De_Guérison ;; initialize grass grow clocks randomly
;      ;set pcolor one-of [green brown]
;      set alive one-of [true false]
;      if alive = true [ask trees-here [die]]
;
;    ]
;
;  ]
;
;  set-default-shape pucerons "bug"
;  create-pucerons initial-number-pucerons  ;; create the pucerons, then initialize their variables
;  [
;    set color gray
;    set size 1.5  ;; easier to see
;    set label-color blue - 2
;    set energy random (2 * pucerons-gain-from-food)
;    setxy random-xcor random-ycor
;  ]
;  set-default-shape coccinelles "ladybug"
;  create-coccinelles initial-number-coccinelles  ;; create the coccinelles, then initialize their variables
;  [
;    set color red
;    set size 2  ;; easier to see
;    set energy random (2 * coccinelles-gain-from-food)
;    setxy random-xcor random-ycor
;  ]
;
;  set grass count patches with [alive = true]
;
;
;  set list_count_trees list 0 0
;  set list_count_coccinelles list 0 0
;  set list_count_pucerons list 0 0
;
;  set pesticides? false
;  set pesticides_duree 0
;  reset-ticks
;end


to setup-gotheron

  clear-all
  ask patches [
    set pcolor 52
    set alive false
    ;create-tree

  ]

;  crt patchNumber [
;    setxy random-xcor random-ycor
;    set color one-of (list 52 44 33)
;  ]
;
;  ask patches [
;    set pcolor [color] of min-one-of turtles [distance myself]
;    if pcolor = 44 [set alive true]
;  ]
;
;  ask turtles [die]
;


;  crt 1 [
;    setxy 1 0
;    ask patches in-radius 5 [set pcolor grey]
;    ask patches in-radius 10 with [pcolor = 52] [set pcolor yellow]
;    ask patches in-radius 20 with [pcolor = 52] [set pcolor orange]
;    ask patches in-radius 30 with [pcolor = 52] [set pcolor green]
;    ask patches in-radius 40 with [pcolor = 52] [set pcolor red]
;
;
;  ]

  crt 1 [

    setxy 1 0


    ;map [set heading i ask patch ahead 9 [set pcolor red]] [21 22 23 24 25 26 27 28]

    let distanceList (list 10 20 30 40)
    foreach distanceList [
      v ->

    let angleList n-values 60 [ i -> i + 20] show angleList
    let distList n-values v [ i -> i + 1] show distList
    let ccolor one-of (list red pink green yellow orange black brown)
    ;let ccolor one-of (list 52 44 33)


    foreach angleList [x -> set heading x
        foreach distList [y -> ask patch-ahead y [if pcolor = 52 [set pcolor ccolor] ]
      ]
    ]

    set angleList n-values 60 [ i -> i + 80] show angleList
    set distList n-values v [ i -> i + 1] show distList
    set ccolor one-of (list red pink green yellow orange black brown)
    foreach angleList [x -> set heading x
        foreach distList [y -> ask patch-ahead y [if pcolor = 52 [set pcolor ccolor] ]
      ]
    ]

    set angleList n-values 60 [ i -> i + 140] show angleList
    set distList n-values v [ i -> i + 1] show distList
    set ccolor one-of (list red pink green yellow orange black brown)
    foreach angleList [x -> set heading x
        foreach distList [y -> ask patch-ahead y [if pcolor = 52 [set pcolor ccolor] ]
      ]
    ]

        set angleList n-values 60 [ i -> i + 200] show angleList
    set distList n-values v [ i -> i + 1] show distList
    set ccolor one-of (list red pink green yellow orange black brown)
    foreach angleList [x -> set heading x
        foreach distList [y -> ask patch-ahead y [if pcolor = 52 [set pcolor ccolor] ]
      ]
    ]

    set angleList n-values 60 [ i -> i + 260] show angleList
    set distList n-values v [ i -> i + 1] show distList
    set ccolor one-of (list red pink green yellow orange black brown)
    foreach angleList [x -> set heading x
        foreach distList [y -> ask patch-ahead y [if pcolor = 52 [set pcolor ccolor] ]
      ]
    ]

    set angleList n-values 60 [ i -> i + 320] show angleList
    set distList n-values v [ i -> i + 1] show distList
    set ccolor one-of (list red pink green yellow orange black brown)
    foreach angleList [x -> set heading x
        foreach distList [y -> ask patch-ahead y [if pcolor = 52 [set pcolor ccolor] ]
      ]
    ]
    ]

;    set heading 21
;    ask patch-ahead 6 [set pcolor pink] ask patch-ahead 7  [set pcolor pink] ask patch-ahead 8  [set pcolor pink] ask patch-ahead 9  [set pcolor pink]
;    set heading 22
;    ask patch-ahead 6  [set pcolor pink] ask patch-ahead 7  [set pcolor pink] ask patch-ahead 8  [set pcolor pink] ask patch-ahead 9  [set pcolor pink]
;    set heading 23
;    ask patch-ahead 6  [set pcolor pink] ask patch-ahead 7  [set pcolor pink] ask patch-ahead 8  [set pcolor pink] ask patch-ahead 9  [set pcolor pink]
;    set heading 24
;    ask patch-ahead 6  [set pcolor pink] ask patch-ahead 7  [set pcolor pink] ask patch-ahead 8  [set pcolor pink] ask patch-ahead 9  [set pcolor pink]
;    ;ask patch-at-heading-and-distance 21 6 [set pcolor pink]
;    ask patches in-radius 10 with [pcolor = 52] [set pcolor yellow]
;    ask patches in-radius 20 with [pcolor = 52] [set pcolor orange]
;    ask patches in-radius 30 with [pcolor = 52] [set pcolor green]
;    ask patches in-radius 40 with [pcolor = 52] [set pcolor red]



    die
  ]


    ;;création des chemins et haies transverses
    crt 1 [  ;;chemin vertical
    setxy 0 0
    set heading 20
    hatch 1 [ repeat 40 [ fd 1 ask patches in-radius 1 [set pcolor grey] ] die]
    move-to patch-at-heading-and-distance 90 2
    repeat 40 [ fd 1 ask patches in-radius 1 [set pcolor blue] ]
    die
  ]

  crt 1 [  ;;chemin droite
    setxy 0 0
    set heading 140
    hatch 1 [ repeat 40 [ fd 1 ask patches in-radius 1 [set pcolor grey] ] die]
    move-to patch-at-heading-and-distance 90 2
    repeat 40 [ fd 1 ask patches in-radius 1 [set pcolor blue] ]
    die
  ]

    crt 1 [  ;;chemin gauche
    setxy 0 0
    set heading 260
    hatch 1 [ repeat 40 [ fd 1 ask patches in-radius 1 [set pcolor grey] ] die]
    move-to patch-at-heading-and-distance 100 4
    repeat 45 [ fd 1 ask patches in-radius 1 [set pcolor blue] ]
    die
  ]

  ;;rond point central
  crt 1 [

    setxy 1 0
    ask patches in-radius 5 [set pcolor grey]
    die
  ]



  ;;create-trees
  ask patches with [pcolor = green] [
    sprout-trees 1 [
      set shape "tree"
      set size 2
      set color 52
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

    ;;create-trees
  ask patches with [pcolor = orange] [
    sprout-trees 1 [
      set shape "flower"
      set size 2
      set color 24
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

  ask patches with [pcolor = red] [
    sprout-trees 1 [
      set shape "tree"
      set size 2
      set color 14
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

    ask patches with [pcolor = brown] [
    sprout-trees 1 [
      set shape "plant"
      set size 2
      set color 52
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

      ask patches with [pcolor = yellow] [
    sprout-trees 1 [
      set shape "flower"
      set size 2
      set color 43
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

  ask patches with [pcolor = pink] [
    sprout-trees 1 [
      set shape "tree"
      set size 2
      set color 123
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

    ask patches with [pcolor = black] [
    sprout-trees 1 [
      set shape "plant"
      set size 2
      set color gray
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]


    ask patches [

    if count turtles-here with [shape = "tree"] > 0 [set alive true]
  ]

;  create-tree

  ;; check GRASS? switch.
  ;; if it is true, then grass grows and the pucerons eat it
  ;; if it false, then the pucerons don't need to eat


  if Consommation_des_plantes? [
    ask patches [
      set countdown random Temps_De_Guérison ;; initialize grass grow clocks randomly
                                             ;set pcolor one-of [green brown]
      set alive one-of [true false]
      if alive = false [ask trees-here [die]]

    ]

  ]

  set-default-shape pucerons "bug"
  create-pucerons initial-number-pucerons  ;; create the pucerons, then initialize their variables
  [
    set color gray
    set size 1.5  ;; easier to see
    set label-color blue - 2
    set energy random (2 * pucerons-gain-from-food)
    setxy random-xcor random-ycor
    move-to one-of patches with [count turtles-here with [shape = "tree"] > 0]
  ]
  set-default-shape coccinelles "ladybug"
  create-coccinelles initial-number-coccinelles  ;; create the coccinelles, then initialize their variables
  [
    set color red
    set size 2  ;; easier to see
    set energy random (2 * coccinelles-gain-from-food)
    setxy random-xcor random-ycor
  ]

  ;set grass count patches with [alive = true]
  set grass count patches with[count turtles-here with [shape = "tree"] > 0]


  set list_count_trees list 0 0
  set list_count_coccinelles list 0 0
  set list_count_pucerons list 0 0

  set pesticides? false
  set pesticides_duree 0
  reset-ticks

end

to go
  ;if count coccinelles + count pucerons = 0 [ stop ]
  ask pucerons [
    move-pucerons
    if Consommation_des_plantes? [
      set energy energy - 1  ;; deduct energy for pucerons only if grass? switch is on
      eat-grass
    ]
    death
    reproduce-pucerons
  ]
  ask coccinelles [
    move-coccinelles
    set energy energy - 1  ;; coccinelles lose energy as they move
    catch-pucerons
    if Coccinelles_Généralistes? [eat-plant]
    death
    reproduce-coccinelles
  ]
  ;pesticides
  ;if Consommation_des_plantes? [ ask patches [ grow-grass ] ]
  ask patches [ grow-grass ]
  set grass count patches with [alive = true]
  calculate-means-over-time
  tick
  ;progress
  if Limite_De_Temps? and ticks > Limite [stop]
end

to move  ;; turtle procedure
  rt random 50
  lt random 50
  fd 1
end

to move-pucerons
  set counter counter + 1
  let turning 50
  if count turtles-here with [shape = "flower"] > 0 [
    rt 180 ;ew
    set turning 15 ;repulsive, let's go away
  ]

  if count turtles-here with [shape = "tree"] > 0 [
    set turning 380 ;there's food here, let's forage
    set counter 0
  ]

  if counter > 30 [ set turning 15];no food around, let's go away

  if random 100 > 50 [
    rt random turning
    lt random turning
  ]

  if Fleurs_Répulsives? [
  let repulsor 0
  ask patch-ahead 7 [set repulsor count turtles-here with [shape = "flower"] ]
  if repulsor > 0 [
    rt 180 ;ew, there are repulsive plants ahead
    set turning 15 ;repulsive, let's go away
  ]
  ]
  if Barrières_Centrales? [if [pcolor] of patch-ahead 1 = 5 or [pcolor] of patch-ahead 1 = 105 [if random 100 > 10 [rt 180]]] ; barrier]

  fd 1

end


to move-coccinelles
  ;move
  set counter counter + 1
  let turning 50

  if count turtles-here with [shape = "plant"] > 0 [
    set turning 380 ;there's food here, let's forage
    set counter 0
  ]

    if count turtles-here with [shape = "tree"] > 0 [
    set turning 380 ;there's food here, let's forage
    set counter 0
  ]

  ;if count pucerons-here > 0 [set counter 0]


  if counter > 15 [ set turning 15];no food around, let's go away

    if random 100 > 50 [
    rt random turning
    lt random turning
  ]

  if Barrières_Centrales? [if [pcolor] of patch-ahead 1 = 5 or [pcolor] of patch-ahead 1 = 105 [if random 100 > 10 [rt 180]]] ; barrier]

  fd 1

end

to eat-grass  ;; pucerons procedure
  ;; pucerons eat grass, turn the patch brown
  ;if [alive] of patch-here = true and [pcolor] of patch-here = 44 [
  if [alive] of patch-here = true and count turtles-here with [shape = "tree"] > 0 [
    ;set pcolor brown
    ask patch-here [set alive false]
    ask trees-here [die]
    set energy energy + pucerons-gain-from-food  ;; pucerons gain energy by eating
  ]
end


to eat-plant ;; coccinelles procedure
  ;; pucerons eat grass, turn the patch brown
  ;if [alive] of patch-here = true and [pcolor] of patch-here = 44 [
  if [alive] of patch-here = true and count turtles-here with [shape = "plant"] > 0 [
    ;set pcolor brown
    ask patch-here [set alive false]
    ask trees-here [die]
    set energy energy + (coccinelles-gain-from-food / 4)  ;; coccinelles gain energy by eating plants
  ]
end

to reproduce-pucerons  ;; pucerons procedure
 ; if random-float 100 < pucerons-reproduce [  ;; throw "dice" to see if you will reproduce
 ;   set energy (energy / 2)                ;; divide energy between parent and offspring
 ;   hatch 1 [ rt random-float 360 fd 1 ]   ;; hatch an offspring and move it forward 1 step
 ; ]

  if energy > pucerons-reproduce [
    set energy (energy / 2)                 ;; divide energy between parent and offspring
    hatch 1 [ rt random-float 360 fd 1 ]    ;; hatch an offspring and move it forward 1 step
  ]
end

to reproduce-coccinelles  ;; coccinelle procedure
 ; if random-float 100 < coccinelle-reproduce [  ;; throw "dice" to see if you will reproduce
 ;   set energy (energy / 2)               ;; divide energy between parent and offspring
 ;   hatch 1 [ rt random-float 360 fd 1 ]  ;; hatch an offspring and move it forward 1 step
 ; ]

  if energy > coccinelles-reproduce [
    set energy (energy / 2)               ;; divide energy between parent and offspring
    hatch 1 [ rt random-float 360 fd 1 ]  ;; hatch an offspring and move it forward 1 step
  ]
end

to catch-pucerons  ;; coccinelle procedure
  let prey one-of pucerons-here                    ;; grab a random pucerons
  if prey != nobody                             ;; did we get one?  if so,
    [ ask prey [ die ]                          ;; kill it
      set counter 0                             ;; counter for movement
      set energy energy + coccinelles-gain-from-food ] ;; get energy from eating
end

to death  ;; turtle procedure
  ;; when energy dips below zero, die
  if energy < 0 [ die ]
end

to grow-grass  ;; patch procedure
  ;; countdown on brown patches: if reach 0, grow some grass
  if alive = false or count turtles-here with [shape = "tree"] < 0 [
    ifelse countdown <= 0
      [ ;set pcolor green
        set alive true
        create-tree-ongoing
        set countdown Temps_De_Guérison ]
      [ set countdown countdown - 1 ]
  ]
end


;to create-tree
;  ask patches with [pcolor = 44] [
;  sprout-trees 1 [
;    set shape "tree"
;    set color green
;    ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
;    ]
;  ]
;
;
;end

;to create-tree-ongoing
;
;    sprout-trees 1 [
;    set shape "tree"
;    set color green
;    ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
;    ]
;
;end

to create-tree-ongoing




    ;;create-trees
  if pcolor = green [
    sprout-trees 1 [
      set shape "tree"
      set size 2
      set color 52
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

    ;;create-trees
  if pcolor = orange [
    sprout-trees 1 [
      set shape "flower"
      set size 2
      set color 24
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

  if pcolor = red [
    sprout-trees 1 [
      set shape "tree"
      set size 2
      set color 14
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

    if pcolor = brown [
    sprout-trees 1 [
      set shape "plant"
      set size 2
      set color 52
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

      if pcolor = yellow [
    sprout-trees 1 [
      set shape "flower"
      set size 2
      set color 43
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

  if pcolor = pink [
    sprout-trees 1 [
      set shape "tree"
      set size 2
      set color 123
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]

    if pcolor = black [
    sprout-trees 1 [
      set shape "plant"
      set size 2
      set color gray
      ifelse Consommation_des_plantes? [set size 1.5] [set size 1]
    ]
  ]


end

to progress2

  let mmax 270000
  file-close
  file-open "log_behaviorspace.txt"
  let tt 1
  while [file-at-end? = false] [set tt read-from-string file-read-line]
  ;set tt file-read-line
  print tt
  print precision ((tt / mmax) * 100) 4
  set tt tt + 1
  file-close
  file-open "log_behaviorspace.txt"
  file-print tt
  file-close

end


to progress

  let mmax 270000
  file-close
  file-open "log_behaviorspace.txt"
  let tt 1
  set tt read-from-string file-read-line
  print tt
  print precision ((tt / mmax) * 100) 4
  set tt tt + 1
  file-close
  file-delete "log_behaviorspace.txt"
  file-open "log_behaviorspace.txt"
  file-write tt
  file-close

end

to calculate-means-over-time

  ;trees----------------------------------------------
  set list_count_trees lput count trees with [shape = "tree"] list_count_trees
  if (length list_count_trees > smooth ) [
    let depassement (length list_count_trees - smooth)
    repeat depassement [ set list_count_trees remove-item 0 list_count_trees]
  ]
  if (length list_count_trees != 0) [ set mean_count_trees mean list_count_trees ]

    ;trees----------------------------------------------
  set list_count_coccinelles lput count coccinelles list_count_coccinelles
  if (length list_count_coccinelles > smooth ) [
    let depassement (length list_count_coccinelles - smooth)
    repeat depassement [ set list_count_coccinelles remove-item 0 list_count_coccinelles]
  ]
  if (length list_count_coccinelles != 0) [ set mean_count_coccinelles mean list_count_coccinelles ]

    ;trees----------------------------------------------
  set list_count_pucerons lput count pucerons list_count_pucerons
  if (length list_count_pucerons > smooth ) [
    let depassement (length list_count_pucerons - smooth)
    repeat depassement [ set list_count_pucerons remove-item 0 list_count_pucerons]
  ]
  if (length list_count_pucerons != 0) [ set mean_count_pucerons mean list_count_pucerons ]
end


to pesticides

  set pesticides_duree pesticides_duree + 1

  if pesticides? = true [

    ask pucerons [set energy energy - round (energy * intensité)]
    ask coccinelles [set energy energy - round (energy * intensité)]
  ]

  if pesticides_duree >= remanence [set pesticides? false]


end
@#$#@#$#@
GRAPHICS-WINDOW
881
30
2012
1162
-1
-1
13.212
1
14
1
1
1
0
1
1
1
-42
42
-42
42
0
0
1
ticks
30.0

SLIDER
2524
476
2719
509
initial-number-pucerons
initial-number-pucerons
0
250
100.0
1
1
NIL
HORIZONTAL

SLIDER
2522
352
2717
385
pucerons-gain-from-food
pucerons-gain-from-food
0.0
50.0
4.0
1.0
1
NIL
HORIZONTAL

SLIDER
2522
387
2717
420
pucerons-reproduce
pucerons-reproduce
10
20
15.0
1
1
NIL
HORIZONTAL

SLIDER
2726
476
2932
509
initial-number-coccinelles
initial-number-coccinelles
0
250
50.0
50
1
NIL
HORIZONTAL

SLIDER
2728
353
2934
386
coccinelles-gain-from-food
coccinelles-gain-from-food
10
100
20.0
10
1
NIL
HORIZONTAL

SLIDER
2728
389
2934
422
coccinelles-reproduce
coccinelles-reproduce
10
20
15.0
1
1
NIL
HORIZONTAL

SWITCH
2522
249
2758
282
Consommation_des_plantes?
Consommation_des_plantes?
0
1
-1000

SLIDER
2763
250
2975
283
Temps_De_Guérison
Temps_De_Guérison
0
100
10.0
1
1
NIL
HORIZONTAL

BUTTON
78
48
328
81
--> SIMULER ! -->
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

PLOT
2543
1114
3107
1539
populations
time
pop.
0.0
100.0
0.0
100.0
true
true
"" ""
PENS
"Pucerons" 1.0 0 -13345367 true "" "plot count pucerons"
"Coccinelles" 1.0 0 -2674135 true "" "plot count coccinelles"
"Arbres (/ 4)" 1.0 0 -10899396 true "" "if Consommation_des_plantes? [ plot grass / 4 ]"

MONITOR
2535
651
2609
696
pucerons
count pucerons
3
1
11

MONITOR
2535
696
2609
741
coccinelles
count coccinelles
3
1
11

MONITOR
2535
742
2609
787
Plantes
grass
0
1
11

TEXTBOX
2524
447
2745
477
Propriétés des puçerons\n----------------------------------
14
0.0
1

TEXTBOX
2726
446
2963
480
Propriétés des coccinelles\n-----------------------------
14
0.0
1

TEXTBOX
2522
212
2737
243
Propriétés des plantes\n-------------------------------
14
0.0
1

BUTTON
76
155
281
188
Ajouter des coccinelles
create-coccinelles 50  ;; create the wolves, then initialize their variables\n  [\n    set color red\n    set size 2  ;; easier to see\n    set energy random (2 * coccinelles-gain-from-food)\n    setxy random-xcor random-ycor\n  ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
2541
1069
2727
1102
Limite_De_Temps?
Limite_De_Temps?
1
1
-1000

BUTTON
2512
19
2763
52
Retour Configuration standard
set initial-number-coccinelles 50\nset coccinelles-gain-from-food 20\nset coccinelles-reproduce 15\nset initial-number-pucerons 100\nset pucerons-gain-from-food 4\nset pucerons-reproduce 15\nset Consommation_des_plantes? true\nset Temps_De_Guérison 10
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
51
11
83
35
1[
20
14.0
1

TEXTBOX
51
47
74
73
2[
20
14.0
1

PLOT
56
365
733
866
Populations L
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Arbres Sains" 1.0 0 -13210332 true "" "plot mean_count_trees / 4"
"Coccinelles" 1.0 0 -2674135 true "" "plot mean_count_coccinelles"
"Pucerons" 1.0 0 -13345367 true "" "plot mean_count_pucerons"

SLIDER
2910
1071
3082
1104
smooth
smooth
0
1000
100.0
100
1
NIL
HORIZONTAL

SLIDER
2735
1070
2907
1103
Limite
Limite
0
10000
2000.0
500
1
NIL
HORIZONTAL

BUTTON
76
192
281
227
Tuer les coccinelles
ask coccinelles [die]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
287
193
466
227
Tuer les pucerons
ask pucerons  [die]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
287
155
466
188
Ajouter des pucerons
create-pucerons 10  ;; create the pucerons, then initialize their variables\n  [\n    set color gray\n    set size 1.5  ;; easier to see\n    set label-color blue - 2\n    set energy random (2 * pucerons-gain-from-food)\n    setxy random-xcor random-ycor\n  ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
2541
857
2745
891
Tuer les plantes
ask patches [set alive false]\nask trees [die]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
79
115
293
149
Tests!\n------------------------------------
14
0.0
1

SLIDER
2540
900
2702
933
Intensité
Intensité
0
1
0.4
0.1
1
NIL
HORIZONTAL

BUTTON
2752
858
2931
891
pesticides
set pesticides_duree 0\nset pesticides? true
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
2540
934
2702
967
remanence
remanence
0
100
4.0
1
1
NIL
HORIZONTAL

SLIDER
2530
587
2702
620
patchNumber
patchNumber
0
100
20.0
1
1
NIL
HORIZONTAL

BUTTON
77
10
327
43
PREPARER
setup-gotheron\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
75
254
271
287
Coccinelles_Généralistes?
Coccinelles_Généralistes?
0
1
-1000

SWITCH
75
298
271
331
Barrières_Centrales?
Barrières_Centrales?
0
1
-1000

TEXTBOX
2524
319
2674
347
Propriétés des insectes\n-----------------------------------
11
0.0
1

TEXTBOX
2532
553
2682
581
Propriétés du paysage\n-----------------------------------
11
0.0
1

SWITCH
280
255
437
288
Fleurs_répulsives?
Fleurs_répulsives?
0
1
-1000

@#$#@#$#@
## WHAT IS IT?

This model explores the stability of predator-prey ecosystems. Such a system is called unstable if it tends to result in extinction for one or more species involved.  In contrast, a system is stable if it tends to maintain itself over time, despite fluctuations in population sizes.

## HOW IT WORKS

There are two main variations to this model.

In the first variation, wolves and sheep wander randomly around the landscape, while the wolves look for sheep to prey on. Each step costs the wolves energy, and they must eat sheep in order to replenish their energy - when they run out of energy they die. To allow the population to continue, each wolf or sheep has a fixed probability of reproducing at each time step. This variation produces interesting population dynamics, but is ultimately unstable.

The second variation includes grass (green) in addition to wolves and sheep. The behavior of the wolves is identical to the first variation, however this time the sheep must eat grass in order to maintain their energy - when they run out of energy they die. Once grass is eaten it will only regrow after a fixed amount of time. This variation is more complex than the first, but it is generally stable.

The construction of this model is described in two papers by Wilensky & Reisman referenced below.

## HOW TO USE IT

1. Set the GRASS? switch to TRUE to include grass in the model, or to FALSE to only include wolves (red) and sheep (white).
2. Adjust the slider parameters (see below), or use the default settings.
3. Press the SETUP button.
4. Press the GO button to begin the simulation.
5. Look at the monitors to see the current population sizes
6. Look at the POPULATIONS plot to watch the populations fluctuate over time

Parameters:
INITIAL-NUMBER-SHEEP: The initial size of sheep population
INITIAL-NUMBER-WOLVES: The initial size of wolf population
SHEEP-GAIN-FROM-FOOD: The amount of energy sheep get for every grass patch eaten
WOLF-GAIN-FROM-FOOD: The amount of energy wolves get for every sheep eaten
SHEEP-REPRODUCE: The probability of a sheep reproducing at each time step
WOLF-REPRODUCE: The probability of a wolf reproducing at each time step
GRASS?: Whether or not to include grass in the model
GRASS-REGROWTH-TIME: How long it takes for grass to regrow once it is eaten
SHOW-ENERGY?: Whether or not to show the energy of each animal as a number

Notes:
- one unit of energy is deducted for every step a wolf takes
- when grass is included, one unit of energy is deducted for every step a sheep takes

## THINGS TO NOTICE

When grass is not included, watch as the sheep and wolf populations fluctuate. Notice that increases and decreases in the sizes of each population are related. In what way are they related? What eventually happens?

Once grass is added, notice the green line added to the population plot representing fluctuations in the amount of grass. How do the sizes of the three populations appear to relate now? What is the explanation for this?

Why do you suppose that some variations of the model might be stable while others are not?

## THINGS TO TRY

Try adjusting the parameters under various settings. How sensitive is the stability of the model to the particular parameters?

Can you find any parameters that generate a stable ecosystem that includes only wolves and sheep?

Try setting GRASS? to TRUE, but setting INITIAL-NUMBER-WOLVES to 0. This gives a stable ecosystem with only sheep and grass. Why might this be stable while the variation with only sheep and wolves is not?

Notice that under stable settings, the populations tend to fluctuate at a predictable pace. Can you find any parameters that will speed this up or slow it down?

Try changing the reproduction rules -- for example, what would happen if reproduction depended on energy rather than being determined by a fixed probability?

## EXTENDING THE MODEL

There are a number ways to alter the model so that it will be stable with only wolves and sheep (no grass). Some will require new elements to be coded in or existing behaviors to be changed. Can you develop such a version?

## NETLOGO FEATURES

Note the use of breeds to model two different kinds of "turtles": wolves and sheep. Note the use of patches to model grass.

Note use of the ONE-OF agentset reporter to select a random sheep to be eaten by a wolf.

## RELATED MODELS

Look at Rabbits Grass Weeds for another model of interacting populations with different rules.

## CREDITS AND REFERENCES

Wilensky, U. & Reisman, K. (1999). Connected Science: Learning Biology through Constructing and Testing Computational Theories -- an Embodied Modeling Approach. International Journal of Complex Systems, M. 234, pp. 1 - 12. (This model is a slightly extended version of the model described in the paper.)

Wilensky, U. & Reisman, K. (2006). Thinking like a Wolf, a Sheep or a Firefly: Learning Biology through Constructing and Testing Computational Theories -- an Embodied Modeling Approach. Cognition & Instruction, 24(2), pp. 171-209. http://ccl.northwestern.edu/papers/wolfsheep.pdf


## HOW TO CITE

If you mention this model in a publication, we ask that you include these citations for the model itself and for the NetLogo software:

* Wilensky, U. (1997).  NetLogo Wolf Sheep Predation model.  http://ccl.northwestern.edu/netlogo/models/WolfSheepPredation.  Center for Connected Learning and Computer-Based Modeling, Northwestern Institute on Complex Systems, Northwestern University, Evanston, IL.
* Wilensky, U. (1999). NetLogo. http://ccl.northwestern.edu/netlogo/. Center for Connected Learning and Computer-Based Modeling, Northwestern Institute on Complex Systems, Northwestern University, Evanston, IL.

## COPYRIGHT AND LICENSE

Copyright 1997 Uri Wilensky.

![CC BY-NC-SA 3.0](http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

Commercial licenses are also available. To inquire about commercial licenses, please contact Uri Wilensky at uri@northwestern.edu.

This model was created as part of the project: CONNECTED MATHEMATICS: MAKING SENSE OF COMPLEX PHENOMENA THROUGH BUILDING OBJECT-BASED PARALLEL MODELS (OBPML).  The project gratefully acknowledges the support of the National Science Foundation (Applications of Advanced Technologies Program) -- grant numbers RED #9552950 and REC #9632612.

This model was converted to NetLogo as part of the projects: PARTICIPATORY SIMULATIONS: NETWORK-BASED DESIGN FOR SYSTEMS LEARNING IN CLASSROOMS and/or INTEGRATED SIMULATION AND MODELING ENVIRONMENT. The project gratefully acknowledges the support of the National Science Foundation (REPP & ROLE programs) -- grant numbers REC #9814682 and REC-0126227. Converted from StarLogoT to NetLogo, 2000.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -13840069 true false 79 135 142
Circle -13840069 true false 110 112 80
Circle -13840069 true false 110 75 80
Line -13840069 false 150 100 80 30
Line -13840069 false 150 100 220 30
Line -13840069 false 120 240 90 285
Line -13840069 false 180 240 210 285

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

ladybug
true
0
Circle -7500403 true true 110 75 80
Circle -7500403 true true 59 108 182
Circle -16777216 false false 57 107 188
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30
Line -16777216 false 150 113 150 293
Circle -16777216 true false 77 147 23
Circle -16777216 true false 200 145 23
Circle -16777216 true false 103 178 41
Circle -16777216 true false 156 177 41
Circle -16777216 true false 94 246 29
Circle -16777216 true false 177 245 29
Circle -1 true false 135 110 14
Circle -1 true false 151 110 14
Circle -16777216 true false 133 120 34
Circle -1 true false 125 80 17
Circle -1 true false 156 78 17

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.4
@#$#@#$#@
setup
set grass? true
repeat 75 [ go ]
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="exploration1" repetitions="1" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <final>let mmax 270000
file-close
file-open "log_behaviorspace.txt"
let tt 1
while [file-at-end? = false] [set tt read-from-string file-read-line]
;set tt file-read-line
print tt
print precision ((tt / mmax) * 100) 4
set tt tt + 1
file-close
file-open "log_behaviorspace.txt"
file-print tt
file-close</final>
    <metric>mean_count_trees</metric>
    <metric>mean_count_coccinelles</metric>
    <metric>mean_count_pucerons</metric>
    <enumeratedValueSet variable="initial-number-pucerons">
      <value value="25"/>
      <value value="50"/>
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initial-number-coccinelles">
      <value value="0"/>
      <value value="25"/>
      <value value="50"/>
      <value value="100"/>
    </enumeratedValueSet>
    <steppedValueSet variable="coccinelles-reproduce" first="2" step="2" last="20"/>
    <steppedValueSet variable="coccinelles-gain-from-food" first="10" step="10" last="50"/>
    <steppedValueSet variable="pucerons-reproduce" first="2" step="2" last="20"/>
    <enumeratedValueSet variable="Limite_De_Temps?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Consommation_des_plantes?">
      <value value="true"/>
    </enumeratedValueSet>
    <steppedValueSet variable="pucerons-gain-from-food" first="1" step="2" last="30"/>
    <enumeratedValueSet variable="Temps_De_Guérison">
      <value value="10"/>
      <value value="20"/>
      <value value="30"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
