Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217EBD3C55E
	for <ath10k@archiver.kernel.org>; Fri, 18 Oct 2024 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PDd4QTcUgUWvTz38ShhzLJf4muGLCDzjQvYxmLqn1k=; b=zBOQKDbLbORStl15mKyqEDGkO3
	uQmFq8Jjr2Q7iAOzi8uCj6huB6q9RMV6p3O9/ZRyGyS+6H4w1ocbF1lwiOp+OD2ddDkAOZm86XBSv
	BiHq59Pq2T+2TbjmiMUQVWv7Ky+4K36l+FX4Mj2U3zpYkpR5Djtck2bSuqLSGGLkNWGiwmZOhrqoo
	N71iD0py+28UIxflMYeYZwmRzQWg5COmQyWRqZVKoC+k+VTsh0WHQeR2HRb4HSGqiaaCMocDqHbrK
	P/nZiq/KEoyzj17oXydePwrwgl3ZcLXg0epKWsrq85Dj9ykKTcmhk5+2dlSdg1WkXI4Pyq4CDT9FI
	34J/BdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hVb-0000000HLcb-0kU5;
	Fri, 18 Oct 2024 07:34:51 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hT2-0000000HL98-2Sj7
	for ath10k@lists.infradead.org;
	Fri, 18 Oct 2024 07:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1729237623; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=8PDd4QTcUgUWvTz38ShhzLJf4muGLCDzjQvYxmLqn1k=; b=Wg1Ap0cF5Z6+/6pGX6B9Ft0Gzg
	HLtRaoIPSKeMS2wIfIdatpaaAHcfr6LKtQoWLegZMHSJljuY2Weq8UxCar10AgAAufEzLmsEr770U
	oEYRof2gNkfUI0XPRY63Jv11/d85lPpkec9VQ56MhLQ4H5gAQ2xeC6sONQSEO17bfR9emNekSZnWp
	vyYSPsZY1JNMAkK8NQiqJTYoV7dso9Md1LtUXwme16LOKiYIDstw0DSpd2ofjK5qOfp0DeK/dpapN
	/RKhZOuN9gcWMOvosfGVRlgxwH/XMmC+Jp9HfIVsvLVTYpKbGEPY1uVhVZCLx5W0NFNej6TztVMJx
	m67wAClQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1729236723; h=from : subject
 : to : message-id : date;
 bh=8PDd4QTcUgUWvTz38ShhzLJf4muGLCDzjQvYxmLqn1k=;
 b=V9dyOP2EnJY6nUBPjn4iTeJaD8CGNctJ3lxaZ7lrg4fRRv5EW5UGFLlB7md9KVB6EMhie
 8H2fnY0Jvv3Ly4mhIUtRDlS7fCGex6gw42ds3fa7AitrHmxTZf1yIUd3zXy86UEVBJNufCx
 TgaBJRgtnOGokARAtULiK1qjmRDtmwsXGwSLDJe51mKM5/Zm+XvqEj2rO5mlxsOu6QRhRAi
 MB3EKVmfNZzylB1PfG2PjwRLviWqtqeHSykI5bU2RaGrsyii8QWouYLjUj5/qtzq6ElNNLv
 6hBQmJ60TwXeI6o0SAQL7PhYjkPlodxtpEvSqVwanK+36FflaRY7m0i0HOXQ==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t1hSn-TRjyG1-4L; Fri, 18 Oct 2024 07:31:57 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t1hSm-FnQW0hPkgPp-nZ6G; Fri, 18 Oct 2024 07:31:56 +0000
Date: Fri, 18 Oct 2024 09:32:07 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath10k: Implement ieee80211 flush_sta callback
Message-ID: <ZxIO90syOrMCD-_e@pilgrim>
References: <cover.1728741827.git.repk@triplefau.lt>
 <481540132c62b16f6d823b7556c11a0ce68f5c58.1728741827.git.repk@triplefau.lt>
 <f9422f76-4a9f-4b37-8a4e-271b1344668d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9422f76-4a9f-4b37-8a4e-271b1344668d@quicinc.com>
X-Smtpcorp-Track: G4yM1Shkp8MD.Fg57_Isud1rL.fQw5aANL9MZ
Feedback-ID: 510616m:510616apGKSTK:510616ssHRJDegKN
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_003213_109759_5EF8FC8C 
X-CRM114-Status: GOOD (  27.28  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2024 at 02:19:51PM -0700, Jeff Johnson wrote:
> On 10/12/2024 7:13 AM, Remi Pommarel wrote:
> > When a STA reassociates, mac80211's _sta_info_move_state() waits for all
> > pending frame to be flushed before removing the key (so that no frame
> > get sent unencrypted after key removable [0]). When a driver does not
> > implement the flush_sta callback, ieee80211_flush_queues() is called
> > instead which effectively stops the whole queue until it is completely
> > drained.
> > 
> > The ath10k driver configure all STAs of one vdev to share the same
> > queue. So when flushing one STA this is the whole vdev queue that is
> > blocked until completely drained causing Tx to other STA to also stall
> > this whole time.
> > 
> > One easy way to reproduce the issue is to connect two STAs (STA0 and
> > STA1) to an ath10k AP. While Generating a bunch of traffic from AP to
> > STA0 (e.g. fping -l -p 20 <STA0-IP>) disconnect STA0 from AP without
> > clean disassociation (e.g. remove power, reboot -f). Then as soon as
> > STA0 is effectively disconnected from AP (either after inactivity
> > timeout or forced with iw dev AP station del STA0), its queues get
> > flushed using ieee80211_flush_queues(). This causes STA1 to suffer a
> > connectivity stall for about 5 seconds (see ATH10K_FLUSH_TIMEOUT_HZ).
> > 
> > Implement a flush_sta callback in ath10k to wait only for a specific
> > STA pending frames to be drained (without stopping the whole HW queue)
> > to fix that.
> > 
> > [0]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")
> > 
> > Reported-by: Cedric Veilleux <veilleux.cedric@gmail.com>
> 
> checkpatch.pl reports:
> WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report

It has been reported on mailing list should I put the thread link here ?

> 
> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> > ---
> >  drivers/net/wireless/ath/ath10k/core.h   |  4 +++
> >  drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
> >  drivers/net/wireless/ath/ath10k/htt_tx.c | 32 ++++++++++++++++++
> >  drivers/net/wireless/ath/ath10k/mac.c    | 43 +++++++++++++++++++++++-
> >  drivers/net/wireless/ath/ath10k/txrx.c   |  3 ++
> >  5 files changed, 85 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> > index 446dca74f06a..4709e4887efc 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.h
> > +++ b/drivers/net/wireless/ath/ath10k/core.h
> > @@ -558,6 +558,10 @@ struct ath10k_sta {
> >  	u8 rate_ctrl[ATH10K_TID_MAX];
> >  	u32 rate_code[ATH10K_TID_MAX];
> >  	int rtscts[ATH10K_TID_MAX];
> > +	/* protects num_fw_queued */
> > +	spinlock_t sta_tx_lock;
> > +	wait_queue_head_t empty_tx_wq;
> > +	unsigned int num_fw_queued;
> 
> is there a reason to prefer a spinlocked value instead of using an atomic without additional locking?

No reason except to mimic what is done for num_pending. Can move that to
atomic if needed be.

Thanks,

-- 
Remi

