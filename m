Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIM9M-0008N3-6H
 for ath10k@lists.infradead.org; Mon, 02 Feb 2015 18:55:09 +0000
Message-ID: <1422903279.8755.1.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 02 Feb 2015 19:54:39 +0100
In-Reply-To: <54CFB4F4.1070807@qca.qualcomm.com>
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
 <20150127213349.GA24933@localhost> <54C824DC.5080804@qca.qualcomm.com>
 <20150128043005.GB24933@localhost> <54C875FD.3070101@qca.qualcomm.com>
 (sfid-20150128_064104_435635_7E681844)
 <1422430643.1973.1.camel@sipsolutions.net>
 <54CC0B71.9050301@codeaurora.org>
 <1422882133.1930.10.camel@sipsolutions.net>
 <54CFB4F4.1070807@qca.qualcomm.com>
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

On Mon, 2015-02-02 at 09:33 -0800, Peter Oh wrote:

> > The code (as it is before your patch) implies that it's trying to make
> > sure that before it continues, any previous writes to the PCIe device's
> > registers are posted. The only way to ensure that is to do a read to the
> > registers, as the code does now.

> Do you know how the read ensure that although the read code does not 
> check the return value?
> Can you explain how a read ensures that posted write reaches PCIe device?

You basically have the following sequence:

iowrite()
ioread()

If you look, you'll see that iowrite() is actually done (or should be,
or perhaps with appropriate syncs) on an uncached mapping. As a result,
the only thing you care about here is the PCIe bus, not the CPU cache
flush. And from there on that's just a question of PCIe bus semantics.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
