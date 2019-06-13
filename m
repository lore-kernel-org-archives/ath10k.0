Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr770133.outbound.protection.outlook.com
 ([40.107.77.133] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbLer-0000GV-AQ
 for ath10k@lists.infradead.org; Thu, 13 Jun 2019 09:04:38 +0000
From: Patrick Daume <patrick.daume@dedrone.com>
Subject: ath10k kernel cannot allocate memory after some ifupdown cycles
Date: Thu, 13 Jun 2019 09:04:30 +0000
Message-ID: <1560416670.23005.15.camel@dedrone.com>
Content-Language: en-US
Content-ID: <B76E552F0675CC48B7C86964F5658E2E@namprd15.prod.outlook.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I've an SparkLan WPEQ-261ACN(BT) Qualcomm Atheros QCA6174 chipset on an 4.4.38 Kernel with the newest kernel backport 'v5.1-rc2'.
When i toggle the wlan0 interface in 10s cycles then the kernel cannot allocate memory after a while.
Can anyone point out which patches may be relavant to fix this issue?

watch -n 10 sudo ./toggle.sh
+ sudo ifup wlan0
RTNETLINK answers: Cannot allocate memory
+ sleep 10s
+ sudo ifdown wlan0

dmesg
[ 1917.775193] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 1917.812460] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 1943.467822] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 1943.508383] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 1969.157238] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 1969.196090] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 1994.850710] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 1994.891609] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2020.546382] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 2020.587174] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2046.241897] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 2046.283581] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2071.937823] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 2071.979395] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2097.633628] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 2097.675403] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2123.330689] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 2123.381449] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2149.033861] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 2149.080214] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2174.734434] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 2174.776393] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2200.413865] ath10k_pci 0000:01:00.0: failed to write diag value at 0xa7000: -12
[ 2200.423219] ath10k_pci 0000:01:00.0: failed to download firmware via diag interface:-12
[ 2200.433298] ath10k_pci 0000:01:00.0: failed to upload firmware via diag ce, trying BMI: -12
[ 2200.992785] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[ 2201.034673] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[ 2216.242340] ath10k_pci 0000:01:00.0: failed to read hi_board_data address: -12
[ 2226.622023] ath10k_pci 0000:01:00.0: Failed to get pcie state addr: -12
[ 2226.629859] ath10k_pci 0000:01:00.0: failed to setup init config: -12
[ 2226.637622] ath10k_pci 0000:01:00.0: Could not init hif: -12


hwinfo
description: Ethernet interface
product: QCA6174 802.11ac Wireless Network Adapter
vendor: Qualcomm Atheros
physical id: 0
bus info: pci@0000:01:00.0
logical name: wlan0
version: 32
serial: [REMOVED]
width: 64 bits
clock: 33MHz
capabilities: bus_master cap_list ethernet physical
configuration: broadcast=yes driver=ath10k_pci driverversion=4.4.38 firmware=WLAN.RM.4.4.1.c3-00030 latency=0 link=no multicast=yes
resources: irq:452 memory:50200000-503fffff


>>
#/bin/bash

set -x

sudo ifup wlan0
sleep 10s
sudo ifdown wlan0
<<
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
