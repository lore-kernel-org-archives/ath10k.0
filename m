Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRrVu-0002Vi-KC
 for ath10k@lists.infradead.org; Tue, 26 Jul 2016 01:50:31 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldad-ath10k@m.gmane.org>) id 1bRrVV-0008GS-Dk
 for ath10k@lists.infradead.org; Tue, 26 Jul 2016 03:50:05 +0200
Received: from 96-59-38-57.res.bhn.net ([96.59.38.57])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Tue, 26 Jul 2016 03:50:05 +0200
Received: from sdhrtht by 96-59-38-57.res.bhn.net with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Tue, 26 Jul 2016 03:50:05 +0200
From: sdhrtht <sdhrtht@outlook.com>
Subject: Fail to Capture QOS data packets in Monitoring mode -
 =?utf-8?b?UUNBOTg4eOKAj+KAjw==?=
Date: Tue, 26 Jul 2016 01:43:10 +0000 (UTC)
Message-ID: <loom.20160726T034139-557@post.gmane.org>
Mime-Version: 1.0
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

ath10k monitor failing to capture data packets with WMM enabled on AP.

AP Status: (when no QOS data Packets. MGMT and CTRL Packets are able to 
captured)
1) 0x03 (3) - Secondary channel is below Primary
2) 1 - any Channel width in secondary channel width
3) 1 - Use of RIFS permitted
4) 0x02 - Only HT STAs in the BSS, however there exists at least on 20Mhz 
STA
5) 0 - all Associated HT STAs are greenfield capable

Tested with latest CT and non-CT firmware's.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
