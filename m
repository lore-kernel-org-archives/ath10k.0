Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDe5S-0001Sl-GY
 for ath10k@lists.infradead.org; Tue, 20 Jan 2015 19:03:39 +0000
Message-ID: <54BEA673.3010709@candelatech.com>
Date: Tue, 20 Jan 2015 11:03:15 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: New ath10k CT firmware beta available.
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

For any of you using my ath10k CT firmware, please consider testing out the
latest beta.  I plan to make this the official -013 release unless problems
are found in our regression or reported by others.


The main changes since the 012 release are:

* Add IBSS/AHDOC support.
* Work-around tx-credits hang due to WMI/CE lockup in firmware.
* Attempt to fix a few (rarely seen) asserts reported by users (scan code, resource-mgr, etc)


To download:

http://www.candelatech.com/downloads/ath10k-fw-beta/


More general info on this firmware:

http://www.candelatech.com/ath10k.php


For full feature support, you might try my 3.19 kernel.  It has less testing than
the 3.17, but it has been stable enough so far.

http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.19.dev.y/.git;a=summary

git clone git://dmz2.candelatech.com/linux-3.19.dev.y


Please let me know how it goes if you try out this firmware.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
