Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyijw-0004Fa-04
 for ath10k@lists.infradead.org; Mon, 15 Jul 2013 13:22:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: drivers/net/wireless/ath/ath10k/core.c:79: warning: comparison is
 always true due to limited range of data type
References: <51de5541.JaeZCuQB+9U6CmRo%fengguang.wu@intel.com>
 <20130711072220.GA9811@localhost>
Date: Mon, 15 Jul 2013 16:22:16 +0300
In-Reply-To: <20130711072220.GA9811@localhost> (Fengguang Wu's message of
 "Thu, 11 Jul 2013 15:22:20 +0800")
Message-ID: <8761wcot4n.fsf@kamboji.qca.qualcomm.com>
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
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, ath10k@lists.infradead.org

Hi Fengguang,

Fengguang Wu <fengguang.wu@intel.com> writes:

> FYI, there are new compile warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6d128e1e72bf082542e85f72e6b7ddd704193588
> commit: 5e3dd157d7e70f0e3cea3f2573ed69fb156a19d5 ath10k: mac80211 driver for Qualcomm Atheros 802.11ac CQA98xx devices
> date:   4 weeks ago
> config: make ARCH=avr32 allyesconfig
>
> All warnings:
>
>    In file included from include/uapi/linux/param.h:4,
>                     from include/linux/timex.h:63,
>                     from include/linux/jiffies.h:8,
>                     from include/linux/ktime.h:25,
>                     from include/linux/timer.h:5,
>                     from include/linux/workqueue.h:8,
>                     from include/linux/srcu.h:34,
>                     from include/linux/notifier.h:15,
>                     from include/linux/memory_hotplug.h:6,
>                     from include/linux/mmzone.h:771,
>                     from include/linux/gfp.h:4,
>                     from include/linux/kmod.h:22,
>                     from include/linux/module.h:13,
>                     from drivers/net/wireless/ath/ath10k/core.c:18:
>    arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined

This doesn't look like fault of ath10k.

>    In file included from arch/avr32/include/asm/param.h:4,
>                     from include/uapi/linux/param.h:4,
>                     from include/linux/timex.h:63,
>                     from include/linux/jiffies.h:8,
>                     from include/linux/ktime.h:25,
>                     from include/linux/timer.h:5,
>                     from include/linux/workqueue.h:8,
>                     from include/linux/srcu.h:34,
>                     from include/linux/notifier.h:15,
>                     from include/linux/memory_hotplug.h:6,
>                     from include/linux/mmzone.h:771,
>                     from include/linux/gfp.h:4,
>                     from include/linux/kmod.h:22,
>                     from include/linux/module.h:13,
>                     from drivers/net/wireless/ath/ath10k/core.c:18:
>    arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
>    drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_check_fw_version':
>>> drivers/net/wireless/ath/ath10k/core.c:79: warning: comparison is
always true due to limited range of data type

Geert already reported this, I'll fix it.

>    In file included from include/uapi/linux/param.h:4,
>                     from include/linux/timex.h:63,
>                     from include/linux/jiffies.h:8,
>                     from include/linux/ktime.h:25,
>                     from include/linux/timer.h:5,
>                     from include/linux/workqueue.h:8,
>                     from include/linux/srcu.h:34,
>                     from include/linux/notifier.h:15,
>                     from include/linux/memory_hotplug.h:6,
>                     from include/linux/mmzone.h:771,
>                     from include/linux/gfp.h:4,
>                     from include/linux/kmod.h:22,
>                     from include/linux/module.h:13,
>                     from drivers/net/wireless/ath/ath10k/core.c:18:
>    arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined

Same as the first warning.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
