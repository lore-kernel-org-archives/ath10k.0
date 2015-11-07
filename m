Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zv7FR-00048t-Uh
 for ath10k@lists.infradead.org; Sat, 07 Nov 2015 17:25:54 +0000
Date: Sat, 7 Nov 2015 09:25:32 -0800
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: patch "ath10k: drop probe responses when too many are queued"
 added to staging-testing
Message-ID: <20151107172532.GA26631@kroah.com>
References: <14468483293347@kroah.com>
 <87mvuq9p2v.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mvuq9p2v.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Sat, Nov 07, 2015 at 10:43:52AM +0200, Kalle Valo wrote:
> Hi Greg,
> 
> <gregkh@linuxfoundation.org> writes:
> 
> > This is a note to let you know that I've just added the patch titled
> >
> >     ath10k: drop probe responses when too many are queued
> >
> > to my staging git tree which can be found at
> >     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> > in the staging-testing branch.
> >
> > The patch will show up in the next release of the linux-next tree
> > (usually sometime within the next 24 hours during the week.)
> >
> > The patch will be merged to the staging-next branch sometime soon,
> > after it passes testing, and the merge window is open.
> >
> > If you have any questions about this process, please let me know.
> 
> Did you apply this and the few other ath10k patches to staging by
> mistake? I had already applied them to my ath.git tree and linus already
> has them:
> 
> 7b7da0a02192 ath10k: drop probe responses when too many are queued

Yeah, sorry about that, my script went wrong when I merged in Linus's
latest tree into my branch.  Sorry for the noise.

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
