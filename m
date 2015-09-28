Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from marchena.puc.rediris.es ([2001:720:418:ca00::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgY4k-0001Sg-Fo
 for ath10k@lists.infradead.org; Mon, 28 Sep 2015 13:02:40 +0000
Received: from [2001:40b0:7c22:6020:b180:ae88:f6eb:15e9] (helo=leo)
 by marchena.puc.rediris.es with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
 (envelope-from <jbaranda@cttc.es>) id 1ZgY4H-0003vW-Qx
 for ath10k@lists.infradead.org; Mon, 28 Sep 2015 15:02:13 +0200
Received: from [84.88.61.34] (pcjbaranda.cttc.es [84.88.61.34])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id 98CF62014F
 for <ath10k@lists.infradead.org>; Mon, 28 Sep 2015 15:02:04 +0200 (CEST)
Message-ID: <56093A50.4030902@cttc.es>
Date: Mon, 28 Sep 2015 15:02:08 +0200
From: Jorge Baranda <jbaranda@cttc.es>
MIME-Version: 1.0
Subject: Re: CT 4.2 kernel now supports 80Mhz IBSS
References: <56033C12.9020102@candelatech.com> <5604EE3F.40206@cttc.es>
 <5604FC09.609@tu-bs.de> <5604FE30.3000609@cttc.es>
 <56056FCA.3070602@candelatech.com> <5608DD30.6010606@cttc.es>
In-Reply-To: <5608DD30.6010606@cttc.es>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Dear Ben,

I confirm that with the latest CT kernel 4.2.0 and the last versions of =

iw and wpa_supplicant, IBSS connection can be set to 80MHz channel =

bandwidth.

Thanks,

Jordi

El 28/09/15 08:24, Jorge Baranda escribi=F3:
> Hi Ben, Harms,
>
> Thank you very much for the information.
> I will try it. I hope I can set the link to 80MHz with the new kernel.
>
> Thanks again,
>
> Regards,
>
> Jordi
>
> El 25/09/2015 a las 18:01, Ben Greear escribi=F3:
>> On 09/25/2015 12:56 AM, Jorge Baranda wrote:
>>> Hi Harms,
>>>
>>> Thank you very much for your aclaration. I was trying to follow your =

>>> setup with the CT kernel 4.0, but with no success, so after the post =

>>> of Ben, I imagine I
>>> have to install CT 4.2 kernel.
>>> By the way, I suppose that I have already this patch in my folder of =

>>> the kernel 4.2 since I downloaded it from git (17/09/15) after you =

>>> made your post. Just in
>>> case, could you point me out to the patch you are refering to?
>>> Other thing,  which CT firmware are you using (mine Release14)? =

>>> Additionally, could you share your .config file for the CT 4.2 =

>>> kernel? I'm having some troubles
>>> to make this kernel running and I am a little confused.
>>
>> Please grab the latest CT 4.2 kernel, I rebased the last 10 or so =

>> patches a day or two ago:
>>
>> # This first command blows away the first 20 commits, so if you have
>> # added your own patches, then you need to deal with that properly.
>>
>> git reset --hard HEAD~20
>> git pull
>>
>> The configs I use are in ./configs/
>>
>> In particular, the patch I added to enable HT80 IBSS was this:
>>
>> http://dmz2.candelatech.com/?p=3Dlinux-4.2.dev.y/.git;a=3Dcommit;h=3Dc62=
0066342699f63dcdd00ce5f4d0feb4f02b1fc =

>>
>>
>> Thanks,
>> Ben
>>
>>>
>>> Thanks again,
>>>
>>> Jordi
>>>
>>>
>>> El 25/09/15 09:47, Harms, Hannes escribi=F3:
>>>> Hi,
>>>>
>>>> yes, I was able to get 80 MHz IBSS working with CT 4.2 , but
>>>> I also  integrated the missing patch to my kernel  even before Ben =

>>>> mentioned that the patch was missing.
>>>> I also forgot that I made this change, sorry
>>>>
>>>> Regards Hannes
>>>>
>>>>
>>>> Am 25.09.2015 um 08:48 schrieb Jorge Baranda:
>>>>> Hi Ben,
>>>>>
>>>>> I imagine, I am one of the guys you are refering to.
>>>>> Within the thread "WLE600VX from PCEngines", I was trying to make =

>>>>> working a HT80 IBSS connection with wpa_supplicant, but this =

>>>>> connection was only set to 20MHz.
>>>>> I was trying this with the 4.0 kernel, the 10.1.467-ct-14 firmware =

>>>>> and the last version (git) of wpa_supplicant (2.5). By the way, =

>>>>> has anyone tried this?
>>>>>
>>>>> Then, due to this failure, I tried kernel 4.2 because Hannes Harm =

>>>>> reported success to set HT80 IBSS. But I was not able to configure =

>>>>> properly this kernel
>>>>> (compile OK, but the computer does not boot then).
>>>>>
>>>>> @Ben, could you share a .config file for kernel 4.2? Do you think =

>>>>> that Release14 CT firmware would be able to work? I will update =

>>>>> the 4.2 kernel, compile it
>>>>> and try to see
>>>>> if I can set up the HT80 IBSS connection.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Jorge
>>>>>
>>>>>
>>>>> El 24/09/15 01:56, Ben Greear escribi=F3:
>>>>>> I forget exactly all who was asking for this...but hopefully
>>>>>> they are reading this list...
>>>>>>
>>>>>> I was missing a patch that allowed HT80 IBSS in my 4.2.
>>>>>>
>>>>>> The beta-15 CT firmware appears to do HT80 IBSS just fine
>>>>>> with the 4.2 kernel now.
>>>>>>
>>>>>> I have not attempted to enable this feature on my 4.0 kernel yet.
>>>>>>
>>>>>> Please also note, I've been hacking on rate-ctrl logic in both 4.0
>>>>>> and 4.2 kernels (and beta-15 firmware)..so if you try it and find
>>>>>> something weird, especially in probe requests or association =

>>>>>> requests,
>>>>>> please do let me know.  Notes of success are welcome as well of =

>>>>>> course!
>>>>>>
>>>>>> http://www.candelatech.com/ath10k.php
>>>>>>
>>>>>> http://dmz2.candelatech.com/git/gitweb.cgi
>>>>>>
>>>>>> Thanks,
>>>>>> Ben
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>
>>
>
>


-- =

Jorge Baranda
Research Engineer, MSc
jorge.baranda@cttc.es

Centre Tecnol=F2gic de Telecomunicacions de Catalunya (CTTC)
Av. Carl Friedrich Gauss, 7
08860 Castelldefels, Barcelona (Spain)
Tel: +34 93 645 29 00  Ext: 2171
Fax. +34 93 645 29 01
www.cttc.es


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
