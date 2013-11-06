Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve6YM-0006PT-EL
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 17:06:02 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id rA6H5eIK014514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 6 Nov 2013 09:05:40 -0800
Message-ID: <527A76E4.3000509@candelatech.com>
Date: Wed, 06 Nov 2013 09:05:40 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Cleanup of free_vdev_map and vif limits.
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
To: ath10k@lists.infradead.org

Just FYI, I'm planning to clean up the free_vdev_map
logic.

Currently it does not deal well with the different VIF
limits in 10X firmware and earlier.  There are several places
where the vdev counts are hard-coded, etc.

I plan to have an ar->foo variable that holds the actual
max vdevs, and make the free_vdev_map 64-bit.

I also plan to add an IE to the firmware prefix so firmware can
advertise how many vdevs and stations it can support.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
