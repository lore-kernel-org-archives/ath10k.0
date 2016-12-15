Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHZlm-0003Xr-4D
 for ath10k@lists.infradead.org; Thu, 15 Dec 2016 17:24:38 +0000
Received: by mail-wm0-x244.google.com with SMTP id u144so7819372wmu.0
 for <ath10k@lists.infradead.org>; Thu, 15 Dec 2016 09:24:16 -0800 (PST)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [PATCH 1/2] ath10k: add accounting for the extended peer
 statistics
Date: Thu, 15 Dec 2016 18:24:13 +0100
Message-ID: <2970240.ih558OrmaK@debian64>
In-Reply-To: <20161215164338.GB8030@atheros-ThinkPad-T61>
References: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
 <20161215162659.GA8030@atheros-ThinkPad-T61>
 <20161215164338.GB8030@atheros-ThinkPad-T61>
MIME-Version: 1.0
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hello Shafi,

On Thursday, December 15, 2016 10:13:39 PM CET Mohammed Shafi Shajakhan wrote:
> I am also thinking, as of now there is not much use in appending
> the extended peer stats (which gets periodically ) to the linked list
> '&ar->debug.fw_stats.peers_extd)'  and should we get rid of the below
> (and the required cleanup as well) 
> 
> list_splice_tail_init(&stats.peers_extd,
> 		&ar->debug.fw_stats.peers_extd);
> 
> 
> since rx_duration is getting updated periodically to the per sta
> information. Kindly let me know your thoughts about this.

Yes, of course. I see what your are trying to do and I think it's much better
to get rid of peers_extd and ath10k_fw_extd_stats_peers_free.

Regards,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
