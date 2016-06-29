Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIISv-0000Oq-Jm
 for ath10k@lists.infradead.org; Wed, 29 Jun 2016 16:35:54 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
Date: Wed, 29 Jun 2016 16:35:25 +0000
Message-ID: <1467218124941.40575@qti.qualcomm.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>,
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
In-Reply-To: <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>, "Valo, Kalle" <kvalo@qca.qualcomm.com>

>> Am 29.06.2016 um 16:04 schrieb Sebastian Gottschall:
>> this fix will crash QCA9980 on QCA IPQ8064 cpu based systems.
>> so please rework it, or leave it out.
>> note:
>> maybe the limit of 256kb is too low for that card
>>
> by the way. 512 works
>
Thanks a lot Sebastian. Let me confirm the same on x86 and will update the change.

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
