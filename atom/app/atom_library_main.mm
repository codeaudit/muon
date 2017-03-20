// Copyright (c) 2013 GitHub, Inc.
// Use of this source code is governed by the MIT license that can be
// found in the LICENSE file.

#include "atom/app/atom_library_main.h"

#include "atom/app/atom_main_delegate.h"
// #include "atom/app/node_main.h"
#include "atom/common/atom_command_line.h"
#include "base/at_exit.h"
#include "base/i18n/icu_util.h"
#include "base/mac/bundle_locations.h"
#include "base/mac/scoped_nsautorelease_pool.h"
#include "brightray/common/mac/main_application_bundle.h"
#include "content/public/app/content_main.h"

extern "C" {
__attribute__((visibility("default")))
int ChromeMain(int argc, const char** argv);
}

int ChromeMain(int argc, const char* argv[]) {
  atom::AtomMainDelegate delegate;
  content::ContentMainParams params(&delegate);
  params.argc = argc;
  params.argv = argv;
  atom::AtomCommandLine::Init(argc, argv);
  return content::ContentMain(params);
}
