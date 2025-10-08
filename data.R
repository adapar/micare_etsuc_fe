DATA_FN = file.path("data", "src", "Base1.dta")

DATA = readstata13::read.dta13(DATA_FN, convert.factors = TRUE, nonint.factors = TRUE, generate.factors = TRUE)

VAR_LABELS = attr(DATA, "var.labels")
