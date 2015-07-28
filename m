Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK8Wt-0006mq-QI
 for ath10k@lists.infradead.org; Tue, 28 Jul 2015 17:19:05 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 5BBE140A032
 for <ath10k@lists.infradead.org>; Tue, 28 Jul 2015 10:18:39 -0700 (PDT)
Message-ID: <55B7B96E.5020804@candelatech.com>
Date: Tue, 28 Jul 2015 10:18:38 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: CT firmware available with management-over-HTT (tested)
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

For those interested, I have uploaded a new beta build (version 15)
that enables management frames over the normal HTT transport.  This
has now been tested, and some bugs in the original attempt have been
fixed.

One user reports that the 'wmi timeout' issues have been resolved
by this patch.

Basic AP, Station, and IBSS testing has been completed
successfully.

This requires a driver patch...see the release notes for a link to
the patch.  Our 4.0 kernel has been patched.  3.17 has not.  And, for
4.2 and similar kernels, you need a somewhat different patch than what
we have in 4.0.  In general, HTT-MGT frames on CT firmware should
take the exact same path as data frames (native-wifi type, use-fragments).
HTT version is '2.2' for HTT-MGT CT firmware, so you can use that to check
to enable CT HTT-MGT path or not.

# Release notes
http://www.candelatech.com/downloads/ath10k-fw-beta/release_notes.txt

# Firmware binary
http://www.candelatech.com/downloads/ath10k-fw-beta/firmware-2-ct-full-htt-mgt-community.bin

I'd be curious to know the results if anyone gives this a try.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
