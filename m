Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22d.google.com ([2607:f8b0:400c:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJX8F-0001Tg-O9
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 23:46:20 +0000
Received: by mail-ve0-f173.google.com with SMTP id jw12so1479241veb.18
 for <ath10k@lists.infradead.org>; Fri, 28 Feb 2014 15:45:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <53111667.7010909@candelatech.com>
References: <53111667.7010909@candelatech.com>
Date: Sat, 1 Mar 2014 07:45:54 +0800
Message-ID: <CAEFj9842Pxs_cGU1b9Q49FFA9bkD4-ks0bX_Lz04n4ff3nuLVA@mail.gmail.com>
Subject: Re: RX rate mis-reported?
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hi, Ben

I did have a submitted patch to correct the last_rx_rate due to the
missing of VHT flag:
http://www.spinics.net/lists/linux-wireless/msg119429.html

Maybe you can take a look on this.

-----
Chun-Yeow


On Sat, Mar 1, 2014 at 7:06 AM, Ben Greear <greearb@candelatech.com> wrote:
> As previously mentioned in the msdu thread, I was seeing funky rates
> at high speed when using my modified firmware and driver.
>
> But, on my AP system, which is using standard firmware and standard
> ath10k driver, I also see the rates show up improperly:
>
> [root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
> 6.0 MBit/s
> [root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
> 6.0 MBit/s
> [root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
> 6.0 MBit/s
> [root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
> 234.0 MBit/s
> [root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
> 234.0 MBit/s
> [root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
> 156.0 MBit/s
> [root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
> 234.0 MBit/s
> [root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
> 6.0 MBit/s
>
> This system was sustaining almost 400Mbps TCP download throughput, so it
> seems unlikely to me that the return rate would really be this low?
>
> I'd be interested to know what others see for rates when running higher-speed throughput...
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
