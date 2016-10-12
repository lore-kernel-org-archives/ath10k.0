Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buBeh-0004VZ-Fl
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 05:00:40 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: add per peer htt tx stats support for 10.4
Date: Wed, 12 Oct 2016 04:59:49 +0000
Message-ID: <87r37mgo1n.fsf@kamboji.qca.qualcomm.com>
References: <1475852332-18217-1-git-send-email-akolli@qti.qualcomm.com>
 <1475852332-18217-2-git-send-email-akolli@qti.qualcomm.com>
 <CAEFj985tCc_4Q_zfwRtoT0fjfZv0u_c5E8SRSQVz=V4tiHh+GA@mail.gmail.com>
In-Reply-To: <CAEFj985tCc_4Q_zfwRtoT0fjfZv0u_c5E8SRSQVz=V4tiHh+GA@mail.gmail.com>	(Yeoh
 Chun-Yeow's message of "Sat, 8 Oct 2016 22:16:37 +0800")
Content-Language: en-US
Content-ID: <7E32D9F5E240354A9741D51A532F4FE2@qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "Kolli, Anilkumar" <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

> On Fri, Oct 7, 2016 at 10:58 PM,  <akolli@qti.qualcomm.com> wrote:
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
>
> Is QCA988X supported? I have tried to test with
> firmware-5.bin_10.2.4.70.56 but not working.

My understanding is that 10.2 branch does not have this feature,
unfortunately.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
