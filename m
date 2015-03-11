Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVm6g-0005gi-Iy
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 19:15:51 +0000
Date: Wed, 11 Mar 2015 20:15:26 +0100
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH RFC v2] ath10k: move code from parameter list into a
 function
Message-ID: <20150311191526.GA24455@opentech.at>
References: <1426100519-20636-1-git-send-email-hofrat@osadl.org>
 <1426101010.1904.9.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1426101010.1904.9.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Jeff Haran <Jeff.Haran@citrix.com>, Valdis.Kletnieks@vt.edu, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Nicholas Mc Guire <hofrat@osadl.org>, Pat Erley <pat-lkml@erley.org>, Bj??rn Mork <bjorn@mork.no>

On Wed, 11 Mar 2015, Johannes Berg wrote:

> On Wed, 2015-03-11 at 15:01 -0400, Nicholas Mc Guire wrote:
> > Putting code into the parameter list of wait_event_timeout() might be
> > legal C-code but not really readable - the "inline" code is simply
> > moved into a function and that passed to wait_event_timeout() as the
> > condition.
> 
> Arguably, that's even more unreadable since if you don't know this macro
> well you might assume the function is called only once, which is clearly
> not true...
> 
> Don't get me wrong, I'm not opposed to this change, but if you ask me
> it's not completely clear that this makes it more readable.
>
I'm not into this long enough to say what is better and if the consensus
is that this patch is no more readable than the original code
and no more maintainable either, then it is not worth the effort.

so thanks for your comments!

thx!
hofrat 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
