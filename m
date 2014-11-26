Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtQx1-0005Fq-Oa
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 00:59:24 +0000
Message-ID: <547525D4.5080701@candelatech.com>
Date: Tue, 25 Nov 2014 16:59:00 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: IBSS mode is now supported by CT firmware.
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

A company that wishes to remain anonymous is sponsoring my
effort to add IBSS (ADHOC) support to my 10.1.467 CT firmware.

The kernel driver must be patched to enable IBSS mode when
CT firmware is detected.

The firmware was improved by copying some of the missing IBSS
code from the 999.x firmware branch.

I still cannot get WPA2 encryption to work, but open authentication
seems to work fine.  I still have a good bit more testing to do.
I cannot get ath9k to do encryption in IBSS mode either, so I
probably am mis-configuring something.

If someone wants to try this out, please download the appropriate
firmware binary from here:

http://www.candelatech.com/downloads/ath10k-fw-beta/

Either hack your own kernel, or grab my latest 3.17 kernel:

git clone git://dmz2.candelatech.com/linux-3.17.dev.y

I'm interested to know results if someone tries it out.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
