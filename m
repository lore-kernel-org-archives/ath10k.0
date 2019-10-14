Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJwa6-0003UI-MB
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 09:24:00 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 2/2] ath10k: Enable Airtime-based Queue Limit (AQL)
References: <20191011022413.176208-1-kyan@google.com>
 <20191011022413.176208-3-kyan@google.com>
Date: Mon, 14 Oct 2019 12:23:49 +0300
In-Reply-To: <20191011022413.176208-3-kyan@google.com> (Kan Yan's message of
 "Thu, 10 Oct 2019 19:24:13 -0700")
Message-ID: <87lftny922.fsf@kamboji.qca.qualcomm.com>
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
To: Kan Yan <kyan@google.com>
Cc: make-wifi-fast@lists.bufferbloat.net, toke@redhat.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, yiboz@codeaurora.org, johannes@sipsolutions.net, nbd@nbd.name

Kan Yan <kyan@google.com> writes:

> Calculate the estimated airtime pending in the txqs and apply AQL to
> prevent excessive amounts of packets being queued in the firmware queue.
>
> Signed-off-by: Kan Yan <kyan@google.com>

Forgot to mention earlier that please add tested hardware and firmware
versions:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#guidelines

I can also add that during commit, no need to resend because of this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
