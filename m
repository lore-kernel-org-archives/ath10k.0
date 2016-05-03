Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mta-us-west-01.viasat.com ([8.37.96.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axcOJ-0004fP-EG
 for ath10k@lists.infradead.org; Tue, 03 May 2016 15:37:40 +0000
From: "Agarwal, Anil" <Anil.Agarwal@viasat.com>
Subject: RE: [Codel] fq_codel_drop vs a udp flood
Date: Tue, 3 May 2016 15:37:12 +0000
Message-ID: <7A2801D5E40DD64A85E38DF22117852CD09A1E22@wdc1exchmbxp01.hq.corp.viasat.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <CAA93jw6WKyWmgzni1Tn0oQfJyN7hss++MKLkJ8+3sRcVLu7krg@mail.gmail.com>
 <CAA93jw5NwBMzNrm6S2wPnx4yLTYq1k_J-cJ_Bi73p_uD_uo1xw@mail.gmail.com>
 <7A2801D5E40DD64A85E38DF22117852CD09A181F@wdc1exchmbxp01.hq.corp.viasat.com>
 <7A2801D5E40DD64A85E38DF22117852CD09A1873@wdc1exchmbxp01.hq.corp.viasat.com>
 <1462282531.5535.307.camel@edumazet-glaptop3.roam.corp.google.com>
In-Reply-To: <1462282531.5535.307.camel@edumazet-glaptop3.roam.corp.google.com>
Content-Language: en-US
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
To: Dave Taht <dave.taht@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: Jonathan Morton <chromatix99@gmail.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>, "make-wifi-fast@lists.bufferbloat.net" <make-wifi-fast@lists.bufferbloat.net>


This problem is also caused by some weaknesses in the Codel algorithm itself.
With an unresponsive UDP flow, one would expect Codel to naturally drop packets from the rogue queue and maintain a queuing delay close to the target delay value.
But it does not.
If you were to do a simple simulation of a single queue Codel, with say a 10 Mbps link and a UDP flow at 20 Mbps, you will see queue delay oscillate between 5 milliseconds and 10+ seconds, over periods of ~30 seconds.
There are ways to fix this, if there is interest in doing so.

Anil


-----Original Message-----
From: Eric Dumazet [mailto:eric.dumazet@gmail.com] 
Sent: Tuesday, May 03, 2016 9:36 AM
To: Agarwal, Anil
Cc: Dave Taht; Jonathan Morton; make-wifi-fast@lists.bufferbloat.net; codel@lists.bufferbloat.net; ath10k
Subject: Re: [Codel] fq_codel_drop vs a udp flood

On Tue, 2016-05-03 at 12:50 +0000, Agarwal, Anil wrote:
> I should be more precise about the statement about the inaccuracy of the algorithm.
> Given that we dequeue packets in round robin manner, the maxqidx value 
> may, on occasions, point to a queue which is smaller than the largest queue by up to one MTU.

That is not true.

Linux qdiscs (fq_codel being one of them) can carry big packets, up to 64KB in size.

You can not assume GRO/GSO are disabled. We absolutely want them for high performance.

There is no way fq_codel will track in real time the biggest flow 'just in case we have to drop packets at enqueue()'

This is a conscious choice I made years ago.

This patch will fix the performance issue and keep the normal operations fast.

https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.ozlabs.org_patch_617307_&d=CwICaQ&c=jcv3orpCsv7C4ly8-ubDob57ycZ4jvhoYZNDBA06fPk&r=FyvaklKYrHaSCPjbBTdviWIW9uSbnxdNSheSGz1Jvq4&m=N_VdDT2cMUULbApQu-u_8yTr5wEiA4JHvbCH9jtLHkY&s=5jpMb-Je0Et1TFi0a4L7TZKt7wAtsP5AJwn1x6wnq0w&e= 



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
