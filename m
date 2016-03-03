Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1abXQl-0003uh-4m
 for ath10k@lists.infradead.org; Thu, 03 Mar 2016 17:52:55 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Proposal for per-radio configuration file.
Message-ID: <56D879CC.3080500@candelatech.com>
Date: Thu, 3 Mar 2016 09:52:12 -0800
MIME-Version: 1.0
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, netdev <netdev@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hello!

While working on ath10k NICs, I found a need to have one radio be configured
in one manner, and another in a different manner, and I need this config to happen
before the NIC is booted in at least some cases.  The primary reason is that
the NIC has limited resources, so there is definite need to allow the user to
optimize for their use case.  For instance, more vdevs vs more peer objects.

Module parameters do not work well for this because I want different NICs with the
same driver to have different configuration.

For ath10k, I implemented this with a text file for each NIC that is loaded
with the firmware-load API, parsed in the kernel, and then used to configure
the radio on bootup.

A patch I used to do this is here.  I think I ended up with a few follow-on
patches to fix some bugs, but this has the idea:

http://dmz2.candelatech.com/?p=linux-4.4.dev.y/.git;a=commitdiff;h=6708e4047d91edf234239943332bc2f0d124d009

It seems to work fine in my testing, and is logically similar to loading board init
files and so forth (which ath10k already uses).

I am looking for feedback on this if anyone has any opinions....


The config files look like this:

]# ls -l /lib/firmware/ath10k/
total 12
-rw-r--r--  1 root root  311 Feb 23 11:27 fwcfg-pci-0000:05:00.0.txt
-rw-r--r--  1 root root  330 Feb 23 11:18 fwcfg-pci-0000:07:00.0.txt
rwxr-xr-x.  3 root root 4096 May 21  2015 QCA988X

]# cat /lib/firmware/ath10k/fwcfg-pci-0000:05:00.0.txt
# Configuration for radio 1
vdevs = 64
peers = 127
stations = 127
rate_ctrl_objs = 36
regdom = 840
fwname = firmware-2.bin
fwver = 2
nohwcrypt = 1
tx_desc = 680
#max_nss = 3
num_tids = 256
skid_limit = 128

[root@ben-ota-1 lanforge]# cat /lib/firmware/ath10k/fwcfg-pci-0000\:07\:00.0.txt
# Configuration for radio 2
# Driver will pick defaults for any commented-out or missing variables.

# vdevs = 8
# peers = 64
# stations = 64
# rate_ctrl_objs = 10
# regdom = 840
# fwname = firmware-5.bin
# fwver = 5
# nohwcrypt = 1
# tx_desc = 1024
#max_nss = 3
# num_tids = 128
# skid_limit = 32



Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
