Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-02.qualcomm.com ([185.23.61.163])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6wLA-0005f6-Ir
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 10:54:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Please add new board files for WLE1216V5-20 and another Compex
 NIC.
Date: Fri, 13 Apr 2018 10:53:42 +0000
Message-ID: <87vacvs7gq.fsf@kamboji.qca.qualcomm.com>
References: <044ffe4d-4c50-4aeb-392c-aea9a813ebb4@candelatech.com>
 <CAJ+vNU1MSa3iR7dAW6M+TiKutzyYSeT3p4H0J8L_W3mTTEtyzQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU1MSa3iR7dAW6M+TiKutzyYSeT3p4H0J8L_W3mTTEtyzQ@mail.gmail.com>	(Tim
 Harvey's message of "Wed, 11 Apr 2018 08:18:15 -0700")
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
To: Tim Harvey <tharvey@gateworks.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Tim Harvey <tharvey@gateworks.com> writes:

> On Wed, Mar 21, 2018 at 2:59 PM, Ben Greear <greearb@candelatech.com> wrote:
>> Hello,
>>
>> It seems the upstream board-2.bin file for 9984 does not yet include support
>> for WLE1216V5-20
>> (or possibly it does and OpenWRT grabs the wrong one?).
>>
>> I'm attaching the board file for this NIC and for another one which
>> I have not yet tested.  I received these from Compex and have
>> tested the bus=pci,bmi-chip-id=0,bmi-board-id=31-compex.bin file on the
>> WLE1216V5-20
>>
>> Please add these into the official board-2.bin for 9984.
>>
>
> Kalle,
>
> Any progress on this? I believe your the one that has to update the
> board-2.bin at
> https://github.com/kvalo/ath10k-firmware/commits/master/QCA9984/hw1.0.

This is on my queue but I don't update board files that often, due to
lack of time. But I'll try to get to this request in the next few days.

> It's not clear what the process is for getting new board id's
> supported in the board.bin files.

I think Sven already provided the link to the wiki page.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
