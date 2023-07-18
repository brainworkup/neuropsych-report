// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let report(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 23mm, right: 25mm, top: 27mm, bottom: 27mm),
    numbering: ("1/1"),
    number-align: center,
    header: locate(
        loc => if [#loc.page()] == [1] {
            []
        } else {
            [
              #set text(8pt)
              #smallcaps[
               *CONFIDENTIAL*\
               Patient Name
             ]
           ]
        }
    )
)

  // Save heading and body font families in variables.
  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  // Set body font family.
  set text(font: body-font, lang: "en", size: 11pt)
  show math.equation: set text(weight: 400)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)

  show heading: set text(font: sans-font)
    
  set heading(numbering: "1.a")

  // Set run-in subheadings, starting at level 4.
  show heading: it => {
    if it.level > 3 {
      parbreak()
      text(10pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  set par(leading: 0.75em)

  // Logo
  block(
    figure(
      image("logo.png"),
    )
)

  // Title row.
  align(center)[
    #block(text(font: sans-font, weight: 700, 1.75em, title))
    #v(2.2em, weak: true)
    // #date
  ]

  // Main body.
  set text(hyphenate: true)

  body


}
#show: report.with(
  title: "NEUROCOGNITIVE EXAMINATION",


   authors: (
    (
    name: "Joey T.",
    email: "",
    url: "",
    
  ),
  ),
)


#v(2pt, weak: true)
*PATIENT NAME:* Biggie Smalls\
*DATES OF EXAM:* 2023-05-05, 2023-05-06\
= TESTS ADMINISTERED
<tests-administered>
- Comprehensive Neuropsychiatric Symptom and History Interview
- Conners’ Adult ADHD Diagnostic Interview for DSM-IV (CAADID), Part I: History
- Conners’ Adult ADHD Rating Scales–Observer Report: Long Version (CAARS–O:L)
- Comprehensive Executive Function Inventory Adult (CEFI Adult) Observer Form
- Advanced Clinical Solutions (ACS): Word Choice Test
- Dot Counting Test
- Wechsler Adult Intelligence Scale, 4th ed (WAIS-IV)
- Wechsler Individual Achievement Test, 4th ed (WIAT-4)
- Neuropsychological Assessment Battery, Screener (NAB):
  - Attention, Language, Memory, Spatial, and Executive Functions Modules
- NIH Executive Abilities: Measures and Instruments for Neurobehavioral Evaluation and Research (NIH EXAMINER):
  - Unstructured Task, Verbal Fluency, and Behavior Rating Scale
- California Verbal Learning Test, 3rd ed (CVLT-3), Brief Form
- Rey-Osterrieth Complex Figure Test (ROCFT)
- Trail Making Test
- Personality Assessment Inventory (PAI)

= NEUROBEHAVIORAL STATUS EXAM
<neurobehavioral-status-exam>
```r
# construct file path
patient <- "Nestor"
scale <- "NeuropsychEval-NSE-"
ext <- ".txt"
result <- ""
file <- file.path(paste0(scale, patient, ext))
```

== Notification/Informed Consent
<notificationinformed-consent>
I informed Mr. Lopez I was retained by his attorney’s office to conduct the current neuropsychological assessment. He was informed nothing we discussed would remain confidential, and information he provided during our meetings and the test results from my examination of him would become a part of my report, to be used at his attorney’s discretion. He was informed a copy of any report I produced would be sent to his attorney, possibly to the prosecuting attorney, and to the court. Mr. Lopez indicated he understood the purpose of the evaluation and the limitations of confidentiality of our interview and the testing I conducted.

== Reason for Referral
<reason-for-referral>
Nestor Lopez is a 23-year-old male who was referred for neuropsychological evaluation. Mr. Lopez has struggled academically since elementary school and has difficulty reading and spelling. He also presents with a history of attention problems, depression, and anxiety diagnosed during adolescence.

At the request of Deputy Federal Public Defender, Isabel Bussarakum, I conducted an initial remote telemedicine clinical interview with Mrs. Lopez on May 5, 2023. On May 6, 2023, I completed an in-person comprehensive 8-hour neuropsychological and psychodiagnostic assessment with Mr. Lopez.

This report is based on a review of available information contained in medical records, criminal records, and information gathered during the multiple days of evaluation. I reserve the right to change my opinions about the following should I be provided additional records that alter my understanding of the findings. My current employer, the Keck School of Medicine of the University of Southern California, has no involvement nor affiliation with this case.

== Background
<background>
I conducted a clinical interview with Mr. Lopez’s mother, Marisol Lopez, on May 5, 2023 using Zoom’s HIPAA-compliant telehealth platform to obtain information on his developmental and medical history. Mr. Lopez has faced challenges in his family, academic, and psychosocial history, and Mrs. Lopez provided insights into these areas and his early struggles with reading and academics. The remote interview lasted approximately 1 hour, 22 minutes.

=== Past Neuropsychological Test Results
<past-neuropsychological-test-results>
Patient denied having prior testing.

=== Developmental History
<developmental-history>
- Patient learned to walk at a later age of about a year and four months.

=== Other Medical History
<other-medical-history>
- #emph[Past:] Frequent nosebleeds as a child.
- #emph[Current:] None.
- #emph[Family:] Younger sibling has a history of nosebleeds.
- #emph[Medications:] None.
- #emph[Appetite/weight:] Normal, no changes.
- #emph[Sleep:] Normal, no changes.
- #emph[Alcohol/tobacco:] History of ETOH abuse; denied current use.
- #emph[Substance use/abuse:] History of cannabis abuse and misues of benzodiazapines; denied current use.
- #emph[Neurological:] Patient denied a family history of neurological conditions.

=== Surgical History
<surgical-history>
Patient denied.

=== Psychiatric History
<psychiatric-history>
From February 2015 to May 2015, Mr. Lopez participated in individual counseling sessions at Alternative Options Counseling Center, Inc. (Age 15, 10th grade, GPA: 2.3). The presenting concerns included "anger problems" and "sadness and depression." Additional concerns involved his behavior, such as being argumentative, experiencing academic difficulties, facing mood and depression issues, and exhibiting substance abuse. At that time, his documented substance use history included smoking cigarettes (first use: age 12), alcohol consumption (first use age 14), marijuana use (first use age 15), and benzodiazepines (e.g., Xanax; first use age 15). Symptoms of depression, feelings of hopelessness, worthlessness, long-term memory difficulties, and social isolation were also noted during that period. His therapist, Michael J. Leland, MA, observed that Mr. Lopez "has been open and receptive to the counseling process and he has displayed a good attitude."

=== Family History
<family-history>
Mr. Lopez faced numerous challenges throughout adolescence and young adulthood, including adjusting to new schools and coping with the loss of close friends and family members. His mother attributes some of his struggles to the family dynamics, notably having older siblings from different parents and their respective families’ influence.

He had a close bond with his two older brothers, especially the one who passed away. Unfortunately, they were not on good terms at the time of his brother’s death, causing him deep guilt and sorrow.

His relationship with his father was strained due to lack of involvement, but it has improved since Mr. Lopez’s legal issues began. Mrs. Lopez remains concerned about her son’s well-being and future.

=== Cultural/Social Background
<culturalsocial-background>
Mr. Lopez was born and raised in Los Angeles, California. He is in a relationship with his girlfriend, never married, and has no children. From a young age, he exhibited a friendly and talkative demeanor, easily making friends "wherever he went."

=== Educational History
<educational-history>
Mrs. Marisol Lopez recounted how Mr. Lopez struggled with reading and schoolwork from an early age. Mr. Lopez’s grandmother, who took care of him while both parents worked full-time, would often complete his homework for him to avoid him getting in trouble. This hindered his reading development and led to difficulties in school.

It was not until the family moved and Mr. Lopez switched to a different school district in sixth grade that the school identified his reading difficulties and placed him in an Individualized Education Program (IEP) to receive additional support. Parents denied the school’s recommendation for Mr. Lopez to repeat sixth grade. Mr. Lopez performed reasonably well in middle school when he was "motivated" and "determined to improve."

Overall, Mr. Lopez attended multiple schools throughout his academic career and faced several incidents, such as being threatened with a knife and getting caught using drugs on school premises.

Below are some excerpts from his school records:

==== #emph[Kindergarten]
<kindergarten>
#blockquote[
"Nestor sometimes makes attempts to work hard on his classwork and to follow directions and rules in the classroom. I would like to see him work harder on his work. He also needs to practice his letter recognition (both capitals and lowercase). His behavior towards others also needs to improve." (10/2004)
]

