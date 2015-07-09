Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDG3D-0005qB-Go
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 17:55:59 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 8442940AC0B
 for <ath10k@lists.infradead.org>; Thu,  9 Jul 2015 10:55:38 -0700 (PDT)
Message-ID: <559EB59A.2000509@candelatech.com>
Date: Thu, 09 Jul 2015 10:55:38 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Updated CT firmware uploaded.
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

Changes since last email of this nature:

  *  Fix crash related to a race where packet was (re)sent to a peer
     that had been deleted.  The crash was in the rate-ctrl logic,
     and was seen when an Apple MAC laptop with bcom AC NIC did a network
     discovery while connected to ath10k AP and while running iperf.
     The ath10k AP disconnects the MAC in this case, which can trigger
     the firmware bug.  Possibly, a better solution is to force a flush
     of the peer's tx queue when deleting a peer.  A note has been made
     to revisit this in the future.

  *  Allow over-riding thresh62_ext and some ack-timing registers.
     thresh62_ext has been tested, the others have not at this time.
     This may help with some regulatory testing issues.

  *  Fix beacon concurrency issues:  The firmware did not properly go
     in an 'rx-all-beacons' mode when more than 2 station vdevs were
     created.  This left the third receiving no beacons if connected to
     a different AP from the others.


And note:  For anyone doing IBSS/ADHOC with my firmware, please use
the beta builds until I can do an official version-14 release.

http://www.candelatech.com/ath10k.php

http://www.candelatech.com/downloads/ath10k-fw-beta/

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
