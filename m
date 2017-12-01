Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [2001:470:dc45:1000::1] (helo=mail.toke.dk)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKnGR-0000DH-MM
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 15:30:09 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
In-Reply-To: <87k1y6y04i.fsf@kamboji.qca.qualcomm.com>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
 <DAB5EBB8-C820-4056-8AAB-063D05F38BD5@toke.dk>
 <87bmjjzppd.fsf@kamboji.qca.qualcomm.com>
 <5080a68538fd2d883e15bacaa969661b@codeaurora.org> <87r2se36rq.fsf@toke.dk>
 <87k1y6y04i.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 01 Dec 2017 16:29:39 +0100
Message-ID: <87d13y31r0.fsf@toke.dk>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless-owner@vger.kernel.org" <linux-wireless-owner@vger.kernel.org>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

>>> tx_duration is aggregate time duration of 4 PPDU sent to STA.
>>> FW sends these values for retry packets also.
>>
>> Great, that sounds like just what we need.
>
> Except mapping to the iee80211_tx_status() might be difficult. I'm not
> sure how HTT_T2H_MSG_TYPE_PKTLOG events are sent in relation to
> HTT_T2H_MSG_TYPE_TX_COMPL_IND.

Yeah, figures. Well, maybe we'll just have to support an asynchronous
callback into mac80211 to register airtime usage. Will probably have to
add some asynchronicity anyway to avoid doing too much work in the fast
path.

Will keep that in mind when I get around to revisiting those patches :)

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
