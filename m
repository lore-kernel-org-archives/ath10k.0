Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFrmL-0004Qf-DM
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 21:32:49 +0000
Message-ID: <53E541E6.50707@candelatech.com>
Date: Fri, 08 Aug 2014 14:32:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/7] ath10k: firmware crash dump
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
In-Reply-To: <20140808201815.20713.85582.stgit@potku.adurom.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 08/08/2014 01:28 PM, Kalle Valo wrote:
> Hi,
> 
> here's my reworked Ben's patchset adding firmware crash dump support to ath10k.
> Unfortunately this crashes when reading the stack dump from the firmware but
> time run out for me to fix that and I wanted to send this for comments anyway.
> 
> I did quite a lot of changes, basically to simplify the code, remove ifdefs and
> so on. Here's some sort of list what I did:
> 
> * dump_data->tv_sec and tv_nsec to 64 bits (because long can be 32 bits
>   on some platforms)

I did u32 on purpose because I know how to do ntohl, htonl if I need
to flip the machine order in user-space.  Is there something similar
for 64-bit numbers?

> * fix long lines
> 
> * renamed ath10k_dbg_save_fw_dbg_buffer() to ath10k_debug_dbglog_add()
> 
> * add helpers for ath10k_pci_diag* functions
> 
> * refactor and rename ath10k_pci_hif_dump_area()
> 
> * latest crash dump is always stored (instead of the oldest unread)

At least with the kernel, the first crash is normally the most useful,
so I figured the same would be true of the firmware (a firmware crash
is excellent way to find hidden bugs in the driver, so upon crash/reload,
it is more likely that the driver will be screwed up and thus mis-configure
firmware...)

> 
> * add ath10k_debug_get_fw_crash_data()
> 
> * move fw_r?m_bss_* fields to ar->fw
> 
> * struct ath10k_fw_crash_data is allocated with vmalloc()
> 
> * atomic allocation in ath10k_pci_dump_bss() is bad, fix that by using vmalloc
>   in module initialisation
> 
> * separate FW IE entries for BSS regions
> 
> * don't use ath10k_err()
> 
> * simplify locking and memory allocation for FW IE handling
> 
> * add uuid
> 
> * move struct ath10k_dump_file_data and enum ath10k_fw_error_dump_type to debug.c
> 
> * function and variable naming, using ath10k_fw_crash_ prefix etc
> 
> * change warning and debug messages to follow ath10k style
> 
> * add ath10k_debug_get_new_fw_crash_data() to avoid ifdefs in pci.c
> 
> And I still have TODO:
> 
> * rename crashed_since_read to crashed?
> 
> * atomic allocation in ath10k_pci_dump_dbglog() is bad. Should we
>   allocate a big buffer with vmalloc and use that?

dbglog entries are probably never going to be large, they are currently
in the 2k range, so vmalloc is likely overkill.  If you want it allocated
at startup, just choose a 4k buffer size, can put the buffer right in
the debug struct or something like that so you don't even have more memory
management to deal with.  It will waste 4k of RAM for normal use, however.

> 
> * what should ath10k_fw_error_dump_open() do if firmware hasn't
>   crashed? check crashed_since_read and return zero len file? or an
>   error code? -ENOMSG?

Maybe a mostly empty crash log with just the header, should be easy enough
to figure out it's not really a crash.  If we use udev to gather these,
it is likely to be stupid shell scripts doing a lot of the work, so
being clever on return codes might not be helpful.

> * should the crash dump file actually be in little endian? would that
>   be easier/simpler?

I think it is about the same amount of work in user-space, so I'd
keep the kernel simple and dump in the CPU's endian-ness.  I don't
care that much either way, however.

> * should ath10k_pci_hif_dump_area() hold the lock all the time? That
>   way we would guarantee that changes to ath10k_fw_crash_data are
>   atomic.

I don't think it's worth trying to do that.

I'll go dig through the patches in a bit..have to figure out why systemd
is fcked up on my lab machine first. :P

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