#blockquote[
"Nestor works hard and completes his work on time. He, however, needs to continue working on his ABCs, high frequency words, and numbers 1-30. Nestor also has a hard time keeping his hands and feet to himself, which affects the other students in the classroom." (04/2005)
]

==== Fourth grade
<fourth-grade>
#blockquote[
"Nestor is improving in his turning his math assignments, and beginning to write neatly in his work. Continue turning in all work in all areas and staying focused." (01/2009)
]

#blockquote[
"Nestor has done an amazing job on his behavior and showing great improvement. I am proud of his effort. Continue to be conscious of his choices." (06/2009)
]

==== High school transcript
<high-school-transcript>
Mr. Lopez graduated from high school with his diploma in June 2017 with an overall GPA of 2.31. His GPA ranged from 1.17 to 3.49. He attended several high school including a continuation school.

=== Occupational History
<occupational-history>
Mr. Lopez has had various jobs through agencies but had not held a long-term position. He currently works as a mechanic, work that he enjoys and for which he is reported to have strong skills.

= NEUROCOGNITIVE FINDINGS
<neurocognitive-findings>
```r
# Subset neurocognitive data
neurocog <-
  neuropsych |>
  dplyr::filter(test_type == "npsych_test")
# domain
neurocog <-
  neurocog |>
  dplyr::group_by(domain, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_domain = mean(z), z_sd_domain = sd(z)) |>
  dplyr::ungroup()
# subdomain
neurocog <-
  neurocog |>
  dplyr::group_by(subdomain, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_subdomain = mean(z), z_sd_subdomain = sd(z)) |>
  dplyr::ungroup()
# narrow
neurocog <-
  neurocog |>
  dplyr::group_by(narrow, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_narrow = mean(z), z_sd_narrow = sd(z)) |>
  dplyr::ungroup()
# pass
neurocog <-
  neurocog |>
  dplyr::group_by(pass, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_pass = mean(z), z_sd_pass = sd(z)) |>
  dplyr::ungroup()
# verbal
neurocog <-
  neurocog |>
  dplyr::group_by(verbal, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_verbal = mean(z), z_sd_verbal = sd(z)) |>
  dplyr::ungroup()
# timed
neurocog <-
  neurocog |>
  dplyr::group_by(timed, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_timed = mean(z), z_sd_timed = sd(z)) |>
  dplyr::ungroup()

# Subset neurobehavioral data
neurobehav <-
  neuropsych |>
  dplyr::filter(test_type == "rating_scale")
# domain
neurobehav <-
  neurobehav |>
  dplyr::group_by(domain, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_domain = mean(z), z_sd_domain = sd(z)) |>
  dplyr::ungroup()
# subdomain
neurobehav <-
  neurobehav |>
  dplyr::group_by(subdomain, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_subdomain = mean(z), z_sd_subdomain = sd(z)) |>
  dplyr::ungroup()
# narrow
neurobehav <-
  neurobehav |>
  dplyr::group_by(narrow, .add = TRUE) |>
  dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_narrow = mean(z), z_sd_narrow = sd(z)) |>
  dplyr::ungroup()

# Subset validity data
validity <-
  neuropsych |>
  dplyr::filter(test_type %in% c("performance_validity", "symptom_validity"))
# domain
validity <-
  validity |>
  dplyr::group_by(domain, .add = TRUE) |>
  # dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_domain = mean(z), z_sd_domain = sd(z)) |>
  dplyr::ungroup()
# subdomain
validity <-
  validity |>
  dplyr::group_by(subdomain, .add = TRUE) |>
  # dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_subdomain = mean(z), z_sd_subdomain = sd(z)) |>
  dplyr::ungroup()
# narrow
validity <-
  validity |>
  dplyr::group_by(narrow, .add = TRUE) |>
  # dplyr::filter(!is.na(percentile)) |>
  dplyr::mutate(z_mean_narrow = mean(z), z_sd_narrow = sd(z)) |>
  dplyr::ungroup()
```

