Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEZi5-00018I-VS
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 06:58:34 +0000
Received: by mail-we0-f174.google.com with SMTP id q54so4739365wes.5
 for <ath10k@lists.infradead.org>; Tue, 27 Aug 2013 23:58:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ppsyiavy.fsf@kamboji.qca.qualcomm.com>
References: <CABQkniCRG=UhP2TtKRxC5tquoCoMfuVsuGPPz=zGVKzUcakGxw@mail.gmail.com>
 <87fvtujrtg.fsf@kamboji.qca.qualcomm.com>
 <CABQkniBk-BUJW5Prjzw4J7jh=km15AZkNim523QZ+eU72=oJeQ@mail.gmail.com>
 <87ppsyiavy.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 28 Aug 2013 08:58:10 +0200
Message-ID: <CACKGw+FoWx-yr1kpDpv6w=YnYiKopwnfVtWVrh+obaR6ztsmZw@mail.gmail.com>
Subject: Re: Crash when loading module
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
Cc: ath10k@lists.infradead.org, Zaki <zaki.bm@gmail.com>

Hi,

Here's a topic worth looking at:
https://forum.openwrt.org/viewtopic.php?pid=210840#p210840
I'm not sure about the source and if the information is confirmed, but
please check your Archer 7 revision and compare.

On 28 August 2013 08:32, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
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
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k



-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
