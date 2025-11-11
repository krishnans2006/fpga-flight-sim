#let template(
    lab_title: none,
    names: (),
    doc,
) = {
    set page(
        paper: "us-letter"
    )

    set text(
        font: "New Computer Modern",
        size: 12pt,
    )

    set heading(
        numbering: "1.1.1 "
    )

    set enum(
        numbering: "1.a.i."
    )

    set math.equation(
        numbering: "(1)"
    )

    show figure: set block(spacing: 2.5em)
    show math.equation: set block(spacing: 2em)

    let cover_page = [
        #grid(
            columns: 1fr,
            rows: (1fr, 1fr, 1fr),
            align: center,
        )[
            #block(height: 100%, align(horizon)[
                #block[#text(size: 30pt)[ECE 385]]
                #block[#text(size: 16pt)[Fall 2025]]
            ])
            #block(height: 100%, align(horizon)[
                #block[#text(size: 16pt)[#lab_title]]
            ])
            #block(height: 100%, align(horizon)[
                #block[#text(size: 16pt)[
                    #names.join("\n")
                ]]
            ])
        ]
    ]

    cover_page
    pagebreak()

    outline(depth: 3)
    pagebreak()

    set page(numbering: "1")
    counter(page).update(1)
    doc
}

#show: template.with(
    lab_title: "Final Project Proposal",
    names: ("Krishnan Shankar","Aniketh Tarikonda"),
)

= Overview

We propose to design and implement a 3D graphics rendering system capable of HDMI output on the FPGA. Our design will be based around a MicroBlaze interfacing with a custom graphics pipeline (GPU) via AXI4-lite. We will implement our GPU to read and write from DDR3 to aid processing of large datasets, and we will control the video output via this graphics pipeline as well. Our goal is to demonstrate a working 3D renderer, capable of displaying a procedurally generated landscape and other 3D textures and sprites. If time permits, we will interface with a USB keyboard to potentially move objects within this landscape. 

== List of Features

= Block Diagram

= Administrative

We expect this project to be a baseline of 10-12, difficulty-wise, mainly because the initial step is difficult to implement in hardware, but not particularly software intensive. 
