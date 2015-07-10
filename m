Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDLnh-0003TX-Jf
 for ath10k@lists.infradead.org; Fri, 10 Jul 2015 00:04:21 +0000
Message-ID: <559F0BEF.4000808@candelatech.com>
Date: Thu, 09 Jul 2015 17:03:59 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: How is AP supposed to handle power-save packets from peer?
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Suppose one is doing heavy download (AP -> peer traffic), and there are lots of frames in the
NIC's tx buffers (ath10k firmware, in this case).

Then, peer sends a power-save pkt telling AP it is going off-channel or otherwise
will be unavailable.

What is the appropriate behaviour from the AP?  Can the firmware just drop all those tx frames to
make room to handle other stations?  Maybe report ACK failure and hope the upper level stacks
retransmit as appropriate?

Or, is the host supposed to flush the peer's packets to clear out the frames?

Or, is firmware somehow supposed to keep all the frames for when the peer comes back?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
