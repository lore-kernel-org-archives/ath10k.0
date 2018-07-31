Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkPOS-0002hw-1u
 for ath10k@lists.infradead.org; Tue, 31 Jul 2018 07:48:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH RESENT] ath10k: Prevent active scans on potential unusable
 channels
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180726135948.29160-1-sven@narfation.org>
References: <20180726135948.29160-1-sven@narfation.org>
Message-Id: <20180731074821.BB9C1602D7@smtp.codeaurora.org>
Date: Tue, 31 Jul 2018 07:48:21 +0000 (UTC)
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
To: Sven Eckelmann <sven@narfation.org>
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org, Simon Wunderlich <simon.wunderlich@openmesh.com>, ath10k@lists.infradead.org, Sven Eckelmann <sven.eckelmann@openmesh.com>

Sven Eckelmann <sven@narfation.org> wrote:

> The QCA4019 hw1.0 firmware 10.4-3.2.1-00050 and 10.4-3.5.3-00053 (and most
> likely all other) seem to ignore the WMI_CHAN_FLAG_DFS flag during the
> scan. This results in transmission (probe requests) on channels which are
> not "available" for transmissions.
> 
> Since the firmware is closed source and nothing can be done from our side
> to fix the problem in it, the driver has to work around this problem. The
> WMI_CHAN_FLAG_PASSIVE seems to be interpreted by the firmware to not
> scan actively on a channel unless an AP was detected on it. Simple probe
> requests will then be transmitted by the STA on the channel.
> 
> ath10k must therefore also use this flag when it queues a radar channel for
> scanning. This should reduce the chance of an active scan when the channel
> might be "unusable" for transmissions.
> 
> Fixes: e8a50f8ba44b ("ath10k: introduce DFS implementation")
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3f2591115838 ath10k: prevent active scans on potential unusable channels

-- 
https://patchwork.kernel.org/patch/10545939/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
