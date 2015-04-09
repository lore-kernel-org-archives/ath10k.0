Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgB73-0005ME-OV
 for ath10k@lists.infradead.org; Thu, 09 Apr 2015 11:59:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: replenish htc tx credits always
References: <1427368943-29526-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 9 Apr 2015 14:58:54 +0300
In-Reply-To: <1427368943-29526-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 26 Mar 2015 11:22:23 +0000")
Message-ID: <874mopfr7l.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> There's always at most 2 credits and it makes
> little sense to set the
> ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE flag
> conditionally.
>
> This seems to fix some random issues with tx
> credit starvation on WLAN.RM.2.0-00073 I've been
> seeing. Note: this isn't related to wmi mgmt tx.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
