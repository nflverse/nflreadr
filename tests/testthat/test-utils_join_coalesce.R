test_that("join coalesce function works", {
  # two dataframes, some with missing variables (e.g. in `a`)
  x <- data.frame(id1 = c(NA_character_,letters[1:4]), a = c(1,NA,3,NA,5), b = 1:5 * 10)
  y <- data.frame(id2 = c(letters[3:11],NA_character_), a = -(1:10), c = 1:10 * 100)

  left1 <- join_coalesce(x,y, by = c("id1"="id2"))
  left2 <- join_coalesce(x,y, by.x = "id1", by.y = "id2")
  inner1 <- join_coalesce(x,y, by = c("id1"="id2"), type = "inner")
  full1 <- join_coalesce(x,y, by = c("id1"="id2"), type = "full")

  expect_equal(left1,left2) # both join-by methods work the same
  expect_equal(sum(is.na(left1$a)), 1) # one NA on left join
  expect_equal(sum(is.na(full1$a)), 1) # one NA on full join
  expect_equal(sum(is.na(inner1$a)), 0) # no NAs on inner join
  expect_equal(nrow(left1), nrow(x)) # left join creates same length as x
  expect_equal(nrow(left2), nrow(x))
  expect_equal(nrow(inner1), 2) # two rows in common
  expect_equal(nrow(full1), 13) # 13 rows on full join

})
