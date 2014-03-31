Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUVhe-0008TT-0j
 for ath10k@lists.infradead.org; Mon, 31 Mar 2014 06:28:14 +0000
Message-ID: <53390AE4.4030705@candelatech.com>
Date: Sun, 30 Mar 2014 23:27:48 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Here are some ath10k performance graphs.
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

I finally have a firmware stable enough to do some throughput
tests (only locked station machine up once doing these!).

I find the download test interesting where the rx link rate goes very low
after 12 or so stations.

tx link rate is not reported properly yet by ath10k, so ignore that.

http://www.candelatech.com/examples/cap-ath10k-tcp-download-open/
http://www.candelatech.com/examples/cap-ath10k-tcp-download-wpa2/
http://www.candelatech.com/examples/cap-ath10k-tcp-upload-open/
http://www.candelatech.com/examples/cap-ath10k-tcp-upload-wpa2/

Some notes are near the top of each report, and in general:

The station machine is sending to/from wired Eth1 to/from the
stations, ie it is both sides of the network.
The AP is configured as router.  Both systems are running
our customized 10.1.467-ct firmware, and near the latest ath10k kernel.  Station
machine is Fedora 17, AP is Fedora 19.  Both are 64-bit, CPU is a mobile core-i7,
8GB RAM, SSD hard drives (not that it should matter).

Due to the vagaries of ath10k hardware and our firmware, we get hardware acceleration when
sending encrypted packets, but we have to decrypt received packets on the CPU.

I am not sure why open TCP throughput is so bad compared to upload.
I'll run some UDP tests when I get a chance.


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
