Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcGrz-00031b-F1
 for ath10k@lists.infradead.org; Tue, 23 Aug 2016 18:56:20 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: ath10k fail to load firmware
Date: Tue, 23 Aug 2016 18:55:53 +0000
Message-ID: <87inurtivb.fsf@kamboji.qca.qualcomm.com>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
 <87eg6774my.fsf@kamboji.qca.qualcomm.com>	<20160822084023.GA2118@redhat.com>
 <87mvk5xfjw.fsf@kamboji.qca.qualcomm.com>	<20160822110214.GB2118@redhat.com>
 <87eg5gx5ka.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87eg5gx5ka.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Mon, 22 Aug 2016 14:05:10 +0000")
Content-Language: en-US
Content-ID: <53519B85ABBD1443A7F6E8B4E35788A9@qualcomm.com>
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
To: Stanislaw Gruszka <sgruszka@redhat.com>
Cc: "Yijun_Shen@Dell.com" <Yijun_Shen@dell.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "perry_yuan@dell.com" <perry_yuan@dell.com>

"Valo, Kalle" <kvalo@qca.qualcomm.com> writes:

> Stanislaw Gruszka <sgruszka@redhat.com> writes:
>
>> On Mon, Aug 22, 2016 at 10:29:24AM +0000, Valo, Kalle wrote:
>>> Stanislaw Gruszka <sgruszka@redhat.com> writes:
>>> 
>>> > On Tue, Aug 02, 2016 at 12:10:46PM +0000, Valo, Kalle wrote:
>>> >> I pushed a new board-2.bin:
>>> >> 
>>> >> https://github.com/kvalo/ath10k-firmware/commit/7c0411643b195b246d3871f409f9219f528b39c1
>>> >
>>> > Kalle, when do you plan to propagate this to upstream linux-firmware ?
>>> 
>>> I usually send firmware updates to linux-firmware in a bigger update. I
>>> have quite a lot of patches pending so I wasn't planning to do it quite
>>> not yet.
>>> 
>>> Why are you asking, is this urgent?
>>
>> Well, we want to add support to Dell ath10k devices to our system,
>> but we are also a bit reluctant to have difference between
>> linux-firmware package in our system and upstream linux-firmware
>> git tree. Could you post just board-2.bin changes upstream soon ?
>
> Ok. I'll try to do it tomorrow.
>
> I'll also implement a script to help with that so that I don't need to
> do so much manual work and can update the firmware images more often.

I submitted it now:

http://marc.info/?l=linux-wireless&m=147197824810492

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
