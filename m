Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0Aef-0008TG-NM
 for ath10k@lists.infradead.org; Tue, 10 May 2016 16:37:06 +0000
Date: Tue, 10 May 2016 22:06:27 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v2 1/5] ath10k: Ensure txrx-compl-task is stopped when
 cleaning htt-tx.
Message-ID: <20160510163627.GA21638@atheros-ThinkPad-T61>
References: <1459545132-11295-1-git-send-email-greearb@candelatech.com>
 <20160510064800.GC25626@atheros-ThinkPad-T61>
 <5731F2BF.90305@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5731F2BF.90305@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

> >
> >On Fri, Apr 01, 2016 at 02:12:08PM -0700, greearb@candelatech.com wrote:
> >>From: Ben Greear <greearb@candelatech.com>
> >>
> >>Otherwise, the txrx-compl-task may access some bad memory?
> >
> >good to mention when this happens, will be helpful ifsome one recreates
> >the issue and matches your call trace
> 
> The backtraces were all over the place because the driver was writing to
> memory after it was freed, so I am not sure they are worth while.  I'm sure I posted
> some to the mailing lists around the time where I was working on this, but since
> I was fighting several different problems, hard to know exactly what was what.

[shafi] sure Ben, lets wait for the comments from ath10k reviewers.

> 
> Thanks,
> Ben
> 
> >>Signed-off-by: Ben Greear <greearb@candelatech.com>
> >>---
> >>  drivers/net/wireless/ath/ath10k/htt_tx.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >>diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
> >>index 07b960e..58e88d3 100644
> >>--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
> >>+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
> >>@@ -376,6 +376,8 @@ void ath10k_htt_tx_free(struct ath10k_htt *htt)
> >>  {
> >>  	int size;
> >>
> >>+	tasklet_kill(&htt->txrx_compl_task);
> >>+
> >>  	idr_for_each(&htt->pending_tx, ath10k_htt_tx_clean_up_pending, htt->ar);
> >>  	idr_destroy(&htt->pending_tx);
> >>
> >>--
> >>2.4.3
> >
> >regards,
> >shafi
> >
> >>
> >>
> >>_______________________________________________
> >>ath10k mailing list
> >>ath10k@lists.infradead.org
> >>http://lists.infradead.org/mailman/listinfo/ath10k
> >
> >_______________________________________________
> >ath10k mailing list
> >ath10k@lists.infradead.org
> >http://lists.infradead.org/mailman/listinfo/ath10k
> >
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
