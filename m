Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3Qlr-0003nN-DM
 for ath10k@lists.infradead.org; Sat, 05 Jul 2014 14:16:55 +0000
Received: from [192.168.1.3] (unknown [94.250.186.9])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 1547140A69D
 for <ath10k@lists.infradead.org>; Sat,  5 Jul 2014 07:16:32 -0700 (PDT)
Message-ID: <53B808BF.8070000@candelatech.com>
Date: Sat, 05 Jul 2014 07:16:31 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Question on beacon-miss handling.
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

While poking around in the firmware, I notice that ath10k
driver only requests a few vdevs to be supported by
the beacon-miss firmware logic, though the driver
supposedly supports more vdevs than that...

Any idea how this is supposed to work with more vdevs
than bmiss_offload_max_vdev?

Maybe it is best to just disable beacon-miss logic in
firmware entirely and let the driver/host handle it?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
