Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRR5T-0002RZ-9W
 for ath10k@lists.infradead.org; Thu, 04 Feb 2016 21:05:12 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 23E2140AF76
 for <ath10k@lists.infradead.org>; Thu,  4 Feb 2016 13:04:49 -0800 (PST)
From: Ben Greear <greearb@candelatech.com>
Subject: Per radio configuration
Message-ID: <56B3BCF0.7070408@candelatech.com>
Date: Thu, 4 Feb 2016 13:04:48 -0800
MIME-Version: 1.0
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

Hello!

I'm considering a case where I have multiple ath10k NICs in
a system, possibly not all the same chipset.

I may want to have one optimized for smaller number of vdevs and more
peers, and another many vdevs, fewer peers, etc.  Some chipsets

Module options are not optimal for this since there is no easy way to
have different options for different NICs.

I'm thinking about making a loadable 'firmware' file that has
text-based config, something like:

# First radio
Device=05:00.0
	vdev_count=8
	peer_count=128
         firmware_name=firmware-5-b.bin
	firmware_ver=5

# Second radio
Device=06:00.0
	vdev_count=4
	peer_count=200
         firmware_name=firmware-2.bin
	firmware_ver=2

# End of file


When parsing, Lines starting with # would be ignored.
Any un-known tokens would be ignored, for backwards/forwards compatibility.

This file would be loaded and parsed before loading other firmware images
so that we can use particular firmware images per radio.  This further lets one
optimize one radio for one thing, one for another.  For instance, if someone
requires IBSS and wants to use stock QCA firmware, they can use the 'main' firmware
for that radio, and the most recent one for another radio that needs to be a stable AP.

In addition to this, we would need to store the vdev combinations
in RAM in the 'ar' struct, so we could get rid of all of the static,
hard-coded members and set the capabilities to match the requested
values.

Any opinions on this?  Something that might be worthwhile for upstream?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
