Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.ugent.be ([157.193.71.182])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEgTS-0007GM-JG
 for ath10k@lists.infradead.org; Tue, 05 Aug 2014 15:16:28 +0000
Message-ID: <53E0F52E.3010006@intec.ugent.be>
Date: Tue, 05 Aug 2014 17:15:58 +0200
From: Bart Jooris <Bart.Jooris@intec.ugent.be>
MIME-Version: 1.0
Subject: Re: Performance v/s signal quality graph.
References: <53D2E50E.5010205@candelatech.com>
In-Reply-To: <53D2E50E.5010205@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Bart.Jooris@intec.ugent.be
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Hi Ben,

I enjoyed watching your graph already a few times now ;-)

I have a few questions related to your experiment:
-about the setup, the cards have 3x3 MIMO so the attenuator has probably 
also three channels which are attenuated in parallel?
-based on the datasheet of the QCA9880 VHT80_MCS9 reception should break 
around -68dBm. On your graph it breaks around -52dBm, which is not 
within the described tolerances. Do you have any idea what could be 
causing this? Is the noise level higher than expected? Or did I made the 
wrong conclusions? I will try to verify on our setup.
-my million dollar question to you is related to the approx. 810Mbps UDP 
goodput :-) I already did some experiments over 3 coax cables, I noticed 
the same UDP goodput as over the air, which is around 640Mbps. Watching 
the sniffer I've noticed MCS=9, Data rate=1299.9 Mbps and block ACKs 
every (in avg.) 10 frames. So what is the key to the higher goodput?
-related to the hot signal, without having proof I've noticed that  it 
is easier to have higher goodputs with a low tx-power set, like 1 dBm. 
But probably more related to our setup... Which tx-power did you use 
during your experiments? Would you be able to get the same results 
(point break around -52dBm) with another tx-power set?

Thanks,

Bart


On 07/26/2014 01:15 AM, Ben Greear wrote:
> Some time back, I ran some tests, and someone (sorry, can't remember or find the email)
> suggested my signal might be too hot.  I was using a 30 db fixed attenuator inline with the SMA
> cables.
>
> I set up a test today with E5 processor system as station, and a fast i7 processor
> system as AP, with the two systems cabled through our variable attenuator.  Open authentication,
> channel 149, other wifi equipment in area on 5ghz was (mostly) idle or powered down.
> Kernel is 3.14.13+, latest ath10k CT (10.1.467 based) firmware on both systems
> (though I don't think that matters much for throughput tests).  10 virtual stations
> configured on station machine, but only one was actively doing traffic.
>
> Here is a udp download v/s rx-signal graph as the attenuator is stepped from 0 to 95.5
> db attenuation in .5 db steps.
>
> http://www.candelatech.com/pdfs/ath10k_atten_vs_throughput.pdf
>
> The rx-signal axis is the left hand side.  The green graph is the station's (ie netdev)
> rx bps, the black is UDP goodput.
>
> It seems ath10k (WLE900VX) has no real trouble with hot signals, and runs best between
> -15 and -52 rx signal level (as reported by the station device).
>
> Our systems are not perfectly isolated, so the maximum attenuation is around -85.
>
> Enjoy,
> Ben
>


-- 
Bart Jooris
Department of Information Technology
Internet Based Communication Networks and Services (IBCN)
Ghent University - iMinds
Gaston Crommenlaan 8 (Bus 201), B-9050 Gent, Belgium
E-mail: bart.jooris@intec.UGent.be
M: +32 474 59 53 42
Tel. +32 9 33 14900
Fax +32 9 33 14899


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
