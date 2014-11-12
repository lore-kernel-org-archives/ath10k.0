Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.spirent.com ([38.111.148.215] helo=webmail.spirent.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoeYz-00019o-Oo
 for ath10k@lists.infradead.org; Wed, 12 Nov 2014 20:30:50 +0000
From: "Dailey, Dave" <Dave.Dailey@spirent.com>
Subject: Ath10k leaves AR9880 in a state that will not enumerate again when
 CPU warm booted
Date: Wed, 12 Nov 2014 20:30:27 +0000
Message-ID: <21268C70AF91954BBF885CBEF2279F6D1C4658D0@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
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

Hello,

I have a wireless PCIe NIC with the AR9880 that is enumerating and working fine on the PCIe bus after a system cold boot, but after rebooting warm it doesn't show up in lspci.  We don't assert a hw reset line to the PCIe card on warm boot, but we don't see this issue with boards based on other wireless chipsets through system reboots.  Power supplies remain stable throughout the warm boot.

Is there a way to put the AR9880 in a state at reboot or module unload such that it will be recognized on the other side of a reboot?  I tried unbinding with sysfs and unloading the module, but no luck.

This is backports-next as of 2014/09/05/.

Thanks for any ideas.
Dave


Spirent Communications e-mail confidentiality.
------------------------------------------------------------------------
This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system.

Spirent Communications plc
Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.

Or if within the US,

Spirent Communications,
26750 Agoura Road, Calabasas, CA, 91302, USA.
Tel No. 1-818-676- 2300

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
