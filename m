Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e3HZQ-0002jv-P0
 for ath10k@lists.infradead.org; Sat, 14 Oct 2017 08:13:22 +0000
Received: by mail-wr0-x244.google.com with SMTP id v91so1070456wrc.5
 for <ath10k@lists.infradead.org>; Sat, 14 Oct 2017 01:13:00 -0700 (PDT)
Date: Sat, 14 Oct 2017 09:12:57 +0100
From: Christos Gkekas <chris.gekas@gmail.com>
Subject: Re: [PATCH] ath10k: spectral: Simplify error checking
Message-ID: <20171014081257.GA3961@inspiron>
References: <1507491026-28690-1-git-send-email-chris.gekas@gmail.com>
 <87fuannse6.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fuannse6.fsf@kamboji.qca.qualcomm.com>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 13/10/17 12:28:50 +0000, Kalle Valo wrote:
> Christos Gkekas <chris.gekas@gmail.com> writes:
> 
> > Variable val is unsigned so checking whether it is less than zero is
> > redundant.
> >
> > Signed-off-by: Christos Gkekas <chris.gekas@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/spectral.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/spectral.c b/drivers/net/wireless/ath/ath10k/spectral.c
> > index dd9cc09..1867937 100644
> > --- a/drivers/net/wireless/ath/ath10k/spectral.c
> > +++ b/drivers/net/wireless/ath/ath10k/spectral.c
> > @@ -403,10 +403,7 @@ static ssize_t write_file_spectral_count(struct file *file,
> >  		return -EFAULT;
> >  
> >  	buf[len] = '\0';
> > -	if (kstrtoul(buf, 0, &val))
> > -		return -EINVAL;
> > -
> > -	if (val < 0 || val > 255)
> > +	if (kstrtoul(buf, 0, &val) || val > 255)
> >  		return -EINVAL;
> 
> Removing the check for negative is correct but I don't think you are
> simplifying anything, on the contrary it's harder to read. Please keep
> the two if statements separate.
> 
> -- 
> Kalle Valo

You are right, will make the change and send a new patch.
Thanks for your time.

Christos Gkekas


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
