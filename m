Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTuWv-0004ai-CV
 for ath10k@lists.infradead.org; Fri, 15 Jun 2018 19:37:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 109/109]
 drivers/net/wireless/ath/ath10k/snoc.h:22:10: fatal error: qmi.h: No such
 file or directory
References: <201806160045.dJL4pspo%fengguang.wu@intel.com>
Date: Fri, 15 Jun 2018 22:36:48 +0300
In-Reply-To: <201806160045.dJL4pspo%fengguang.wu@intel.com> (kbuild test
 robot's message of "Sat, 16 Jun 2018 00:08:48 +0800")
Message-ID: <87sh5nhmen.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: kbuild test robot <lkp@intel.com>
Cc: Govind Singh <govinds@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   59ff1228bc7ecec5ed2558e0e6d33423da443180
> commit: 59ff1228bc7ecec5ed2558e0e6d33423da443180 [109/109] ath10k: Add QMI message handshake for wcn3990 client
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 59ff1228bc7ecec5ed2558e0e6d33423da443180
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=arm 
>
> All errors (new ones prefixed by >>):
>
>>> make[6]: *** No rule to make target 'drivers/net/wireless/ath/ath10k/qmi.o', needed by 'drivers/net/wireless/ath/ath10k/ath10k_snoc.o'.
>    make[6]: *** [drivers/net/wireless/ath/ath10k/snoc.o] Error 1
>    make[6]: Target '__build' not remade because of errors.
> --
>    In file included from drivers/net/wireless/ath/ath10k/snoc.c:29:0:
>>> drivers/net/wireless/ath/ath10k/snoc.h:22:10: fatal error: qmi.h: No such file or directory
>     #include "qmi.h"
>              ^~~~~~~
>    compilation terminated.
>
> vim +22 drivers/net/wireless/ath/ath10k/snoc.h
>
>     19	
>     20	#include "hw.h"
>     21	#include "ce.h"
>   > 22	#include "qmi.h"
>     23	

This was my bad. While fixing some conflicts manually I forgot to add
qmi.c and qmi.h to the commit. I fixed that now in the pending branch
and hopefully it builds this time.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
