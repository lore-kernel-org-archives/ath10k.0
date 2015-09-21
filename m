Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeAMP-0005Zf-52
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 23:19:01 +0000
Subject: Re: R: Link can't get estabilished over RB911AC boards
References: <F52F175DFC537F48A43937B50B44BCA2820826A4@EXCHANGE.mediaspot.local>
 <56006A50.4000608@candelatech.com>
 <F52F175DFC537F48A43937B50B44BCA2820828DE@EXCHANGE.mediaspot.local>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5600904F.4090304@candelatech.com>
Date: Mon, 21 Sep 2015 16:18:39 -0700
MIME-Version: 1.0
In-Reply-To: <F52F175DFC537F48A43937B50B44BCA2820828DE@EXCHANGE.mediaspot.local>
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
To: Alessandro Bolletta <alessandro@mediaspot.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/21/2015 03:18 PM, Alessandro Bolletta wrote:
> Great!
>
> Ben, could you tell me how to compile CT kernel, for example the 4.2 vers=
ion, as part of OpenWRT buildroot?
>
> Also, what do you suggest for stability reasons? CT 4.0 or 4.2?

4.0 is most stable currently, though the last few days I've been committing=
 a lot
of barely tested code.  Will test this better shortly.

And, sorry, but I don't have time right now to help with making this work w=
ith
OpenWrt.  At the least, it is liable to not be trivial.  Search the list for
'CT' + 'OpenWRT' an you may find some help...others have posted patch-sets
for OpenWRT that includes at least many of my patches.


Thanks,
Ben

>
> Thanks,
> Alessandro
>
> -----Messaggio originale-----
> Da: Ben Greear [mailto:greearb@candelatech.com]
> Inviato: luned=EC 21 settembre 2015 22.37
> A: Alessandro Bolletta <alessandro@mediaspot.net>; ath10k@lists.infradead=
.org
> Oggetto: Re: Link can't get estabilished over RB911AC boards
>
> On 09/21/2015 12:57 PM, Alessandro Bolletta wrote:
>> Hi,
>>
>> I have two Mikrotik RB911AC boards (radio based on QCA9882) in which I i=
njected OpenWRT 15.05 and ath10k.
>>
>> I managed to get them connected in AP/STA configuration in a very short =
(2 meters) distance, but when I try to connect them on 5 kilometers, even i=
f I set the distance parameter on OpenWRT's UCI config files properly, it t=
ries to connect but after 3 retries, it declares unauthenticated.
>>
>> No problem with the same firmware on ath9k, for example.
>> Signal is stable at -62 dbm, I also tried to change channels and push tx=
 power, but nothing helped to do the trick.
>> Also tried with every firmware combination (10.2.4, CT firmware, 999.999=
.0.636, 10.1.467.2-1), without success.
>>
>> Is there anybody who can tell me why? Could it be due to the kernel vers=
ion (i'm running on 3.18.21)?
>
> You probably need to adjust ack timings.  I have some un-tested firmware =
support for this in the CT firmware, but I haven't fully wired it up to the=
 driver.
>
> Someone with a bit of time and skill could add this to the ath10k driver =
if they wanted to.  This commit has some details.
>
> http://dmz2.candelatech.com/?p=3Dlinux-4.0.dev.y/.git;a=3Dcommit;h=3Dabd3=
ee5c4d297e56b854864624152f5704c5df20
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
>
>


-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
