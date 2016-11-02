Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.mailbox.org ([80.241.60.212])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1yCb-0000O3-CE
 for ath10k@lists.infradead.org; Wed, 02 Nov 2016 16:15:51 +0000
Date: Wed, 2 Nov 2016 17:15:15 +0100 (CET)
From: Conrad Kostecki <ck+ath10k@bl4ckb0x.de>
Message-ID: <103474143.9371.1478103316012@office.mailbox.org>
In-Reply-To: <CA+BoTQnOGOAEvM=M-1TqaN3GPgSJ2CUX-6Upa38jmaRzW9JkGA@mail.gmail.com>
References: <1403930336.4012.1477681558487@office.mailbox.org>
 <CA+BoTQmbz1vHjn0Xbo2hKcb9v8MdN5uTEnVNOAK0Kfh_NwTp5w@mail.gmail.com>
 <ema51f2924-a0bb-4f7a-8d84-3ee6fb82e317@valkyrie>
 <CA+BoTQkyd2f78Pk=_FrYyuQXedn8t6EEYq6BWHB8zthOF_AZ6w@mail.gmail.com>
 <1233772075.6396.1478077219620@office.mailbox.org>
 <CA+BoTQnOGOAEvM=M-1TqaN3GPgSJ2CUX-6Upa38jmaRzW9JkGA@mail.gmail.com>
Subject: Re: Re[2]: Linux freezes after a time while running
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org

Hi!

> Michal Kazior <michal.kazior@tieto.com> hat am 2. November 2016 um 16:27 geschrieben:

> Were the cards working with this particular microATX mainboard before though?

Not on this mobo, as it's new, so don't know.

But on my older Soekris net6501. There was the same problem, that the system crashed and freezes, when WiFi was enabled and used, with same type of Compex WiFi cards. But I know, that the Soekris was running 1-2 years just stable, before that problems there also started. The miniPCIe were direcly inserted without any adapter.

Just a wild guess, as I am running Gentoo and my own kernel. Could be something missing in my kernel, which could lead to this problem?
 
> Maybe the adapter is to blame?
I don't think, as the active and the passive adapter do show the same error.

> Or maybe it's a faulty mobo?
Well, other PCIe (e.G. USB 3.0, S-ATA) cards are just working fine..

> You could try reducing txpower of the card with "iw" and see if it makes a
> difference.

That does not seem to work?

iw dev wlp7s0 set txpower fixed 15
command failed: Operation not supported (-95)

iw dev wlp7s0 set txpower limit 15
command failed: Operation not supported (-95)

Cheers
Conrad

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
