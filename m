Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAvKE-0000wf-8F
 for ath10k@lists.infradead.org; Wed, 17 May 2017 09:33:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Driver support for QCA6174 chip using SDIO interface
Date: Wed, 17 May 2017 09:32:31 +0000
Message-ID: <87pof76d75.fsf@kamboji.qca.qualcomm.com>
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
 <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
 <CABy9W5kF8KcTUgk9UOguu1A-N==tMbjVW1gWGeq8pgAN6YREUg@mail.gmail.com>
 <d4b33a7a-1504-585a-312a-c3ba00d5bab9@gmail.com>
 <878tlxuvcz.fsf@qca.qualcomm.com>
 <933866d5-5ddc-b0d7-98c2-3c7a31ea8276@gmail.com>
In-Reply-To: <933866d5-5ddc-b0d7-98c2-3c7a31ea8276@gmail.com> (Erik
 Stromdahl's message of "Tue, 16 May 2017 15:13:15 +0200")
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Akesh M Chacko <akesh.chacko@vvdntech.in>, Ann Lo <annlo.tech@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

>> I think we should try to get rest of your patches into mainline as well,
>> even if they are experimental still. Hopefully we get more people
>> helping that way, Adrian already expressed his interest which is very
>> cool and others have been also asking especially SDIO support. And with
>> good luck there are just small fixes needed to SDIO and USB properly
>> working.
>>
> I am actually preparing another RFC round for USB. I think I will split
> my remaining patches in two patchsets: USB and High Latency.
>
> The USB patches will have a few USB specific patches and the HL patches
> will have the high latency stuff that is common between SDIO and USB.
>
> What do you think?

I did take a look at your USB and HL patches earlier but I have already
forgotten what they contained. But at least in principle the split
sounds like a good idea. Just try to keep the size of patchsets
reasonable, a maximum of about a dozen (dependent) patches per set is a
good rule of thumb.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
