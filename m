Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxPma-0002Uh-8b
 for ath10k@lists.infradead.org; Wed, 05 Sep 2018 04:51:13 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCHv2 3/3] ath10k: average ack rssi support for data frames
References: <1523890122-23952-1-git-send-email-bpothuno@codeaurora.org>
 <1523890122-23952-4-git-send-email-bpothuno@codeaurora.org>
Date: Wed, 05 Sep 2018 07:50:25 +0300
In-Reply-To: <1523890122-23952-4-git-send-email-bpothuno@codeaurora.org>
 (Balaji Pothunoori's message of "Mon, 16 Apr 2018 20:18:42 +0530")
Message-ID: <87r2i87dke.fsf@kamboji.qca.qualcomm.com>
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
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Balaji Pothunoori <bpothuno@codeaurora.org> writes:

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

There were two new warnings:

drivers/net/wireless/ath/ath10k/htt_rx.c:1928: line over 90 characters
drivers/net/wireless/ath/ath10k/mac.c:8511: Alignment should match open parenthesis

I fixed those in the pending branch. The first one I solved by adding a
temporary variable 'msdus'. Please review:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e4ac90b9c915a3b86eeef60509a6d2bb85d3507d

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
