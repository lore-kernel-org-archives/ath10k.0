Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkgUM-0000nD-2i
 for ath10k@lists.infradead.org; Tue, 21 Apr 2015 22:17:54 +0000
Message-ID: <5536CC7C.5000400@candelatech.com>
Date: Tue, 21 Apr 2015 15:17:32 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question about ath10k throughput
References: <153F35912E69C446A72CF7D6417EBADE6E7B5667@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
 <5536C33E.6000109@candelatech.com>
 <153F35912E69C446A72CF7D6417EBADE6E7B5688@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
In-Reply-To: <153F35912E69C446A72CF7D6417EBADE6E7B5688@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
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
To: "Shu, Nick" <Nick.Shu@spirent.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 04/21/2015 02:59 PM, Shu, Nick wrote:
> Thanks, Ben:
> We use our test application to generate traffic (TCP or UDP), sending from wifi NIC (ONLY 1 CLIENT, not multiple vStas). RF cables are used to connect from NIC antenna port (x3) to Cisco AP (model#3702E) antenna port (AP is placed inside an isolation chamber). Scan results for that AP shows the signal strength is -18 dBm  (strong enough).
> AP is connected back to test server through Ethernet cable, then Network host is route back the data packet to test application.
> So the data throughput is calculated as: number of bytes * 2 (round trip) * 8 = Mbps.
> 
> So far, we can only get like 400-500 Mbps for UDP.
> Should we set AP to open? Without encryption?

I don't see why you do the 2x to get 'round-trip'...I think for issues related
to wifi throughput, just talk about the amount of data flowing across the
wifi network interface itself.

Receiving on a station (download), when using CT firmware and with sw-crypt enabled,
does decryption on the CPU, and this is normally a CPU bound issue at around
500Mbps even on expensive E5 processors.

Upload uses HW encryption, so should run faster with modest host CPU usage.

I would try Open auth testing when verifying wifi throughput..then compare that
against your encrypted throughput to see if you are CPU bound (or, at least
not RF bound).

If you are doing true TCP protocol, then it will back off on drops (and require
TCP ack frames and so forth).  You will get quite a bit more bulk throughput
with UDP.

I would also try multiple different APs to try to find the best one.

Big expensive names on the AP don't always mean so much for basic throughput
tests in our experience.

Having the AP inside an isolation chamber is helpful, but you really
need your station system inside a chamber as well for a truly isolated test, otherwise
the station system may be picking up interference that causes lost frames
and so forth (and AP might pick up similar interference through cables
connected to your test equipment).

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
