Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqgF3-0002sO-CM
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 15:33:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Add a condtion to fill the LDPC capability
 correctly
References: <1548999262-25353-1-git-send-email-svishnoi@codeaurora.org>
Date: Mon, 04 Feb 2019 17:32:56 +0200
In-Reply-To: <1548999262-25353-1-git-send-email-svishnoi@codeaurora.org>
 (Surabhi Vishnoi's message of "Fri, 1 Feb 2019 11:04:22 +0530")
Message-ID: <877eefefh3.fsf@kamboji.qca.qualcomm.com>
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

> The firmware advertises the LDPC support information for HT in
> HT capability info in the wmi service ready event. To provide
> granularity, firmware now advertises WMI_HT_CAP_RX_LDPC and
> WMI_HT_CAP_TX_LDPC separately. To support LDPC, host should
> also check for WMI_HT_CAP_RX_LDPC and WMI_HT_CAP_TX_LDPC in HT
> capabilities.
>
> Add a condition to existing logic in host to know whether firmware
> supports LDPC or not.
>
> Tested HW: WCN3990
> Tested SW: WLAN.HL.2.0

Can you give exact firmware version you tested, please? I'll add it to
the commit log.

I'll also fix the typo "condtion" in the title.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
