Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm30-vm0.bullet.mail.bf1.yahoo.com ([98.139.213.126])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1VPb-0002f3-9e
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 08:26:48 +0000
Date: Wed, 25 Nov 2015 08:26:23 +0000 (UTC)
From: Joerg Pommnitz <pommnitz@yahoo.com>
Message-ID: <1054851299.10547923.1448439983636.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <87610qqyjz.fsf@kamboji.qca.qualcomm.com>
References: <87610qqyjz.fsf@kamboji.qca.qualcomm.com>
Subject: Re: kvalo firmware confusion
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Joerg Pommnitz <pommnitz@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

It complains about not being able to find firmware-3.bin. I'm not sure about the
order. I'll try again with firmware-3.bin in the firmware directory.

 -- Regards       Joerg



> Kalle Valo <kvalo@qca.qualcomm.com> schrieb am 9:21 Mittwoch, 25.November 2015:
> > Joerg Pommnitz <pommnitz@yahoo.com> writes:
> 
>>  Thanks for the clarification.
>>  Somebody should update 
>> 
>> 
>> 
>>  https://wireless.wiki.kernel.org/en/users/Drivers/ath10k/firmware
>> 
>>  It states, that 10.2 is for 3.18.
> 
> I just checked, 3.18 should try firmware-3.bin first and hence it should
> support 10.2. So the wiki page is correct.
> 
> Is your version of ath10k trying to download firmware-3.bin first? If
> yes, you should be able to use 10.2 firmware.
> 
> 
> -- 
> Kalle Valo
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
