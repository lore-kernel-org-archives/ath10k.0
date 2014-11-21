Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail6.webfaction.com ([74.55.86.74] helo=smtp.webfaction.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrtAL-0000GK-1M
 for ath10k@lists.infradead.org; Fri, 21 Nov 2014 18:42:45 +0000
Received: from [192.168.1.14] (unknown [68.38.40.177])
 by smtp.webfaction.com (Postfix) with ESMTP id 7C58C2078B6D
 for <ath10k@lists.infradead.org>; Fri, 21 Nov 2014 18:11:30 +0000 (UTC)
Message-ID: <546F8053.3010003@mindchasers.com>
Date: Fri, 21 Nov 2014 13:11:31 -0500
From: "Robert E. Cochran" <wifi@mindchasers.com>
MIME-Version: 1.0
Subject: seeking further info on firmware-3
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
To: ath10k@lists.infradead.org

Hi,

I'm testing Linux 3.18-rc5 with a QCA9880 / Compex WLE900VX.

During boot, I'm seeing complaints about not finding firmware-3.bin:

ath10k_pci 0001:03:00.0: Direct firmware load for 
ath10k/QCA988X/hw2.0/firmware-3.bin failed with error -2
ath10k_pci 0001:03:00.0: could not fetch firmware file 
'ath10k/QCA988X/hw2.0/firmware-3.bin': -2


Can someone please confirm that we should be using 
firmware-3.bin_10.2-00082-4-2 from the 10.2 folder on 
https://github.com/kvalo/ath10k-firmware.git
?  When we use this firmware, we see the following during boot:

ath10k_pci 0001:03:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 
10.2-00082-4-2 api 3 htt 2.1
ath10k_pci 0001:03:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 1



If this isn't the latest & greatest firmware, then where do I find 
firmware-3.bin?


And If I should be using firmware-3.bin_10.2-00082-4-2, then are there 
some release notes available for this?


Finally, please let me know if it's a mistake to be working with 
firmware-3 on the 3.18 kernel.   We're performing some early integration 
testing with this WiFi module, and it's more important to get things 
working as an AP with hostapd than getting the latest cutting edge 
features working.



Thanks,

Bob



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
