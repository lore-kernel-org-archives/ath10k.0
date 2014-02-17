Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFU89-00020V-Ns
 for ath10k@lists.infradead.org; Mon, 17 Feb 2014 19:45:34 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s1HJj4A1027004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Mon, 17 Feb 2014 11:45:04 -0800
Message-ID: <530266C0.6000104@candelatech.com>
Date: Mon, 17 Feb 2014 11:45:04 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Fwd: Question on how encryption keys are supposed to be handled.
References: <53026685.7040303@candelatech.com>
In-Reply-To: <53026685.7040303@candelatech.com>
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

Just in case someone has investigated similar issues....


-------- Original Message --------
Subject: Question on how encryption keys are supposed to be handled.
Date: Mon, 17 Feb 2014 11:44:05 -0800
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
To: linux-wireless@vger.kernel.org <linux-wireless@vger.kernel.org>,        hostap@lists.shmoo.com <hostap@lists.shmoo.com>


I've been debugging an issue where my ath10k firmware is running out of key
objects to allocate.  This could be a simple issue in the firmware, but first I
wanted to try to figure out how things are supposed to work.

What I see in my firmware is that near time of association it allocates
4 keys.  Two of them are multicast, and one of the multicast is index 0,
the second is index 1.

Then, some time later (probably on rekey), another multicast is added at index 2.

After that, key space is exhausted so I see errors in the kernel logs about adding
broadcast keys failing.

TCP and UDP traffic continues to flow, but I am not testing multicast traffic,
so maybe that would be failing.

So, question is:  Is it expected that the mcast keys keep being added at increasing
key indexes?  If so, what is the maximum index allowed?

Is this something primarily controlled at the supplicant level?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
HostAP mailing list
HostAP@lists.shmoo.com
http://lists.shmoo.com/mailman/listinfo/hostap



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
