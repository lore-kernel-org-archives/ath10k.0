Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkyUi-0006yy-Rl
 for ath10k@lists.infradead.org; Thu, 15 May 2014 16:26:57 +0000
Received: by mail-we0-f170.google.com with SMTP id u57so1348641wes.29
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 09:26:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
Subject: Re: openwrt ath10k / MacBook Pro Retina 802.11ac not connecting
From: "Mark A. Swift" <markaswift@gmail.com>
In-Reply-To: <CAMWKU3eTJ8uPQv9NV_oTD4HVLpyr9_d7U9uc4DgirUk2fB2tNw@mail.gmail.com>
Date: Thu, 15 May 2014 17:26:31 +0100
Message-Id: <37DFD858-1F18-4A02-B7A8-0D314918189C@gmail.com>
References: <CAMWKU3eT9=ri7P1X69DNw9QshqDR8TUFm3RVuo8=GWuDcCn5oA@mail.gmail.com>
 <874n0sce7s.fsf@kamboji.qca.qualcomm.com>
 <87vbt8ayci.fsf@kamboji.qca.qualcomm.com>
 <CAMWKU3eTJ8uPQv9NV_oTD4HVLpyr9_d7U9uc4DgirUk2fB2tNw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: while oneq <while1eq1@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

Sadly I resorted back to the TP Link firmware as the lack of 5ghz was a dea=
l breaker for me=85 =


Sorry I cannot be of further help.

On 15 May 2014, at 16:59, while oneq <while1eq1@gmail.com> wrote:

> I would be glad to provide any info that I can to help resolve this
> issue. Itll take me a few days for me to gather it up but when I get
> it I will surely post it here.
> =

> Mark did you have anything to add to this?
> =

> Thanks
> =

> On Wed, May 14, 2014 at 4:39 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrot=
e:
>> Hi again,
>> =

>> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>> =

>>> while oneq <while1eq1@gmail.com> writes:
>>> =

>>>> Im currently using lib/firmware/ath10k/QCA988X/hw2.0/  on a TP-Link
>>>> Archer C7 v2.0 / OpenWRT [BARRIER BREAKER (Bleeding Edge, r40749)]
>>>> =

>>>> Package: kmod-ath10k
>>>> Version: 3.10.36+2014-03-31-1
>>>> Depends: kernel (=3D 3.10.36-1-6548302841f6df0132fbc6960fa209fb), kmod=
-ath
>>>> Status: install user installed
>>>> Architecture: ar71xx
>>>> =

>>> =

>>> [...]
>>> =

>>>> and am connecting via
>>>> =

>>>> a MacBook Pro Retina:
>>>>  Model Name: MacBook Pro
>>>>  Model Identifier: MacBookPro11,3
>>> =

>>> =

>>> [...]
>>> =

>>>> And am unable to get connected to the access point at all, All
>>>> wireless security settings are disabled at the moment.
>>>> =

>>>> Any assistance on this issue would be greatly appreciated.
>>> =

>>> With the information you provided it's difficult to say what's the
>>> problem. Here are some tips to get forward:
>>> =

>>> * Try disabling all possible features. Setup AP to use simple 11a mode
>>>  with 20 MHz channels without aggregation etc and try to narrow down
>>>  what is causing the problem.
>>> =

>>> * Try with static IPs.
>>> =

>>> * Try different channels.
>>> =

>>> * If you have a wireless sniffer, take 802.11 airlog with that and post
>>>  it somewhere.
>>> =

>>> * Provide logs from AP, especially dmesg and hostapd debug logs are
>>>  useful.
>>> =

>>> Please let me know if you need more help with the above.
>> =

>> I just noticed that Mark had also reported problems with the same
>> MacBook. I had even replied to him, but I guess I forgot it entirely due
>> to jetlag :)
>> =

>> But anyways, it would awesome if you could provide more info so that we
>> can find the bug causing the problem. And if you have any questions,
>> please ask. We have lots of people here who can help.
>> =

>> --
>> Kalle Valo
> =

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
