#include <processing.h>
#include <unity.h>

void setUp(void) {}

void tearDown(void) {}

void test_addition(void) {
  TEST_ASSERT_EQUAL(5, add(2, 3));
  TEST_ASSERT_EQUAL(-1, add(-2, 1));
}

void test_subtraction(void) {
  TEST_ASSERT_EQUAL(-1, subtract(2, 3));
  TEST_ASSERT_EQUAL(-3, subtract(-2, 1));
}

int main(void) {
  UNITY_BEGIN();
  RUN_TEST(test_addition);
  RUN_TEST(test_subtraction);
  return UNITY_END();
}
