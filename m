Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJWVs-0008LC-2j
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 23:06:40 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s1SN6FrS016509
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Fri, 28 Feb 2014 15:06:15 -0800
Message-ID: <53111667.7010909@candelatech.com>
Date: Fri, 28 Feb 2014 15:06:15 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: RX rate mis-reported?
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
To: ath10k <ath10k@lists.infradead.org>

As previously mentioned in the msdu thread, I was seeing funky rates
at high speed when using my modified firmware and driver.

But, on my AP system, which is using standard firmware and standard
ath10k driver, I also see the rates show up improperly:

[root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
6.0 MBit/s
[root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
6.0 MBit/s
[root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
6.0 MBit/s
[root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
234.0 MBit/s
[root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
234.0 MBit/s
[root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
156.0 MBit/s
[root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
234.0 MBit/s
[root@ath10k-2220 lanforge]# cat /debug/ieee80211/wiphy1/netdev\:vap1/stations/04\:f0\:21\:0e\:38\:41/last_rx_rate
6.0 MBit/s

This system was sustaining almost 400Mbps TCP download throughput, so it
seems unlikely to me that the return rate would really be this low?

I'd be interested to know what others see for rates when running higher-speed throughput...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