```r
readr::write_csv(neuropsych, here::here(patient, "neuropsych.csv"))
readr::write_csv(neurocog, here::here(patient, "neurocog.csv"))
readr::write_csv(neurobehav, here::here(patient, "neurobehav.csv"))
readr::write_csv(validity, here::here(patient, "validity.csv"))

## read
neuropsych <- readr::read_csv(here::here(patient, "neuropsych.csv"))
```

```
Rows: 156 Columns: 30
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (18): filename, scale, range, ci_95, test, test_name, domain, subdomain,...
dbl  (7): raw_score, score, percentile, z, scaled_score, t_score, reliability
lgl  (5): score_adj, ci_95_lower, ci_95_upper, range_lower, range_upper

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
neurocog <- readr::read_csv(here::here(patient, "neurocog.csv"))
```

```
Rows: 68 Columns: 42
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (18): filename, scale, range, ci_95, test, test_name, domain, subdomain,...
dbl (19): raw_score, score, percentile, z, scaled_score, t_score, reliabilit...
lgl  (5): score_adj, ci_95_lower, ci_95_upper, range_lower, range_upper

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
neurobehav <- readr::read_csv(here::here(patient, "neurobehav.csv"))
```

```
Rows: 70 Columns: 36
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (14): filename, scale, range, ci_95, test, test_name, domain, subdomain,...
dbl (10): raw_score, score, percentile, z, z_mean_domain, z_sd_domain, z_mea...
lgl (12): pass, verbal, timed, score_adj, ci_95_lower, ci_95_upper, range_lo...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
validity <- readr::read_csv(here::here(patient, "validity.csv"))
```

