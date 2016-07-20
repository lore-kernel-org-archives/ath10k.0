Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPub2-0002fD-GA
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 16:43:45 +0000
Message-ID: <578FAA12.4020509@candelatech.com>
Date: Wed, 20 Jul 2016 09:42:58 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: rx rate issue
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
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
 <b1cdb5c3-6ddb-8a69-d0f7-79d8e6ba23d0@dd-wrt.com>
 <CA+BoTQmrk_U8oVXxk-5hBz60=R-xR4H=2_x2pj9BVDYXPOoCGg@mail.gmail.com>
 <6487f1d3-339e-a6dd-d866-b11b37b4ddff@dd-wrt.com>
 <CA+BoTQ=yC7kN7ayWqZ9Y3SBL0jQZRkKMU2=T9Z21Vwxjp2m7uw@mail.gmail.com>
 <b08002e3-8f45-d6c2-607e-344fbddbd957@dd-wrt. com>
In-Reply-To: <b08002e3-8f45-d6c2-607e-344fbddbd957@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>



On 07/20/2016 04:12 AM, Sebastian Gottschall wrote:
> Am 20.07.2016 um 13:03 schrieb Michal Kazior:

>>>>> WDS AP:
>>>>>                Peer MAC address 40:a5:ef:85:4d:6f
>>>>>                        Peer RSSI 12
>>>>>                     Peer TX rate 175500
>>>>>                     Peer RX rate 175500
>>>>>                 Peer RX duration 0
>>>>>
>>>>>
>>>>> WDS STA:
>>>>>               Peer MAC address 40:a5:ef:51:49:db
>>>>>                        Peer RSSI 13
>>>>>                     Peer TX rate 175500
>>>>>                     Peer RX rate 351000
>>>>>                 Peer RX duration 0
>> [...]

One thing, if your signal is really this hot (-12, -13), then you are likely over-saturating
the RF logic.  You normally get best results at around -40 signal level...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
