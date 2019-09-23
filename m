Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJaH-00020Y-Hq
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 08:20:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/2] Add support for per peer HTT tx stats for WCN3990
References: <1551251581-21193-1-git-send-email-svishnoi@codeaurora.org>
Date: Mon, 23 Sep 2019 11:20:31 +0300
In-Reply-To: <1551251581-21193-1-git-send-email-svishnoi@codeaurora.org>
 (Surabhi Vishnoi's message of "Wed, 27 Feb 2019 12:42:59 +0530")
Message-ID: <875zlja0fk.fsf@codeaurora.org>
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> writes:

> WCN3990 firmware sends the HTT_TLV_T2H_MSG_TYPE_PEER_STATS in tlv
> format so the handling of this message has to be done in different
> manner.
>
> This patchset adds support to attach rx_ops based on htt version
> and adds the handling of HTT_TLV_T2H_MSG_TYPE_PEER_STATS message
> based on HTT version.
>
> Surabhi Vishnoi (2):
>   ath10k: Add support for adding htt_rx_ops based on htt_version
>   ath10k: Add support for per peer HTT tx stats for WCN3990

When you resubmit, could you please include Rakesh's fixes in the same patchset:

ath10k: Fix rate table updation in tx stats
ath10k: Fix NSS tx stats for legacy rates

https://patchwork.kernel.org/project/linux-wireless/list/?series=90199&state=*&order=date

They depend on this patchset, so it's easier to handle them all
together.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
