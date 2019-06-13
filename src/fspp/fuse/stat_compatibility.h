#pragma once
#ifndef MESSMER_FSPP_FUSE_STATCOMPATIBILITY_H
#define MESSMER_FSPP_FUSE_STATCOMPATIBILITY_H

namespace fspp {
	namespace fuse {

		// Dokan has a different "struct stat" called "fspp::fuse::STAT", but it's compatible.
		// To make our code work with both, we use "STAT" everywhere instead of "stat"
		// and define it here to the correct type

#if defined(_MSC_VER)

#include <fuse/fuse.h>

		using STAT = fuse_stat;
	}
}
using mode_t = fuse_mode_t;
using uid_t = fuse_uid_t;
using gid_t = fuse_gid_t;
using statvfs = fuse_statvfs;
namespace fspp {
	namespace fuse {

#else

#include <sys/stat.h>
    typedef struct ::stat STAT;

#endif

}
}

#endif
