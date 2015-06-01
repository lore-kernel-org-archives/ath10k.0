Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-135.mimecast.com ([63.128.21.135])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzYzz-0007d8-3K
 for ath10k@lists.infradead.org; Mon, 01 Jun 2015 23:20:04 +0000
From: "Harvey, Nicholas" <NHarvey@Miltope.com>
Subject: [PATCH] ath10k: new debugfs interface to enable adaptive CCA
Date: Mon, 1 Jun 2015 23:19:33 +0000
Message-ID: <134D7FDF9A7113479AE9785A8385A34C2ABDA2FF@MILEX03.Miltope.local>
Content-Language: en-US
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Which version of QCA firmware support CCA? When I try 10.2.4.62-2 with patch (http://lists.infradead.org/pipermail/ath10k/2015-May/005175.html) we get this:
 
# echo 1 > /sys/kernel/debug/ieee80211/phy0/ath10k/adaptive_cca_enable
ath10k_pci 0000:05:00.0: firmware 10.2.4.62-2 do not support adaptive cca
Thanks,
Nicholas Harvey 

CONFIDENTIAL NOTE: This e-mail and any attachments may be
confidential and protected by legal privilege. If you are not the
intended recipient, be aware that you are hereby notified that
any unauthorized review, use, disclosure, dissemination,
distribution, or copying of this communication, or any of its
contents, is strictly prohibited. If you have received this email
in error, please notify us immediately by replying to the sender
and deleting this copy and the reply from your system.

Thank you for your cooperation.

EXPORT CONTROLLED DOCUMENT
This document may contain information whose export is restricted
by the Arms Export Control Act (Title 22, U.S.C., Sec 2751 Et
Seq.) or the International Traffic in Arms Regulation (ITAR)
under the Export Administration Act of 1979, as amended, (Title
50, U.S.C., App. 2401, Et. Seq.). Violations to these export laws
are subject to severe criminal penalties

All technical data forwarded by VT Miltope to its suppliers is
EXPORT CONTROLLED. Suppliers shall not disclose technical data in
any form to a Foreign Person (including foreign persons employed
by the Supplier), or export the technical data from the United
States without U.S. Government authority and the written
authorization of VT Miltope.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
