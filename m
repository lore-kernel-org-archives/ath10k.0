Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHGmf-000272-Fa
 for ath10k@lists.infradead.org; Wed, 14 Dec 2016 21:08:18 +0000
Received: by mail-wm0-x241.google.com with SMTP id u144so1796637wmu.0
 for <ath10k@lists.infradead.org>; Wed, 14 Dec 2016 13:07:53 -0800 (PST)
Subject: Re: [RFC v2 05/11] ath10k: htc: refactorization
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
 <1479496971-19174-6-git-send-email-erik.stromdahl@gmail.com>
 <87inqoymd0.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkuUFxnra75B4LpF5+k9yE7hkNYDXbtUMBLq2LFuPSasg@mail.gmail.com>
 <871sxbzqo6.fsf@kamboji.qca.qualcomm.com>
 <70b8a055-e6ba-857d-8b03-06f50e3f10fe@gmail.com>
 <871sxay66a.fsf@kamboji.qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <b3068401-aee9-47bc-141e-692ea72ffb74@gmail.com>
Date: Wed, 14 Dec 2016 22:07:50 +0100
MIME-Version: 1.0
In-Reply-To: <871sxay66a.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 12/14/2016 02:46 PM, Valo, Kalle wrote:
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
> 
>> I have made a few updates since I submitted the original RFC and created
>> a repo on github:
>>
>> https://github.com/erstrom/linux-ath
>>
>> I have a bunch of branches that are all based on the tags on the ath master.
>>
>> As of this moment the latest version is:
>>
>> ath-201612131156-ath10k-sdio
>>
>> This branch contains the original RFC patches plus some addons/fixes.
> 
> Good, this makes it easier to follow the development. So what's the
> current status with this branch? What works and what doesn't?
> 
Well, everything in there has been tested (limited though, as you
yourself experienced), but it is not complete. I still have some other
patches that need some more refurbishing before I can push them.

I will push those patches that I consider "good enough" for publish to
this repo. Most likely I will rewrite/squash etc. some of it before
submitting a new RFC series.

So, there are still some additional stuff that needs to be added. In my
case I have a series of patches related to OCB (Outside the Context of a
BSS) mode of operation (since the chipset I am using is intended for
this purpose). These patches are still not complete.

Other SDIO 11ac chipsets might just need an item in the struct
ath10k_hw_params array together with some firmware files.

> Especially I'm interested about the state of the HTT high latency
> support. How much work is to add that? It would also make it easier to
> add USB support to ath10k.
> 

I actually have some patches regarding this, but they have not been
tested at all since I have not yet managed to fully configure my SDIO
chip properly so far. I must finish the OCB code I mentioned earlier and
fix another really annoying issue with a missing HTT version response
(sometimes target won't respond to the HTT version request).

Then, hopefully, I can make some TX and RX tests.

I think the HTT TX part is fairly straight forward. But the RX part is a
little bit more tricky since I am not really sure about how to interface
mac80211 in the RX path.

My work flow goes like this:

As soon as there is a new tag on the ath.git master, I rebase my stuff
on top of it and push a new branch to my repo.

I will continuously push updates to the latest branch (the branch based
on the latest ath tag).

Older branches will not be maintained.

/Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
