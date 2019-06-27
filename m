Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgZsA-0000F2-J2
 for ath10k@lists.infradead.org; Thu, 27 Jun 2019 19:15:55 +0000
Message-ID: <a6c87741bc3e992bf61d2706834e069917018745.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] ath10k: pci: remove unnecessary casts
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 27 Jun 2019 21:15:48 +0200
In-Reply-To: <58e8952b87c8aa533c15fe5650f3f71288377f36.camel@sipsolutions.net>
 (sfid-20190627_211239_098282_F39328B4)
References: <1561661250-30528-1-git-send-email-kvalo@codeaurora.org>
 <1561661250-30528-2-git-send-email-kvalo@codeaurora.org>
 (sfid-20190627_204740_465294_470A1055)
 <58e8952b87c8aa533c15fe5650f3f71288377f36.camel@sipsolutions.net>
 (sfid-20190627_211239_098282_F39328B4)
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
To: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Thu, 2019-06-27 at 21:12 +0200, Johannes Berg wrote:
> On Thu, 2019-06-27 at 21:47 +0300, Kalle Valo wrote:
> > Fixes checkpatch warnings:
> > 
> > drivers/net/wireless/ath/ath10k/pci.c:926: unnecessary cast may hide bugs, see http://c-faq.com/malloc/ma
> > drivers/net/wireless/ath/ath10k/pci.c:1072: unnecessary cast may hide bugs, see http://c-faq.com/malloc/m
> 
> I think you cut off the link there, did you mean
> http://c-faq.com/malloc/mallocnocast.html perhaps?

Which I should've read before replying ... WHAT? We consider calling
undeclared functions an *error* in the kernel, this is quite pointless.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
