Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIMyR-0006in-3I
 for ath10k@lists.infradead.org; Mon, 02 Feb 2015 19:47:55 +0000
Message-ID: <1422906446.8755.4.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 02 Feb 2015 20:47:26 +0100
In-Reply-To: <54CFD1D1.8060901@codeaurora.org>
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
 <20150127213349.GA24933@localhost> <54C824DC.5080804@qca.qualcomm.com>
 <20150128043005.GB24933@localhost> <54C875FD.3070101@qca.qualcomm.com>
 (sfid-20150128_064104_435635_7E681844)
 <1422430643.1973.1.camel@sipsolutions.net>
 <54CC0B71.9050301@codeaurora.org>
 <1422882133.1930.10.camel@sipsolutions.net>
 <54CFB4F4.1070807@qca.qualcomm.com>
 <1422903279.8755.1.camel@sipsolutions.net> <54CFCCCF.900@codeaurora.org>
 <1422904939.8755.3.camel@sipsolutions.net>
 <54CFD1D1.8060901@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>
Cc: Bob Copeland <me@bobcopeland.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Peter Oh <poh@qca.qualcomm.com>

On Mon, 2015-02-02 at 11:36 -0800, Peter Oh wrote:
> On 02/02/2015 11:22 AM, Johannes Berg wrote:
> >>> You basically have the following sequence:
> >>>
> >>> iowrite()
> >>> ioread()
> >>>
> >>> If you look, you'll see that iowrite() is actually done (or should be,
> >>> or perhaps with appropriate syncs) on an uncached mapping.
> >> since it's mmio, iowrite will be map to write, not out which is cached
> >> mapping.
> >> That's why we address "posted write" here.
> >> If it's un-cached mapping which is volatile, we don't even need ioread.
> > No, this isn't true - "posted write" in the context of this discussion
> > is about the PCIe bus. Memory writes that go through cache aren't
> > referred to as "posted writes", those are just (cached) memory writes.
> >
> >>>    As a result,
> >>> the only thing you care about here is the PCIe bus, not the CPU cache
> >>> flush. And from there on that's just a question of PCIe bus semantics.
> >> So how does ioread guarantee PCIe bus transaction done?
> > That's how PCIe works, operations are serialized, and read() has to wait
> > for a response from the device
> do you know which mechanism or which instruction set makes read() wait 
> for a response from the device?

I have no idea. I assume it's just like a DRAM read, the CPU stalls
while there's no response.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
