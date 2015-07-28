Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bl2on0068.outbound.protection.outlook.com ([65.55.169.68]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK3t8-0001YN-WD
 for ath10k@lists.infradead.org; Tue, 28 Jul 2015 12:21:43 +0000
From: Jussi Haakana <jussi.haakana@7signal.com>
Subject: Monitor mode TX retry reporting
Date: Tue, 28 Jul 2015 12:21:19 +0000
Message-ID: <CY1PR0201MB07293EE8CB1375DF298F1E8EA98D0@CY1PR0201MB0729.namprd02.prod.outlook.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

I have the following test setup:
- 1 interface in managed mode
- 1 interface in monitor mode
- attach to AP
- start tcpdump on monitor interface
- upload e.g. 200MB by using managed mode interface
- check captured frames

For some reason, on TX frames, I cannot see a single frame that has retry bit set 
on frame control of 802.11 headers. For RX, retries seem to be reported normally. 
I'd say that it is unlikely that retransmissions do not happen with 200MB payload? 
Any ideas what could be causing this?

I'm running 3.18.7 on ARM7, OpenWRT (Chaos Calmer):

root@OpenWrt:/# uname -a
Linux OpenWrt 3.18.7+ #38 SMP Sun Jun 28 03:51:01 CEST 2015 armv7l GNU/Linux
root@OpenWrt:/# lspci
01:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless Network Adapter

Thanks,
Jussi Haakana


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
