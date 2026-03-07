#include <gtest/gtest.h>

extern "C" 
{
  #include "math/add.h"
}

TEST(AddSaturating, NoSaturation) {
    EXPECT_EQ(add_saturating(5, 6, 100), 11);
}

TEST(AddSaturating, PositiveSaturation) {
    EXPECT_EQ(add_saturating(90, 20, 100), 100);
}

TEST(AddSaturating, NegativeSaturation) {
    EXPECT_EQ(add_saturating(-90, -20, 100), -100);
}