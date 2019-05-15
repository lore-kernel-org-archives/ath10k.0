Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQj5q-00063q-2p
 for ath10k@lists.infradead.org; Wed, 15 May 2019 01:52:31 +0000
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net
 [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 1CEEA16320
 for <ath10k@lists.infradead.org>; Tue, 14 May 2019 18:52:29 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Problem with 9984 in routed mode with 512b frames.
Message-ID: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
Date: Tue, 14 May 2019 18:52:28 -0700
MIME-Version: 1.0
Content-Language: en-US
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
To: ath10k <ath10k@lists.infradead.org>

Hello,

I found a strange issue and curious if someone has seen similar.

I made an AP where the AP interface acts as a routed interface.  I generate
traffic through another interface in the router.  When sending 300Mbps of 512 byte
UDP payloads, in the downstream direction, and with the station being a 1x1 /AC device,
then the AP NIC appears to mostly lock up within about 1 minute.  I still see beacons, but no
data frames.  In some cases, I reproduced with very slow speed traffic as well.

I tried using a mostly un-modified firmware (ie, similar to upstream QCA), as well as my
hacked upon firmware, and all act similarly.  I'm using the 4.20 kernel, but at least for now,
it does not appear to be a kernel issue.

If I use larger MTU sized frames, or have a 2x2 station instead of 1x1 then it is much harder
to reproduce (and maybe cannot be reproduced).  Also, when generating traffic directly on
the AP device instead of using the routed interface as a traffic source, it is harder to
reproduce.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
