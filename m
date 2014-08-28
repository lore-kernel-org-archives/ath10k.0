Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMrHb-0007WJ-RO
 for ath10k@lists.infradead.org; Thu, 28 Aug 2014 04:26:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k:  save firmware debug log messages.
References: <1409172214-24149-1-git-send-email-greearb@candelatech.com>
Date: Thu, 28 Aug 2014 07:25:17 +0300
In-Reply-To: <1409172214-24149-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 27 Aug 2014 13:43:34
 -0700")
Message-ID: <87lhq9utoy.fsf@kamboji.qca.qualcomm.com>
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
> They may be dumped through the firmware dump debugfs
> file.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> v3:  Re-worked byte-order related stuff again,
>    thanks to Michael's comments on IRC.
>    Fix problem reported by smatch, possible NPE.
>
>
> v2:  Remove some #ifdefs
>      rebase:  Fix logging, deal with byte-order differences
>        when reading firmware memory.
>
> Tested on x86-64.  smatch is clean, but it seems it cannot detect
> le v/s cpu endian issues on x86-64, so I could have easily missed
> something.

Yeah, sparse warns about endian stuff. But let me do a proper review
before sending a new version.

drivers/net/wireless/ath/ath10k/debug.c:830:34: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/debug.c:830:34:    expected unsigned int [unsigned] [usertype] next_idx
drivers/net/wireless/ath/ath10k/debug.c:830:34:    got restricted __le32 [usertype] <noident>
drivers/net/wireless/ath/ath10k/debug.c:831:35: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/debug.c:831:35:    expected unsigned int [unsigned] [usertype] first_idx
drivers/net/wireless/ath/ath10k/debug.c:831:35:    got restricted __le32 [usertype] <noident>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
