Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grfhy-0002yi-JY
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 09:10:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fill tx_duration for each peer in Tx stats per STA
References: <1548999390-25576-1-git-send-email-svishnoi@codeaurora.org>
 <8736p3effe.fsf@kamboji.qca.qualcomm.com>
 <ad4c09475713750aa1c6d2db30178de8@codeaurora.org>
Date: Thu, 07 Feb 2019 11:10:54 +0200
In-Reply-To: <ad4c09475713750aa1c6d2db30178de8@codeaurora.org> (Surabhi
 Vishnoi's message of "Wed, 06 Feb 2019 19:23:02 +0530")
Message-ID: <87h8dg9d5t.fsf@kamboji.qca.qualcomm.com>
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

+ lists

Surabhi Vishnoi <svishnoi@codeaurora.org> writes:

> On 2019-02-04 21:03, Kalle Valo wrote:
>> Surabhi Vishnoi <svishnoi@codeaurora.org> writes:
>>
>>> Firmware sends the tx_duration for each in HTT_T2H_MSG_TYPE_PEER_STATS
>>> msg. Fill the tx_duration sent by firmware in the tx stats information
>>> per STA.
>>>
>>> Tested HW: WCN3990
>>> Tested FW: WLAN.HL.2.0
>>
>> Same here, please let me know the firmware version so I can add it.
>
>
> Hi Kalle,
>
> The Fw version tested are:
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1,
>            WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1

Thanks. I'll add these.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
