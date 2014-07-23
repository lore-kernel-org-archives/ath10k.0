Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XA0U9-0007mY-8T
 for ath10k@lists.infradead.org; Wed, 23 Jul 2014 17:37:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 1/5] ath10k:  provide firmware crash info via debugfs.
References: <1406133487-7541-1-git-send-email-greearb@candelatech.com>
Date: Wed, 23 Jul 2014 20:37:23 +0300
In-Reply-To: <1406133487-7541-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 23 Jul 2014 09:38:03
 -0700")
Message-ID: <87a980rn70.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Store the firmware crash registers and last 128 or so
> firmware debug-log ids and present them to user-space
> via debugfs.
>
> Should help with figuring out why the firmware crashed.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> v4:  Use _bh spinlock variants everywhere.
>
> For patch 0005:  Fix kmalloc/vfree problem. 

I see quite a few sparse and checkpatch warnings. But I think we can
ignore about LINUX_VERSION_CODE.

drivers/net/wireless/ath/ath10k/debug.c: In function 'ath10k_build_dump_file':
drivers/net/wireless/ath/ath10k/debug.c:685:2: warning: right shift count >= width of type [enabled by default]
drivers/net/wireless/ath/ath10k/debug.c:687:2: warning: right shift count >= width of type [enabled by default]
drivers/net/wireless/ath/ath10k/debug.c:685:49: warning: shift too big (32) for type long
drivers/net/wireless/ath/ath10k/debug.c:687:51: warning: shift too big (32) for type long
drivers/net/wireless/ath/ath10k/core.c:491:53: warning: cast to restricted __le32
drivers/net/wireless/ath/ath10k/core.c:492:52: warning: cast to restricted __le32
drivers/net/wireless/ath/ath10k/core.c:493:53: warning: cast to restricted __le32
drivers/net/wireless/ath/ath10k/core.c:494:52: warning: cast to restricted __le32
drivers/net/wireless/ath/ath10k/core.c:491: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/core.c:492: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/core.c:493: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/core.c:494: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/core.c:495: CHECK: multiple assignments should be avoided
drivers/net/wireless/ath/ath10k/debug.c:680: WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
drivers/net/wireless/ath/ath10k/debug.c:696: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/debug.c:703: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/debug.c:725: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/debug.c:733: WARNING: line over 80 characters

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
