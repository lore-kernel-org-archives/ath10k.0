Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG4GN-0001dY-R5
 for ath10k@lists.infradead.org; Tue, 08 May 2018 15:10:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2,3/3] ath10k: average ack rssi support for data frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1523890122-23952-4-git-send-email-bpothuno@codeaurora.org>
References: <1523890122-23952-4-git-send-email-bpothuno@codeaurora.org>
Message-Id: <20180508151035.C8C2C605FD@smtp.codeaurora.org>
Date: Tue,  8 May 2018 15:10:35 +0000 (UTC)
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
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Balaji Pothunoori <bpothuno@codeaurora.org> wrote:

> Average ack rssi value is weighted average of ack rssi for
> no of msdu's has been sent.
> This feature is enabled by the host driver if firmware is capable.
> After receiving event from host, firmware allocates the necessary
> memory to store the ack_rssi for data packets during the init time.
> 
> After each successful transmission, If tx completion status is OK
> and 24th bit is set in HTT message header then host will fetch the
> ack_rssi else host can ignore the ack_rssi field.
> 
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>

A note to myself that this depends on:

cc60dbbfed8f mac80211: average ack rssi support for data frames

Currently in mac80211-next.

-- 
https://patchwork.kernel.org/patch/10343153/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
