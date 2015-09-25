Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailfront1.rz.tu-bs.de ([134.169.12.132] helo=tu-bs.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfNjS-0001JL-IO
 for ath10k@lists.infradead.org; Fri, 25 Sep 2015 07:47:51 +0000
Received: from [134.169.70.81] (account hanharms@tu-braunschweig.de
 [134.169.70.81] verified)
 by tu-braunschweig.de (CommuniGate Pro SMTP 6.1.2)
 with ESMTPA id 52328336 for ath10k@lists.infradead.org;
 Fri, 25 Sep 2015 09:48:03 +0200
Subject: Re: CT 4.2 kernel now supports 80Mhz IBSS
References: <56033C12.9020102@candelatech.com> <5604EE3F.40206@cttc.es>
From: "Harms, Hannes" <hannes.harms@tu-bs.de>
Message-ID: <5604FC09.609@tu-bs.de>
Date: Fri, 25 Sep 2015 09:47:21 +0200
MIME-Version: 1.0
In-Reply-To: <5604EE3F.40206@cttc.es>
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

Hi,

yes, I was able to get 80 MHz IBSS working with CT 4.2 , but
I also  integrated the missing patch to my kernel  even before Ben =

mentioned that the patch was missing.
I also forgot that I made this change, sorry

Regards Hannes


Am 25.09.2015 um 08:48 schrieb Jorge Baranda:
> Hi Ben,
>
> I imagine, I am one of the guys you are refering to.
> Within the thread "WLE600VX from PCEngines", I was trying to make =

> working a HT80 IBSS connection with wpa_supplicant, but this =

> connection was only set to 20MHz.
> I was trying this with the 4.0 kernel, the 10.1.467-ct-14 firmware and =

> the last version (git) of wpa_supplicant (2.5). By the way, has anyone =

> tried this?
>
> Then, due to this failure, I tried kernel 4.2 because Hannes Harm =

> reported success to set HT80 IBSS. But I was not able to configure =

> properly this kernel (compile OK, but the computer does not boot then).
>
> @Ben, could you share a .config file for kernel 4.2? Do you think that =

> Release14 CT firmware would be able to work? I will update the 4.2 =

> kernel, compile it and try to see
> if I can set up the HT80 IBSS connection.
>
> Thanks,
>
> Jorge
>
>
> El 24/09/15 01:56, Ben Greear escribi=F3:
>> I forget exactly all who was asking for this...but hopefully
>> they are reading this list...
>>
>> I was missing a patch that allowed HT80 IBSS in my 4.2.
>>
>> The beta-15 CT firmware appears to do HT80 IBSS just fine
>> with the 4.2 kernel now.
>>
>> I have not attempted to enable this feature on my 4.0 kernel yet.
>>
>> Please also note, I've been hacking on rate-ctrl logic in both 4.0
>> and 4.2 kernels (and beta-15 firmware)..so if you try it and find
>> something weird, especially in probe requests or association requests,
>> please do let me know.  Notes of success are welcome as well of course!
>>
>> http://www.candelatech.com/ath10k.php
>>
>> http://dmz2.candelatech.com/git/gitweb.cgi
>>
>> Thanks,
>> Ben
>>
>
>

-- =

Dipl.-Ing. Hannes Harms
Technische Universit=E4t Braunschweig
Institut f=FCr mobile Maschinen und Nutzfahrzeuge
Langer Kamp 19a
D-38106 Braunschweig

Durchwahl: +49 (0)531 391-7197
E-Mail:  hannes.harms@tu-braunschweig.de
http://www.tu-braunschweig.de/imn


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
