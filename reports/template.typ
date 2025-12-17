#let template(
    lab_num: none,
    lab_title: none,
    not_numbered: false,
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

    show link: underline
    show link: set text(fill: blue)

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
                #if not_numbered [
                    #block[#text(size: 24pt)[#lab_title]]
                ] else [
                    #block[#text(size: 30pt)[Lab #lab_num]]
                    #block[#text(size: 16pt)[#lab_title]]
                ]
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

#let design_table(
    luts: int,
    dsps: int,
    bram: int,
    lutram: int,
    ffs: int,
    io: int,
    mmcm: int,
    wns: float,
    spower: float,
    dpower: float
) = {
    let lut_percent = calc.round(luts / 32600 * 100, digits: 2)
    let dsp_percent = calc.round(dsps / 120 * 100, digits: 2)
    let bram_percent = calc.round(bram / 75 * 100, digits: 2)
    let lutram_percent = calc.round(lutram / 9600 * 100, digits: 2)
    let ff_percent = calc.round(ffs / 65200 * 100, digits: 2)
    let io_percent = calc.round(io / 210 * 100, digits: 2)
    let mmcm_percent = calc.round(mmcm / 5 * 100, digits: 2)

    let lut_val = if luts > 0 [#luts / 32600 (#lut_percent%)] else [0]
    let dsp_val = if dsps > 0 [#dsps / 120 (#dsp_percent%)] else [0]
    let bram_val = if bram > 0 [#bram / 75 (#bram_percent%)] else [0]
    let lutram_val = if lutram > 0 [#lutram / 9600 (#lutram_percent%)] else [0]
    let ff_val = if ffs > 0 [#ffs / 65200 (#ff_percent%)] else [0]
    let io_val = if io > 0 [#io / 210 (#io_percent%)] else [0]
    let mmcm_val = if mmcm > 0 [#mmcm / 5 (#mmcm_percent%)] else [0]

    let freq = calc.round(1000 / (10 - wns), digits: 3)

    let tpower = calc.round(spower + dpower, digits: 3)

    table(
        columns: (1fr, 1fr),
        table.cell([*Utilization*], colspan: 2, align: center),
        [Look-Up Tables (LUTs)], lut_val,
        [Digital Signal Processing Units (DSPs)], dsp_val,
        [Memory (BRAM)], bram_val,
        [Memory (LUTRAM)], lutram_val,
        [Latches], [0],
        [Flip-Flops (FFs)], ff_val,
        [Input/Output (IO)], io_val,
        [Mixed-Mode Clock Managers (MMCMs)], mmcm_val,
        table.cell([*Timing*], colspan: 2, align: center),
        [Worst Negative Slack (WNS)], [#wns ns],
        [Max Frequency], [#freq MHz],
        table.cell([*Power*], colspan: 2, align: center),
        [Static Power], [#spower W],
        [Dynamic Power], [#dpower W],
        [Total Power], [#tpower W],
    )
}
