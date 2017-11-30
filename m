Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [2001:470:dc45:1000::1] (helo=mail.toke.dk)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKRiA-0001Zi-9j
 for ath10k@lists.infradead.org; Thu, 30 Nov 2017 16:29:21 +0000
Date: Thu, 30 Nov 2017 17:28:42 +0100
In-Reply-To: <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
From: =?ISO-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>
Message-ID: <DAB5EBB8-C820-4056-8AAB-063D05F38BD5@toke.dk>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>




>> +struct ath10k_10_2_peer_tx_stats {
>> +	u8 ratecode[PEER_STATS_FOR_NO_OF_PPDUS];
>> +	u8 success_pkts[PEER_STATS_FOR_NO_OF_PPDUS];
>> +	__le16 success_bytes[PEER_STATS_FOR_NO_OF_PPDUS];
>> +	u8 retry_pkts[PEER_STATS_FOR_NO_OF_PPDUS];
>> +	__le16 retry_bytes[PEER_STATS_FOR_NO_OF_PPDUS];
>> +	u8 failed_pkts[PEER_STATS_FOR_NO_OF_PPDUS];
>> +	__le16 failed_bytes[PEER_STATS_FOR_NO_OF_PPDUS];
>> +	u8 flags[PEER_STATS_FOR_NO_OF_PPDUS];
>> +	__le32 tx_duration;
>> +	u8 tx_ppdu_cnt;
>> +	u8 peer_id;
>> +} __packed;
>
>Toke, hopefully the tx_duration value here helps with ATF
>implementation
>using QCA988X.

Awesome! What's the semantics of this field? Just total 
duration spent serving that station in the reporting interval?
Does it include retry attempts?

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
