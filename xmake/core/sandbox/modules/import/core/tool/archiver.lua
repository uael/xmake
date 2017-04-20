--!The Make-like Build Utility based on Lua
--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2017, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        archiver.lua
--

-- define module
local sandbox_core_tool_archiver = sandbox_core_tool_archiver or {}

-- load modules
local platform      = require("platform/platform")
local archiver      = require("tool/archiver")
local raise         = require("sandbox/modules/raise")

-- archive file or directory
function sandbox_core_tool_archiver.archive(filedir, outputfile)
 
    -- get the archiver instance
    local instance, errors = archiver.load_from_file(outputfile)
    if not instance then
        raise(errors)
    end

    -- archive it
    local ok, errors = instance:archive(filedir, outputfile)
    if not ok then
        raise(errors)
    end
end

-- return module
return sandbox_core_tool_archiver
