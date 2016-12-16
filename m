Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHl0k-0000sh-AW
 for ath10k@lists.infradead.org; Fri, 16 Dec 2016 05:24:51 +0000
Date: Fri, 16 Dec 2016 10:54:18 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH 1/2] ath10k: add accounting for the extended peer
 statistics
Message-ID: <20161216052418.GA8936@atheros-ThinkPad-T61>
References: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
 <20161215162659.GA8030@atheros-ThinkPad-T61>
 <20161215164338.GB8030@atheros-ThinkPad-T61>
 <2970240.ih558OrmaK@debian64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2970240.ih558OrmaK@debian64>
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Christian,

> On Thursday, December 15, 2016 10:13:39 PM CET Mohammed Shafi Shajakhan wrote:
> > I am also thinking, as of now there is not much use in appending
> > the extended peer stats (which gets periodically ) to the linked list
> > '&ar->debug.fw_stats.peers_extd)'  and should we get rid of the below
> > (and the required cleanup as well) 
> > 
> > list_splice_tail_init(&stats.peers_extd,
> > 		&ar->debug.fw_stats.peers_extd);
> > 
> > 
> > since rx_duration is getting updated periodically to the per sta
> > information. Kindly let me know your thoughts about this.
> 
> Yes, of course. I see what your are trying to do and I think it's much better
> to get rid of peers_extd and ath10k_fw_extd_stats_peers_free.
>
[shafi] Feel free to post the change and I can test the same for you(next week) !
Let me know if you are busy on something else, I can take this up.
As discussed, the fix to free 'extd stats' when number of peers exceeds the range
is definitely needed. Thank you for looking into this.

thanks,
shafi


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
