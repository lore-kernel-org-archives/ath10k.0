Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyj7U-0004oI-Ka
 for ath10k@lists.infradead.org; Mon, 15 Jul 2013 13:48:48 +0000
Date: Mon, 15 Jul 2013 21:43:37 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: drivers/net/wireless/ath/ath10k/core.c:79: warning: comparison
 is always true due to limited range of data type
Message-ID: <20130715134337.GE31056@localhost>
References: <51de5541.JaeZCuQB+9U6CmRo%fengguang.wu@intel.com>
 <20130711072220.GA9811@localhost>
 <8761wcot4n.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8761wcot4n.fsf@kamboji.qca.qualcomm.com>
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
Cc: kbuild-all@01.org, ath10k@lists.infradead.org

On Mon, Jul 15, 2013 at 04:22:16PM +0300, Kalle Valo wrote:
> Hi Fengguang,
> 
> Fengguang Wu <fengguang.wu@intel.com> writes:
> 
> > FYI, there are new compile warnings show up in
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   6d128e1e72bf082542e85f72e6b7ddd704193588
> > commit: 5e3dd157d7e70f0e3cea3f2573ed69fb156a19d5 ath10k: mac80211 driver for Qualcomm Atheros 802.11ac CQA98xx devices
> > date:   4 weeks ago
> > config: make ARCH=avr32 allyesconfig
> >
> > All warnings:
> >
> >    In file included from include/uapi/linux/param.h:4,
> >                     from include/linux/timex.h:63,
> >                     from include/linux/jiffies.h:8,
> >                     from include/linux/ktime.h:25,
> >                     from include/linux/timer.h:5,
> >                     from include/linux/workqueue.h:8,
> >                     from include/linux/srcu.h:34,
> >                     from include/linux/notifier.h:15,
> >                     from include/linux/memory_hotplug.h:6,
> >                     from include/linux/mmzone.h:771,
> >                     from include/linux/gfp.h:4,
> >                     from include/linux/kmod.h:22,
> >                     from include/linux/module.h:13,
> >                     from drivers/net/wireless/ath/ath10k/core.c:18:
> >    arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
> 
> This doesn't look like fault of ath10k.

Yes, sorry - I should mention that only the lines prefixed with ">>"
are new error/warnings probably related to the commit.

Thanks,
Fengguang

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
