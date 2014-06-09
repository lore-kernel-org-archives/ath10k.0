Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wu5li-0007Pa-95
 for ath10k@lists.infradead.org; Mon, 09 Jun 2014 20:02:11 +0000
Message-ID: <539612A2.60400@stackframe.org>
Date: Mon, 09 Jun 2014 22:01:38 +0200
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <8738fimmjp.fsf@kamboji.qca.qualcomm.com>	<53924F5F.5090104@gmail.com>	<87wqctjn6o.fsf@kamboji.qca.qualcomm.com>	<5392AD19.3060103@stackframe.org>
 <CA+BoTQ=OogF--KzZS9SkQorjqHSCwp6MzM4yYojri4uGzH3+3w@mail.gmail.com>
In-Reply-To: <CA+BoTQ=OogF--KzZS9SkQorjqHSCwp6MzM4yYojri4uGzH3+3w@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


Am 09.06.2014 07:07, schrieb Michal Kazior:
> On 7 June 2014 08:11, Sven Schnelle <svens@stackframe.org> wrote:
>> Hi Kalle,
>>
>> Am 07.06.2014 07:36, schrieb Kalle Valo:
>>
>>> Kamal Koshy <kamal.koshy@gmail.com> writes:
>>>
>>>> Attaching the result of dd if=/dev/mtd4 > ~/mtd4
>>> Thanks, I'll take a look at that later. But before that, do you know
>>> what's the mac address of the QCA9880 device with the proprietary
>>> driver? (_not_ with ath10k) That would help searching for the
>>> calibration data.
>>>
>> To me it looks like ath9k calibration data starts at 0x1000, and ath10k
>> calibration data
>> starts at 0x5000 in that mtd image. That's the same as on my board.
> The data looks very similar to board.bin (2116 bytes and familiar hex
> patterns). Can anyone replacing using it as the
> /lib/firmware/ath10k/QCA988X/hw2.0/board.bin?
>

Doesn't make a difference. The flash layout is the same on my 
engineering sample,
and i've extracted board.bin from the flash layout. Can anyone explain 
how OTP
works? It looks to me like otp is only run if calibration data in flash 
is invalid in the
proprietary driver.

Thanks
Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
