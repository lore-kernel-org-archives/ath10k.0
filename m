Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFJ9K-0006Kq-C9
 for ath10k@lists.infradead.org; Fri, 30 Aug 2013 07:29:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Crash when loading module
References: <CABQkniCRG=UhP2TtKRxC5tquoCoMfuVsuGPPz=zGVKzUcakGxw@mail.gmail.com>
 <87fvtujrtg.fsf@kamboji.qca.qualcomm.com>
 <CABQkniBk-BUJW5Prjzw4J7jh=km15AZkNim523QZ+eU72=oJeQ@mail.gmail.com>
 <87ppsyiavy.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 30 Aug 2013 10:29:14 +0300
In-Reply-To: <87ppsyiavy.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Wed, 28 Aug 2013 09:32:01 +0300")
Message-ID: <877gf3ab79.fsf@kamboji.qca.qualcomm.com>
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
To: Zaki <zaki.bm@gmail.com>
Cc: ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Zaki <zaki.bm@gmail.com> writes:
>
>> The PCIe module is taken from Archer C7 V1 product's board.  I am not
>> so sure if it is V2 hardware, though. I just depends on the debugging
>> msg that says it is V2 device.
>>
>> The way i force it to use legacy interrupt is by modifying the code to
>> skip MSI-X and MSI.  The ath10k code is taken from ath.git master
>> branch.
>>
>> Thanks a lot for the link.  If someone can verify that the module on
>> Archer C7 V1 is actually a V1 hardware, then it will be very helpful
>> also.
>
> To my knowledge Archer C7 has QCA9880 v1. Because the PCI ids are the
> same I'm not currently aware of any way to detect from ath10k if QCA9880
> v1 or v2 :(

Found a way now:

http://lists.infradead.org/pipermail/ath10k/2013-August/000279.html

Zaki, I would appreciate if you could test that patch and see if ath10k
still crashes (it shouldn't). And if you want to provide your full name
I can add your name to the Reported-by tag.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
