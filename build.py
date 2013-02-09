#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Adobe Flex Build system - connect to flex remote compile shell and run build

from rook.de import flex
import time
import os
import shutil

sdk = flex.SDK('4.6.0 build 23201')

sdk.swf('Robotlegs2Test', 'src/example/Main.mxml',
        output='bin/Robotlegs2Test.swf', 
        requires=['robotlegs-framework-v2.0.0b4',
                  'Swiftsuspenders-v2.0.0rc3stray1'],
        args=['-static-link-runtime-shared-libraries=true', '-debug'])
