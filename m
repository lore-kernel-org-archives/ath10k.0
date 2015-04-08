Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfdV8-0005Am-N3
 for ath10k@lists.infradead.org; Wed, 08 Apr 2015 00:05:51 +0000
Message-ID: <552470C7.9040002@candelatech.com>
Date: Tue, 07 Apr 2015 17:05:27 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Getting bad MIC when trying ath10k + ath9k IBSS with RSN
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
To: "hostap@lists.shmoo.com" <hostap@lists.shmoo.com>, ath10k <ath10k@lists.infradead.org>

I have been hacking on ath10k driver and firmware in attempt to enable IBSS + RSN.

Currently, I see message 1/4 in both directions, but the ath9k wpa_supplicant always reports 2/4
from ath10k station as having bad MIC (and AC supplicant dumps core shortly after when there is an EAPOL timeout,
I haven't looked into the core yet, but unlikely to be directly related to bad MIC I think since
ath9k <-> ath9k works fine).

Almost certainly this is some bug in ath10k and/or the firmware, but if someone
has some suggestions as to what it might be or how to debug it further, I would
appreciate the help!

Network capture and supplicant logs are found here:

https://www.candelatech.com/downloads/tmp/

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
