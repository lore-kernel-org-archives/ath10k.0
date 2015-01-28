Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGNCA-0003PQ-VF
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 07:37:51 +0000
Message-ID: <1422430643.1973.1.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 28 Jan 2015 08:37:23 +0100
In-Reply-To: <54C875FD.3070101@qca.qualcomm.com>
 (sfid-20150128_064104_435635_7E681844)
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
 <20150127213349.GA24933@localhost> <54C824DC.5080804@qca.qualcomm.com>
 <20150128043005.GB24933@localhost> <54C875FD.3070101@qca.qualcomm.com>
 (sfid-20150128_064104_435635_7E681844)
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Bob Copeland <me@bobcopeland.com>, ath10k@lists.infradead.org

On Tue, 2015-01-27 at 21:39 -0800, Peter Oh wrote:

> > Ok, sure, but I/O ordering two different writes, and ensuring device
> > has seen a posted write, are related but different things, no?
> yes, they are different and wmb guarantees both.

No, wmb() doesn't. I'd be very surprised if it had any side effect on
the PCI bus even on ARM. Read Documentation/memory-barriers.txt.

And to understand (PCI) posted writes, wikipedia helps:
http://en.wikipedia.org/wiki/Posted_write

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
