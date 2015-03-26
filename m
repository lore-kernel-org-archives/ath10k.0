Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb9Up-0007F4-Qm
 for ath10k@lists.infradead.org; Thu, 26 Mar 2015 15:15:00 +0000
Message-ID: <5514225D.5070409@candelatech.com>
Date: Thu, 26 Mar 2015 08:14:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: replenish htc tx credits always
References: <1427368943-29526-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1427368943-29526-1-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 03/26/2015 04:22 AM, Michal Kazior wrote:
> There's always at most 2 credits and it makes
> little sense to set the
> ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE flag
> conditionally.
> 
> This seems to fix some random issues with tx
> credit starvation on WLAN.RM.2.0-00073 I've been
> seeing. Note: this isn't related to wmi mgmt tx.

Good to see this in.

This will help when using CT firmware as well, since it makes
better use of tx-credits-update than stock 10.1.467 at least.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
