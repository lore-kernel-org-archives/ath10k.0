Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjkPq-00041e-4I
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 09:54:13 +0000
Received: by mail-qk0-x232.google.com with SMTP id t7so66523449qkh.2
 for <ath10k@lists.infradead.org>; Tue, 13 Sep 2016 02:53:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56F27596.3080506@dks-koeln.de>
References: <56F27596.3080506@dks-koeln.de>
From: Bruno Antunes <baantunes@gmail.com>
Date: Tue, 13 Sep 2016 10:53:48 +0100
Message-ID: <CABUTiXWpwYcPzR1gwyrBP2KnbU3D8u8J6q5jo3OnXnXYPrXrGg@mail.gmail.com>
Subject: Re: UDP throughput problems with WDS and ath10k
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
To: Xue Liu <xue.liu@dks-koeln.de>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello,


On 23 March 2016 at 10:53, Xue Liu <xue.liu@dks-koeln.de> wrote:
> Hello everyone,
>
> Now I am doing point to point  throughput test using  and ath10k. The
> hardwares are clearfog A1 board with armada 388 and WLE900VX (QCA9880). The
> OpenWRT trunk is running on it.

Could you tell what is the OpenWrt Release and firmware used?
I'm using trunk R49886 and tried several versions of firmware and stll
can't send traffic trough the WDS link.
The link is established, there is a wlan0.sta1, but there is no L3 traffic.

Thanks,
Bruno

>
> At first I did UDP throughput test ( WDS AP <---> WDS Client ) with iperf3
> server on the WDS AP. The throughput is approx 630 Mbps.  But if the server
> sends the data, the throughput will rise to 700 Mbps.  I did the
> bidirectional test for many times. The UDP data transferring from AP side
> always has 70 - 80 Mbps more throughput.
>
> In the same situation, I did UDP throughput test between PC and WDS AP ( PC
> <---->WDS Client <----> WDS AP ) . The PC is connected with the WDS client
> via GbE port.  I have found a more interesting result. The data throughput
> is about 678 Mbps when the data is transmitted from AP to PC. There is
> almost no performance loss. But the throughput is only about 425 Mpbs from
> PC to AP.
>
> Can anyone give me some advises or some info about the reason and how to
> improve the transmitting performance from PC to AP side. Thank you.
>
> Regards,
>
> Xue Liu
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
