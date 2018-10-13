Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBNci-0007dx-Js
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 17:22:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: management tx ack rssi capability check
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1536560670-4292-1-git-send-email-bpothuno@codeaurora.org>
References: <1536560670-4292-1-git-send-email-bpothuno@codeaurora.org>
Message-Id: <20181013172234.4459560A98@smtp.codeaurora.org>
Date: Sat, 13 Oct 2018 17:22:34 +0000 (UTC)
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

Balaji Pothunoori <bpothuno@codeaurora.org> wrote:

> Adding WMI service check for management tx ack rssi support; this is
> done to maintain common avg ack signal in user level for both data
> and management tx ack packet.
> 
> Tested on QCA4019(fw version-10.4-3.2.1-00063).
> 
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6bc17950f4b2 ath10k: management tx ack rssi capability check

-- 
https://patchwork.kernel.org/patch/10593587/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
