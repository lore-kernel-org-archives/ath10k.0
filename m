Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIIow-00069R-F3
 for ath10k@lists.infradead.org; Wed, 29 Jun 2016 16:58:42 +0000
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <9fd1d06e-cb8e-d032-c304-ac4c550461e9@dd-wrt.com>
Date: Wed, 29 Jun 2016 18:58:12 +0200
MIME-Version: 1.0
In-Reply-To: <1467218124941.40575@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>, "Valo, Kalle" <kvalo@qca.qualcomm.com>

Am 29.06.2016 um 18:35 schrieb Manoharan, Rajkumar:
>>> Am 29.06.2016 um 16:04 schrieb Sebastian Gottschall:
>>> this fix will crash QCA9980 on QCA IPQ8064 cpu based systems.
>>> so please rework it, or leave it out.
>>> note:
>>> maybe the limit of 256kb is too low for that card
>>>
>> by the way. 512 works
>>
> Thanks a lot Sebastian. Let me confirm the same on x86 and will update th=
e change.
please check 9984 as well. i dont have this card right now but it seems =

it has something todo with the firmware size and the 9984 is bigger than =

9980
i'm still waiting for my sample cards
>
> -Rajkumar


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
