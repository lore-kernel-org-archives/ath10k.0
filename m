Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbLrI-0001sl-IR
 for ath10k@lists.infradead.org; Mon, 14 Sep 2015 04:59:17 +0000
Received: from [192.168.3.193] (unknown [50.34.182.146])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 5823340D706
 for <ath10k@lists.infradead.org>; Sun, 13 Sep 2015 21:58:54 -0700 (PDT)
Message-ID: <55F6540D.9080300@candelatech.com>
Date: Sun, 13 Sep 2015 21:58:53 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Need to re-associate firmware peer when SMPS_CHANGED is set?
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

While digging in 10.1 firmware, I notice that setting WMI_PEER_SMPS_STATE can cause
the chainmask to change.  And, that in turn can change all sorts of things related to
available rates and such.

Maybe we should do a re-assoc when we notice SMPS_CHANGED, similar to how it
is done for NSS_CHANGED?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
