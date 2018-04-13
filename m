Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6zCF-0006OV-Ls
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 13:57:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/3] ath10k: average ack rssi support for data frames
References: <1523619357-1963-4-git-send-email-bpothuno@codeaurora.org>
Date: Fri, 13 Apr 2018 16:56:45 +0300
In-Reply-To: <1523619357-1963-4-git-send-email-bpothuno@codeaurora.org>
 (Balaji Pothunoori's message of "Fri, 13 Apr 2018 17:05:57 +0530")
Message-ID: <87efjjqkf6.fsf@kamboji.qca.qualcomm.com>
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
> ack_rssi else host can ignore the ack_rssi field.
>
> Note: This patch is depends on cfg80211 patch.
>
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c   |  4 ++++
>  drivers/net/wireless/ath/ath10k/htt.h    |  6 +++++-
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 21 +++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/mac.c    |  4 ++++
>  drivers/net/wireless/ath/ath10k/wmi.h    |  8 ++++++++
>  5 files changed, 42 insertions(+), 1 deletion(-)

Usually notes like above are better to put under "---" line, this way
git-am will not include in the git commit log.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
