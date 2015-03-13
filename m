Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWTTf-00015I-KZ
 for ath10k@lists.infradead.org; Fri, 13 Mar 2015 17:34:28 +0000
Date: Fri, 13 Mar 2015 18:34:05 +0100
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH] ath10k: match wait_for_completion_timeout return type
Message-ID: <20150313173405.GB9934@opentech.at>
References: <1426094076-10134-1-git-send-email-hofrat@osadl.org>
 <87y4n0q1rq.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y4n0q1rq.fsf@kamboji.qca.qualcomm.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>

On Fri, 13 Mar 2015, Kalle Valo wrote:

> Nicholas Mc Guire <hofrat@osadl.org> writes:
> 
> > Return type of wait_for_completion_timeout is unsigned long not int.
> > An appropriately named unsigned long is added and the assignments fixed up.
> >
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> 
> Doesn't apply:
> 
> Applying: ath10k: match wait_for_completion_timeout return type
> fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/mac.c).
> Repository lacks necessary blobs to fall back on 3-way merge.
> Cannot fall back to three-way merge.
> Patch failed at 0001 ath10k: match wait_for_completion_timeout return type
>
sorry - no idea how I managed that - checking it.

Will fix it up and repost.

thx!
hofrat

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
