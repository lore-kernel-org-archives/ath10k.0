Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.mediaspot.net ([185.37.180.5])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze9Rv-00058k-6F
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 22:20:39 +0000
From: Alessandro Bolletta <alessandro@mediaspot.net>
Subject: R: Link can't get estabilished over RB911AC boards
Date: Mon, 21 Sep 2015 22:18:03 +0000
Message-ID: <F52F175DFC537F48A43937B50B44BCA2820828DE@EXCHANGE.mediaspot.local>
References: <F52F175DFC537F48A43937B50B44BCA2820826A4@EXCHANGE.mediaspot.local>
 <56006A50.4000608@candelatech.com>
In-Reply-To: <56006A50.4000608@candelatech.com>
Content-Language: it-IT
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Great! =


Ben, could you tell me how to compile CT kernel, for example the 4.2 versio=
n, as part of OpenWRT buildroot?

Also, what do you suggest for stability reasons? CT 4.0 or 4.2?

Thanks,
Alessandro

-----Messaggio originale-----
Da: Ben Greear [mailto:greearb@candelatech.com] =

Inviato: luned=EC 21 settembre 2015 22.37
A: Alessandro Bolletta <alessandro@mediaspot.net>; ath10k@lists.infradead.o=
rg
Oggetto: Re: Link can't get estabilished over RB911AC boards

On 09/21/2015 12:57 PM, Alessandro Bolletta wrote:
> Hi,
>
> I have two Mikrotik RB911AC boards (radio based on QCA9882) in which I in=
jected OpenWRT 15.05 and ath10k.
>
> I managed to get them connected in AP/STA configuration in a very short (=
2 meters) distance, but when I try to connect them on 5 kilometers, even if=
 I set the distance parameter on OpenWRT's UCI config files properly, it tr=
ies to connect but after 3 retries, it declares unauthenticated.
>
> No problem with the same firmware on ath9k, for example.
> Signal is stable at -62 dbm, I also tried to change channels and push tx =
power, but nothing helped to do the trick.
> Also tried with every firmware combination (10.2.4, CT firmware, 999.999.=
0.636, 10.1.467.2-1), without success.
>
> Is there anybody who can tell me why? Could it be due to the kernel versi=
on (i'm running on 3.18.21)?

You probably need to adjust ack timings.  I have some un-tested firmware su=
pport for this in the CT firmware, but I haven't fully wired it up to the d=
river.

Someone with a bit of time and skill could add this to the ath10k driver if=
 they wanted to.  This commit has some details.

http://dmz2.candelatech.com/?p=3Dlinux-4.0.dev.y/.git;a=3Dcommit;h=3Dabd3ee=
5c4d297e56b854864624152f5704c5df20

Thanks,
Ben

--
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
