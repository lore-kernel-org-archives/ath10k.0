Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEZQn-0000en-Ce
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 06:40:42 +0000
Received: by mail-pa0-f49.google.com with SMTP id ld10so5842446pab.36
 for <ath10k@lists.infradead.org>; Tue, 27 Aug 2013 23:40:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ppsyiavy.fsf@kamboji.qca.qualcomm.com>
References: <CABQkniCRG=UhP2TtKRxC5tquoCoMfuVsuGPPz=zGVKzUcakGxw@mail.gmail.com>
 <87fvtujrtg.fsf@kamboji.qca.qualcomm.com>
 <CABQkniBk-BUJW5Prjzw4J7jh=km15AZkNim523QZ+eU72=oJeQ@mail.gmail.com>
 <87ppsyiavy.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 28 Aug 2013 14:40:19 +0800
Message-ID: <CABQkniA3tooYNtLtN_-Wbpj72cJGhUa_fGaOCX9nzHfhV56wdw@mail.gmail.com>
Subject: Re: Crash when loading module
From: Zaki <zaki.bm@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

Apologize. I should have pressed the Reply All button just now.

On Wed, Aug 28, 2013 at 2:32 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Hi Zaki,
>
> please CC the mailing list when replying. I do not have time to give
> private support.
>
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
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
