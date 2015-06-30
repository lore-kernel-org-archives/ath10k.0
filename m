Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9xL9-0006wK-0k
 for ath10k@lists.infradead.org; Tue, 30 Jun 2015 15:20:51 +0000
Received: from [192.168.0.197] (dsl-69-172-67-44.acanac.net [69.172.67.44])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 6A4CF40A7E2
 for <ath10k@lists.infradead.org>; Tue, 30 Jun 2015 08:20:28 -0700 (PDT)
Message-ID: <5592B3BB.2080909@candelatech.com>
Date: Tue, 30 Jun 2015 08:20:27 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: ANQP to second AP while associated to a first.
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

In our testing we are trying to do 802.11r roaming with ANQP.

After initial association, we do not see ANQP on the air when trying
to roam to a new AP.

I think the problem might be that the firmware has issues sending
packets to a second AP when we are already associated to a first.

I am curious if anyone has successfully tested any sort of
.11r roaming with ath10k?

And, I am curious if anyone knows if or how ath10k can send
to a second AP while connected to a different AP  (Like creating a peer for the new
AP, perhaps???)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
