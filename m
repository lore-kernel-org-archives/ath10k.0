Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-02.qualcomm.com ([185.23.61.163])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9Aco-0005un-JX
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 14:33:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0/QCA9888 hw2.0: Add OpenMesh A62
 specific BDFs
Date: Thu, 19 Apr 2018 14:33:04 +0000
Message-ID: <87muxzl10g.fsf@kamboji.qca.qualcomm.com>
References: <3706510.gbe5VexPLA@bentobox>
 <87zi1zlcp3.fsf@kamboji.qca.qualcomm.com>	<7789745.NkZyeJEkZ5@bentobox>
 <87r2nbl1k8.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87r2nbl1k8.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 19 Apr 2018 17:21:11 +0300")
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Sven Eckelmann <sven.eckelmann@openmesh.com> writes:
>
>> On Donnerstag, 19. April 2018 10:20:41 CEST Kalle Valo wrote:
>> [...]
>>> >   - QCA4019 hw1.0
>>> >
>>> >     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62
>>> >       sha256sum:
>>> >       df5dc5a55506e2a58dcb0b8542f40226d3bfd530a6fc0bc90c728ab18a57144c
>>> >     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62
>>> >       sha256sum:
>>> >       96c3d044fe26522c75313c210ace6f85d5bdcdbce3350214d92467501a01fb88
>>> >
>>> >   - QCA9888 hw2.0
>>> >
>>> >     + bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62
>>> >       sha256sum:
>>> >       c85b23763e748abeb7e8c42e243dab1fc58d1bff94111e4058bdf31ddb14cefa
>> [...]
>>> I added these now, please check the results:
>>> 
>>> https://github.com/kvalo/ath10k-firmware/commit/
>> a262aac7cfe5ae5833378b4f1b0634f873a4df4d
>>> 
>>
>> Unfortunately, this is wrong. Please check the mail again. The 
>> bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62 BDF is for the QCA9888 
>> hw2.0 board-2.bin and not the QCA4019 hw1.0.
>
> Thanks for noticing, I'll fix that. But please separate different hw to
> different mails, this way I can process them one hw version at the time.

Fixed now, please double check:

https://github.com/kvalo/ath10k-firmware/commit/a315471a5f4c9890e2ed1bdb008b7aae5c885ae0

https://github.com/kvalo/ath10k-firmware/commit/c3604f7d3ff61d1905aac644c721372f3c2a9663

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
