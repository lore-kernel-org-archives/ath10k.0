Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfD8B-0007iK-Oy
 for ath10k@lists.infradead.org; Sat, 18 Feb 2017 22:05:30 +0000
Received: by mail-lf0-x243.google.com with SMTP id q89so6259097lfi.1
 for <ath10k@lists.infradead.org>; Sat, 18 Feb 2017 14:05:07 -0800 (PST)
Subject: Re: [RFC v3 0/8] ath10k sdio support
References: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
 <87fujbhb29.fsf@kamboji.qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <1c87e0d1-1f14-08bb-2a69-650788fba8dc@gmail.com>
Date: Sat, 18 Feb 2017 23:05:03 +0100
MIME-Version: 1.0
In-Reply-To: <87fujbhb29.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hej Kalle,

I was actually about to email you about this.

I have made a few more updates to the sdio code so I think it would be
best if I could submit a new series of patches based on this code (v4).

Then you can tweak it (v5).

It is only minor updates to the HIF layer (added QCA9377 support) and
a setup of some pll registers.

I will get back to you shortly.

btw, should I still mark them as RFC or should it be PATCH this time?

If I go for PATCH, should the version be v4 or should I start from v1?

/Erik

On 2017-02-18 14:40, Valo, Kalle wrote:
> Hej,
>
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>
>> This is the third version of the sdio RFC patch series.
>> The actual sdio code (patch 6) has been subject to a massive overhaul,
>> mainly as a result of Kalle's review comments.
>> It no longer has any strong resemblance of the original ath6kl code from
>> which it was originally based upon.
>>
>> Previous pathes 6 to 10 have been merged into one single patch.
>>
>> The previous series had a rework of the "HTC fake service" connect
>> (ep 0 connect) that introduced a race between the actual endpoint
>> connect and the HTC ready message. This issue has been addressed,
>> and the current patches (3 and 4) has been rewritten accordingly.
>>
>> * overview of patches *
>>
>> Patches 1 to 4 are more or less identical to the previous RFC, with an
>> exception for patch 3 that changes the "HTC fake service" connect
>> (mentioned above).
>>
>> Patch 5 is a squashed version of previous patches 6 to 10.
>>
>> Patch 6 is the actual sdio patch
>>
>> Patches 7 to 8 are new and adds special sdio versions of BMI get
>> target info and HTC ready.
>>
>> The new version was built and tested against:
>> tag: ath-201701121109
>>
>> Erik Stromdahl (8):
>>   ath10k: htc: made static function public
>>   ath10k: htc: rx trailer lookahead support
>>   ath10k: htc: move htc ctrl ep connect to htc_init
>>   ath10k: htc: refactorization
>>   ath10k: various sdio related definitions
>>   ath10k: sdio support
>>   ath10k: sdio get target info
>>   ath10k: htc: ready_ext msg support
>
> Sorry for not getting back to you earlier, haven't found time to look
> this in detail during the last few weeks.
>
> This is looking quite good now. I have some nitpicks (build warnings,
> maybe reorder some patches etc) still but I think it's faster if I fix
> those and send v4 as a proper patch (no RFC anymore), naturally
> attributing you as the author. Is that ok for you?
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
