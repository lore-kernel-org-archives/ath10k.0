Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eH3a6-00068q-T9
 for ath10k@lists.infradead.org; Tue, 21 Nov 2017 08:07:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3 1/2] ath10k: add per peer htt tx stats support for 10.4
Date: Tue, 21 Nov 2017 08:06:34 +0000
Message-ID: <87lgj0caye.fsf@kamboji.qca.qualcomm.com>
References: <1479227849-10042-1-git-send-email-akolli@qti.qualcomm.com>
 <2831996.nqnu04nqHR@bentobox>	<87tvxocbcn.fsf@kamboji.qca.qualcomm.com>
 <9ab6ffcf-0131-1fb1-13ef-076ec54bd582@dd-wrt.com>
In-Reply-To: <9ab6ffcf-0131-1fb1-13ef-076ec54bd582@dd-wrt.com> (Sebastian
 Gottschall's message of "Tue, 21 Nov 2017 09:00:54 +0100")
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Yifeng Tu <yifeng@qti.qualcomm.com>, Daniel Jeang <dyjeong@qti.qualcomm.com>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> Am 21.11.2017 um 08:58 schrieb Kalle Valo:
>> Sven Eckelmann <sven.eckelmann@openmesh.com> writes:
>>
>>> On Dienstag, 15. November 2016 22:07:29 CET akolli@qti.qualcomm.com wrote:
>>>> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>>>>
>>>> Per peer tx stats are part of 'HTT_10_4_T2H_MSG_TYPE_PEER_STATS'
>>>> event, Firmware sends one HTT event for every four PPDUs.
>>>> HTT payload has success pkts/bytes, failed pkts/bytes, retry
>>>> pkts/bytes and rate info per ppdu.
>>>> Peer stats are enabled through 'WMI_SERVICE_PEER_STATS',
>>>> which are nowadays enabled by default.
>>>>
>>>> Parse peer stats and update the tx rate information per STA.
>>>>
>>>> tx rate, Peer stats are tested on QCA4019 with Firmware version
>>>> 10.4-3.2.1-00028.
>>>>
>>>> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
>>> Why is the support for 10.2.4 firmware not upstreamed? I mean the one which is
>>> using pktlog to transfer the PEER_STATS information.
>> I'm not sure what you are asking. If you are asking the firmware release
>> mentioned in the commit log that's in ath10k-firmware:
>>
>> https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0/3.2.1
>>
>> But I'm sure you know that already.
>
> i believe he is just talking about a patch which allows to get station
> statistics like rx and tx rate on the firmare 10.2 series which is
> qca988x mainly
>
> this patch was posted here months ago but never got upstream

Any pointers to the patch? Patch title or link to patchwork would help.
I see hundreds of patches per release, I cannot remember all of them.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
