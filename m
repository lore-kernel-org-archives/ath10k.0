Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wtuwu-0007PG-7W
 for ath10k@lists.infradead.org; Mon, 09 Jun 2014 08:29:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <5392AD19.3060103@stackframe.org> <53944E64.9000002@elisanet.fi>
Date: Mon, 9 Jun 2014 11:28:29 +0300
In-Reply-To: <53944E64.9000002@elisanet.fi> (Matti Laakso's message of "Sun,
 08 Jun 2014 13:52:04 +0200")
Message-ID: <87lht6h4gi.fsf@kamboji.qca.qualcomm.com>
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
To: Matti Laakso <malaakso@elisanet.fi>
Cc: ath10k@lists.infradead.org

Matti Laakso <malaakso@elisanet.fi> writes:

>> ------------------------------------------------------------------------
>> Hi Kalle,
>>
>> Am 07.06.2014 07:36, schrieb Kalle Valo:
>> >/ Kamal Koshy <kamal.koshy at gmail.com <http://lists.infradead.org/mailman/listinfo/ath10k>> writes:
>> />/
>> />>/ Attaching the result of dd if=/dev/mtd4 > ~/mtd4
>> />/ Thanks, I'll take a look at that later. But before that, do you know
>> />/ what's the mac address of the QCA9880 device with the proprietary
>> />/ driver? (_not_ with ath10k) That would help searching for the
>> />/ calibration data.
>> />/
>> /To me it looks like ath9k calibration data starts at 0x1000, and ath10k 
>> calibration data
>> starts at 0x5000 in that mtd image. That's the same as on my board.
>>
>> Sven
>>
>
> Yeah, that's definitely the case.
>
> I think we need something like this for ath10k:
>
> https://github.com/kvalo/ath/blob/master/include/linux/ath9k_platform.h
>
> which we can then populate in the mach-file.

Yeah, we need that. But before that an ugly workaround is to do what
Michal suggests (copy the content to board.bin and skip otp.bin
execution in ath10k).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
