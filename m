Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPnCK-0006aK-EU
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 08:49:47 +0000
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
 <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
 <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>
 <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>
 <CAJ-Vmo=d=PgUu_AYT1C82AJcnUxKUo_VYMn_b1QF8M_T+5KpkA@mail.gmail.com>
 <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <00174431-61c3-0f5d-4adc-2fdcfe8e3171@dd-wrt.com>
Date: Wed, 20 Jul 2016 10:49:10 +0200
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, "nbd@nbd.name" <nbd@nbd.name>

Hello

while hunting a link stability (packet transmission stop) issue i 
discovered a maybe cosmetic, but maybe als serious issue.
AP is a QCA9880 3x3 card configured as WDS AP
Station is a QCA9880 2x2 card configured as WDS STA

the TX rate of the station matches to the rx rate of the AP.
but the RX rate of the station is wrong as it seems which may be a cause 
of the issue.
could this be a firmware bug on QCA9880?

output of fw_stats

WDS AP:
              Peer MAC address 40:a5:ef:85:4d:6f
                      Peer RSSI 12
                   Peer TX rate 175500
                   Peer RX rate 175500
               Peer RX duration 0


WDS STA:
             Peer MAC address 40:a5:ef:51:49:db
                      Peer RSSI 13
                   Peer TX rate 175500
                   Peer RX rate 351000
               Peer RX duration 0


Sebastian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
