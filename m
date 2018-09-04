Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxAIy-0001Q1-K8
 for ath10k@lists.infradead.org; Tue, 04 Sep 2018 12:19:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: average ack rssi support for data frames
References: <1536062951-17955-1-git-send-email-bpothuno@codeaurora.org>
Date: Tue, 04 Sep 2018 15:19:22 +0300
In-Reply-To: <1536062951-17955-1-git-send-email-bpothuno@codeaurora.org>
 (Balaji Pothunoori's message of "Tue, 4 Sep 2018 17:39:11 +0530")
Message-ID: <87va7l78vp.fsf@kamboji.qca.qualcomm.com>
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
To: Balaji Pothunoori <bpothuno@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Balaji Pothunoori <bpothuno@codeaurora.org> writes:

> Average ack rssi value is weighted average of ack rssi for
> no of msdu's has been sent.
> This feature is enabled by the host driver if firmware is capable.
> After receiving event from host, firmware allocates the necessary
> memory to store the ack_rssi for data packets during the init time.
>
> After each successful transmission, If tx completion status is OK
> and 24th bit is set in HTT message header then host will fetch the
> ack_rssi else host can ignore the ack_rssi field
>
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> ---
> v2:
>    Addressed ath10k-check warnings
> v3:
>    cfg80211/mac80211 changes are already merged hence 
>    rebased ath10k patch alone.

Heh, we had a collision. Just 2 hours ago I rebased v2, fixed some
conflicts and it's now in pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=ca376d236d335ccc9475ea1ab49df4643d8246b7

So please check that, and if it's good most likely I'll drop this v3.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
