Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eg7LN-0007zt-LS
 for ath10k@lists.infradead.org; Mon, 29 Jan 2018 11:11:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add OpenMesh A42 specific BDFs
Date: Mon, 29 Jan 2018 11:10:58 +0000
Message-ID: <87r2q8539d.fsf@qca.qualcomm.com>
References: <6906010.WJMafUttCS@bentobox>
 <874ln8txhu.fsf@kamboji.qca.qualcomm.com>	<1728597.VOqZ93QOv6@bentobox>
In-Reply-To: <1728597.VOqZ93QOv6@bentobox> (Sven Eckelmann's message of "Mon, 
 29 Jan 2018 08:59:04 +0100")
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Christian Lamparter <chunkeey@gmail.com>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> On Freitag, 26. Januar 2018 16:07:10 CET Kalle Valo wrote:
> [...]
>> > * bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42
>> >   - sha256sum: 
>> >     10700a7ac636d57fe055e5bb4bd5f7bb3f1c282a7f25a8bb2204fc36e8c317bf
>> > * bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42
>> >   - sha256sum:
>> >     b3d9556894e509ac608b2e27c9169da12c63634670bb69c5ef21fb31583e7998
>> 
>> I added these now:
>> 
>> https://github.com/kvalo/ath10k-firmware/commit/5cd2bacd8e22217335e539b416d0cb8d59f8e312
>>
>> To make this easier I did some bigger changes in ath10k-bdencoder,
>> please check carefully that I didn't break anything.
>
> Tested it by extracting the files using the ath10k-bdencoder d278f25bc977 
> (from 2017-02-10) and then calculating the sha256sum's using
>
>     $ sha256sum bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42.bin bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42.bin 
>     10700a7ac636d57fe055e5bb4bd5f7bb3f1c282a7f25a8bb2204fc36e8c317bf  bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42.bin
>     b3d9556894e509ac608b2e27c9169da12c63634670bb69c5ef21fb31583e7998  bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42.bin
>
> It was also checked that the board-2.json only had these names attached to the 
> .bin files.
>
> I did the same with my reference files and came to the same results. I am
> assuming that the files must have been added correctly when the names are 
> correct and the content is correct.
>
> I have then extracted the version prior to the OM-A42 change and compared it 
> to the one with OM-A42. The only difference I could find are related to the 
> OM-A42. I must therefore also assume that only the relevant parts were changed 
> and the other BDFs were not touched.

Good, thanks for checking!

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