```
Rows: 17 Columns: 36
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (13): filename, scale, range, test, test_name, domain, subdomain, narrow...
dbl  (9): raw_score, score, percentile, z, z_mean_domain, z_sd_domain, z_mea...
lgl (14): ci_95, pass, verbal, timed, score_adj, ci_95_lower, ci_95_upper, r...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

== Behavioral Observations
<behavioral-observations>
- #emph[Appearance:] Appropriate grooming and dress for context.
- #emph[Behavior/attitude:] Cooperative, engaged.
- #emph[Speech/language:] Fluent and normal in rate, volume, and prosody.
- #emph[Mood/affect:] Neutral, range was full and appropriate.
- #emph[Sensory/motor:] Performance was not limited by any obvious sensory or motor difficulties.
- #emph[Cognitive process:] Coherent and goal directed.
- #emph[Motivation/effort:] Normal.

== Intelligence/General Ability
<intelligencegeneral-ability>
Mr. Lopez’s general intelligence is in the Average range, with crystallized intelligence and working memory also in the Average range. Processing speed and overall cognitive efficiency are average, with no significant strengths or weaknesses. However, fluid reasoning is in the Low Average range, suggesting potential difficulties with abstract thinking and problem-solving. A comprehensive assessment of neuropsychological functioning, encompassing attentional and executive functioning, language, spatial processing, and memory, is also in the Low Average range.

```r
library(readr)
library(dplyr)
library(bwu)
```

```
Registered S3 method overwritten by 'quantmod':
  method            from
  as.zoo.data.frame zoo 
```

```

Attaching package: 'bwu'
```

```
The following object is masked _by_ '.GlobalEnv':

    neurocog
```

```r
# which csv file to use
pheno <- "iq"

if (pheno == "adhd" || pheno == "emotion") {
  csv <- "neurobehav.csv"
} else {
  csv <- "neurocog.csv"
}

# read data
file_path <- file.path(csv)
data <- readr::read_csv(file_path)
```

```
Rows: 68 Columns: 42
```

```
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (18): filename, scale, range, ci_95, test, test_name, domain, subdomain,...
dbl (19): raw_score, score, percentile, z, scaled_score, t_score, reliabilit...
lgl  (5): score_adj, ci_95_lower, ci_95_upper, range_lower, range_upper

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
# FILTER DATA
# filter by broad domain
domain <- "Intelligence/General Ability"
data <- dplyr::filter(data, domain == !!domain)

