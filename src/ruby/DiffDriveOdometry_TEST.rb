# Copyright (C) 2020 Open Source Robotics Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/usr/bin/env ruby

require 'test/unit/ui/console/testrunner'
require 'test/unit'
require 'math'
require 'time'

class DiffDriveOdometry_TEST < Test::Unit::TestCase
  def test_diff_drive_odometry
    odom = Ignition::Math::DiffDriveOdometry.new

    assert(odom.Heading().Radian() == 0, "Heading value should equal zero")
    assert(odom.X() == 0, "X value should equal zero")
    assert(odom.Y() == 0, "Y value should equal zero")
    assert(odom.LinearVelocity() == 0, "LinearVelocity value should equal zero")
    assert(odom.AngularVelocity().Radian() == 0, "AngularVelocity value should equal zero")

    wheelSeparation = 2.0
    wheelRadius = 0.5
    wheelCircumference = 2 * 3.1416 * wheelRadius

    # This is the linear distance traveled per degree of wheel rotation.
    distPerDegree = wheelCircumference / 360.0

    a = DateTime.now
    odom.SetWheelParams(wheelSeparation, wheelRadius, wheelRadius)
    odom.init(0)

  end

end

exit Test::Unit::UI::Console::TestRunner.run(DiffDriveOdometry_TEST).passed? ? 0 : -1
