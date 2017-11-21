Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eH3Rx-0001dA-8x
 for ath10k@lists.infradead.org; Tue, 21 Nov 2017 07:58:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3 1/2] ath10k: add per peer htt tx stats support for 10.4
Date: Tue, 21 Nov 2017 07:58:01 +0000
Message-ID: <87tvxocbcn.fsf@kamboji.qca.qualcomm.com>
References: <1479227849-10042-1-git-send-email-akolli@qti.qualcomm.com>
 <2831996.nqnu04nqHR@bentobox>
In-Reply-To: <2831996.nqnu04nqHR@bentobox> (Sven Eckelmann's message of "Fri, 
 17 Nov 2017 12:06:06 +0100")
Content-Language: en-US
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Yifeng Tu <yifeng@qti.qualcomm.com>, Daniel Jeang <dyjeong@qti.qualcomm.com>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> On Dienstag, 15. November 2016 22:07:29 CET akolli@qti.qualcomm.com wrote:
>> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>> 
>> Per peer tx stats are part of 'HTT_10_4_T2H_MSG_TYPE_PEER_STATS'
>> event, Firmware sends one HTT event for every four PPDUs.
>> HTT payload has success pkts/bytes, failed pkts/bytes, retry
>> pkts/bytes and rate info per ppdu.
>> Peer stats are enabled through 'WMI_SERVICE_PEER_STATS',
>> which are nowadays enabled by default.
>> 
>> Parse peer stats and update the tx rate information per STA.
>> 
>> tx rate, Peer stats are tested on QCA4019 with Firmware version
>> 10.4-3.2.1-00028.
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
>
> Why is the support for 10.2.4 firmware not upstreamed? I mean the one which is 
> using pktlog to transfer the PEER_STATS information.

I'm not sure what you are asking. If you are asking the firmware release
mentioned in the commit log that's in ath10k-firmware:

https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0/3.2.1

But I'm sure you know that already.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
