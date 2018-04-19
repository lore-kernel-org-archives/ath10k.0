Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-01.qualcomm.com ([185.23.61.162])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9BDw-0007l0-K0
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 15:11:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0/QCA9888 hw2.0: Add OpenMesh A62
 specific BDFs
Date: Thu, 19 Apr 2018 15:11:21 +0000
Message-ID: <87zi1zjko7.fsf@kamboji.qca.qualcomm.com>
References: <3706510.gbe5VexPLA@bentobox>
 <87r2nbl1k8.fsf@kamboji.qca.qualcomm.com>
 <87muxzl10g.fsf@kamboji.qca.qualcomm.com>	<4212302.P7lZVe8mpY@bentobox>
In-Reply-To: <4212302.P7lZVe8mpY@bentobox> (Sven Eckelmann's message of "Thu, 
 19 Apr 2018 16:47:22 +0200")
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
Cc: Robert Marko <robimarko@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> On Donnerstag, 19. April 2018 14:33:04 CEST Kalle Valo wrote:
>> >> Unfortunately, this is wrong. Please check the mail again. The 
>> >> bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62 BDF is for the QCA9888 
>> >> hw2.0 board-2.bin and not the QCA4019 hw1.0.
>> >
>> > Thanks for noticing, I'll fix that. But please separate different hw to
>> > different mails, this way I can process them one hw version at the time.
>> 
>> Fixed now, please double check:
>> 
>> https://github.com/kvalo/ath10k-firmware/commit/a315471a5f4c9890e2ed1bdb008b7aae5c885ae0
>> 
>> https://github.com/kvalo/ath10k-firmware/commit/c3604f7d3ff61d1905aac644c721372f3c2a9663
>
>
> Ok, will use md5sum and split my submission based on the wifi hw.

BTW, I also updated the documentation about this:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

> The board-2.bin's look fine now.

Great, thanks for testing.

> pending
> =======
>
> * Asus RT-AC58U
>
>   - submitted before the guide was published
>   - http://lists.infradead.org/pipermail/ath10k/2017-March/009454.html
>
> * Netgear EX6100v2/EX6150v2
>
>   - http://lists.infradead.org/pipermail/ath10k/2018-February/010845.html
>
> * 8devices Jalapeno
>
>   - http://lists.infradead.org/pipermail/ath10k/2018-March/010916.html

Thanks for the list, it was really helpful. I think I have now added all
pending board files, but please let me know if I missed anything.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
