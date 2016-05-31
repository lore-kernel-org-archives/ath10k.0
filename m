Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7fNf-00010Q-NB
 for ath10k@lists.infradead.org; Tue, 31 May 2016 08:50:32 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldad-ath10k@m.gmane.org>) id 1b7fNF-0005vG-00
 for ath10k@lists.infradead.org; Tue, 31 May 2016 10:50:05 +0200
Received: from proxyext.iabg.de ([proxyext.iabg.de])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Tue, 31 May 2016 10:50:04 +0200
Received: from pommnitz by proxyext.iabg.de with local (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Tue, 31 May 2016 10:50:04 +0200
From: jpo <pommnitz@yahoo.com>
Subject: Please don't puke: Modifying Frame Version,
 Beacon and Probe-Response values
Date: Tue, 31 May 2016 08:44:48 +0000 (UTC)
Message-ID: <loom.20160531T102350-834@post.gmane.org>
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

Hello all,
to implement a "Stealth feature", e.g. the WLAN network does not show up in
normal Scans, we modified the Frame version, Beacon and Probe-Response
values for an old ATH5K card running on the now dormant Madwifi driver.
Question: Is the same thing even POSSIBLE with ath10k? My main concern is,
that the firmware just won't handle non-standard values.

Can somebody who understands the division of labor between mac80211, ath10k,
the firmware and the hardware suppress his or her gag reflex long enough to
think about this?

Thanks in advance
  Joerg


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
