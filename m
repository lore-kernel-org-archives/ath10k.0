Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqgG3-0002zp-EQ
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 15:34:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fill tx_duration for each peer in Tx stats per STA
References: <1548999390-25576-1-git-send-email-svishnoi@codeaurora.org>
Date: Mon, 04 Feb 2019 17:33:57 +0200
In-Reply-To: <1548999390-25576-1-git-send-email-svishnoi@codeaurora.org>
 (Surabhi Vishnoi's message of "Fri, 1 Feb 2019 11:06:30 +0530")
Message-ID: <8736p3effe.fsf@kamboji.qca.qualcomm.com>
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

> Firmware sends the tx_duration for each in HTT_T2H_MSG_TYPE_PEER_STATS
> msg. Fill the tx_duration sent by firmware in the tx stats information
> per STA.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0

Same here, please let me know the firmware version so I can add it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