# filter by scale
filter_file <- c(
  ## ACS TOPF
  "Test of Premorbid Functioning",
  "TOPF Standard Score",
  ## WRAT5 Word Reading
  "Word Reading",
  ## NAB
  "NAB Total Index",
  "NAB Attention Index",
  "NAB Language Index",
  "NAB Memory Index",
  "NAB Spatial Index",
  "NAB Executive Functions Index",
  ## RBANS
  "RBANS Total Index",
  ## WISC/WAIS/WPPSI
  "Full Scale (FSIQ)",
  "General Ability (GAI)",
  "Cognitive Proficiency (CPI)",
  "Verbal Comprehension (VCI)",
  "Perceptual Reasoning (PRI)",
  "Fluid Reasoning (FRI)",
  "Visual Spatial (VSI)",
  "Vocabulary Acquisition (VAI)",
  "Nonverbal (NVI)",
  "Processing Speed (PSI)",
  "Working Memory (WMI)",
  ## composite scores
  "General Ability",
  "General Ability Index",
  "Crystallized Knowledge",
  "Crystallized Knowledge Index",
  "Fluid Reasoning",
  "Fluid Reasoning Index",
  "Cognitive Proficiency",
  "Cognitive Proficiency Index",
  "Working Memory",
  "Working Memory Index",
  "Processing Speed",
  "Processing Speed Index",
  "General Intelligence",
  "Cognitive Efficiency"
)
data <- dplyr::filter(data, scale %in% filter_file)
```

```r
library(glue)
library(purrr)
library(dplyr)

data_text <-
  data |>
  dplyr::arrange(dplyr::desc(percentile)) |>
  dplyr::distinct(.keep_all = FALSE)

data_text |>
  glue::glue_data() |>
  purrr::modify(purrr::as_mapper(~ paste0(.x))) |>
  cat(data_text$result,
    file = "_iq_text_raw.qmd",
    fill = TRUE,
    append = TRUE
  )
```

```r
# GT table
xfun::pkg_attach2(c("gt", "dplyr", "glue", "webshot2", "gtExtras", "bwu"))
```

```

Attaching package: 'gt'
```

```
The following object is masked from 'package:bwu':

    pct
```

```r
# more filtering for tables
# data <- dplyr::filter(data, scale != "Orientation")
# data <- dplyr::arrange(data, test_name)

# source note
source_note <- gt::md("*Note:* Index scores have a mean of 100 and a standard deviation of 15.")

# run fc
table_iq <- bwu::tbl_gt(
  data,
  table_name = "table_iq",
  source_note = source_note,
  title = NULL
)
table_iq
```

```r
gt::gtsave(table_iq, glue("table_iq", ".png"), expand = 10)
gt::gtsave(table_iq, glue("table_iq", ".pdf"), expand = 10)
```

<qtbl-iq>
#figure([#image("table_iq.png", width: 70%)],
  caption: [
    Intellectual and neuropsychological test scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
```r
# load packages
xfun::pkg_attach(c(
  "gt", "tidyverse", "glue", "webshot2", "ggplot2", "ggthemes",
  "scales", "bwu"
))

# more filtering for plots
data <- dplyr::filter(
  data, 
  scale %in% c("General Ability", "Crystallized Knowledge", "Fluid Reasoning")
)
data <- dplyr::filter(data, !is.na(percentile))

# will need to change these for each domain
fig_iq <- bwu::dotplot(
  data = data,
  x = data$z_mean_narrow,
  y = data$narrow,
  fill = x
)
fig_iq

ggplot2::ggsave("fig_iq.png")
ggplot2::ggsave("fig_iq.pdf")
```

```r
# markdown table; change labe if want to use
markdown_table_typst <- function(data) {
  data.frame(
    data
  ) |>
    kableExtra::kbl(
      format = "markdown",
      table.envir = "figure",
      longtable = FALSE,
      booktabs = TRUE,
      linesep = "",
      align = c("lccc"),
      caption = "iq",
      col.names = c("**Scale**", "**Score**", "**‰ Rank**", "**Range**")
    )
}

tbl_md <- markdown_table_typst(data[, c(2, 4, 5, 6)])
tbl_md
```
