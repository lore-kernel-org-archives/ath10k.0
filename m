Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072D7D0C5F0
	for <ath10k@archiver.kernel.org>; Fri, 25 Oct 2024 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvO/Y+A5F9D+Z7v2M3j3RiYz27Q9b0KXTCFNKhL41cQ=; b=E3VsTek+1eLBXo/dCYeMWDETOW
	zA8WIIBt8gsN0A6euzbkYEakms99tt+sYHb5oZCCtJFAs19GDmviWbixpuoZNgh5ox5RfTdv9uFnl
	DObU8zyzF/byQ07oz2e/XEYr1oqn4k+nU2VHfEuUGJoNYp3VP2K9OLIfpEKa9l1thbbGPCDQC2Jju
	qAYaAoLPf0jgsgIZq1iQCYxeQRHirobpUv12ZfG4EygKUfSpmCxLBC+dygmT/O5HX0WtfldDiYO6g
	aGsvq3vHCweZvHwN9QDPmLbRmRPfouLGSfX/BRpjUBcuxnrYnCh826sdlktsmliT7IsKjiUOqlGoc
	xZsulHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GQa-000000038KQ-0pCD;
	Fri, 25 Oct 2024 09:16:16 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FGx-00000002tg4-107r
	for ath10k@lists.infradead.org;
	Fri, 25 Oct 2024 08:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1729844230; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=GvO/Y+A5F9D+Z7v2M3j3RiYz27Q9b0KXTCFNKhL41cQ=; b=emOLI3q5pdvxdlPS7i6YzyhaI8
	uIwWo4W1v2Qv0npkdVajM/mHu2Yk8bF2VPek/q8+mjicPidzlyQsszMgBth1lbvmX7YH8YG4iyc6a
	eH9XP2M2u+vELK2efCX4i3NjNOGrJGiMH3hlpwSqWj3v1F526T95rPOp2LE9mT4VO/vmIPjTTFpM2
	PKyG3wABE0qzvS4NAFi6trjdV/3Jn3rVLCUrxyCnfhqsgHbyb1QCofDb9MrbkZwapC4tTlSz3WqTN
	THqZowhNGZiVmVvsVNHNW7J2VB0O7MtkiFoiuWIwv4W5UcAUatIqXfRUaE6dMRntlJXWR/89eLpyR
	sZ4lftTw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1729843330; h=from : subject
 : to : message-id : date;
 bh=GvO/Y+A5F9D+Z7v2M3j3RiYz27Q9b0KXTCFNKhL41cQ=;
 b=jc4rnO/YysHhBYEVueefocKnde53rtewmlqrto52iekD75tALCKs+DxcUNxUbFbcwTgNs
 ZPRnPa3KYz0sgOYn140dSpX4KzEN/WJJMHIhOldiFwyPwK2c7YYFKHw7UjdawwWH8q4veaG
 vIN+Zx7gvmIOer/G0vPJNwk+qcN8LYpgBIt8q+QMZeUFCy6lVZzBFBUXt0R//RNmoCai4tZ
 DFYNgOnMsl/12U8Zp35Leo91cT+DfK+gijOLhiDd/IVkJJMRnpoSEwvkYv65uR2kNj1AM3f
 hvyoHsQYqzWcWSmuG0Q/nhoLxNAbEyk8PcEbbXXy8Rn9l5lulpssh39CaHjA==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4FGg-TRjzcT-EX; Fri, 25 Oct 2024 08:01:58 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4FGg-FnQW0hQ1BVS-kG4P; Fri, 25 Oct 2024 08:01:58 +0000
Date: Fri, 25 Oct 2024 10:01:52 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Subject: Re: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in
 ath10k_flush()
Message-ID: <ZxtQcCZlQOfqkTEa@pilgrim>
References: <0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk@triplefau.lt>
 <60d579e2-5eb7-4239-9a23-95fa4b32f351@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60d579e2-5eb7-4239-9a23-95fa4b32f351@stanley.mountain>
X-Smtpcorp-Track: nTV3v-U_ou1H.BIMwQediuyKM.pwnuHweCD7C
Feedback-ID: 510616m:510616apGKSTK:510616sqkavGCBqD
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010215_812884_98B537DC 
X-CRM114-Status: GOOD (  15.55  )
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

Hi,

On Fri, Oct 25, 2024 at 10:44:09AM +0300, Dan Carpenter wrote:
> Hi Remi,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Remi-Pommarel/wifi-ath10k-Implement-ieee80211-flush_sta-callback/20241022-172038
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
> patch link:    https://lore.kernel.org/r/0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk%40triplefau.lt
> patch subject: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in ath10k_flush()
> config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251152.A5axJliR-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410251152.A5axJliR-lkp@intel.com/
> 
> New smatch warnings:
> drivers/net/wireless/ath/ath10k/mac.c:8076 _ath10k_mac_wait_tx_complete() error: uninitialized symbol 'empty'.
> 
> vim +/empty +8076 drivers/net/wireless/ath/ath10k/mac.c
> 
> c4f7022f0ef0aa Remi Pommarel     2024-10-22  8062  static void _ath10k_mac_wait_tx_complete(struct ath10k *ar,
> c4f7022f0ef0aa Remi Pommarel     2024-10-22  8063  					 unsigned long queues)
> 5e3dd157d7e70f Kalle Valo        2013-06-12  8064  {
> affd321733eebc Michal Kazior     2013-07-16  8065  	bool skip;
> d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8066  	long time_left;
> c4f7022f0ef0aa Remi Pommarel     2024-10-22  8067  	unsigned int q;
> 5e3dd157d7e70f Kalle Valo        2013-06-12  8068  
> 5e3dd157d7e70f Kalle Valo        2013-06-12  8069  	/* mac80211 doesn't care if we really xmit queued frames or not
> d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8070  	 * we'll collect those frames either way if we stop/delete vdevs
> d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8071  	 */
> 548db54cc1890b Michal Kazior     2013-07-05  8072  
> affd321733eebc Michal Kazior     2013-07-16  8073  	if (ar->state == ATH10K_STATE_WEDGED)
> 828853ac58265c Wen Gong          2018-08-28  8074  		return;
> affd321733eebc Michal Kazior     2013-07-16  8075  
> d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15 @8076  	time_left = wait_event_timeout(ar->htt.empty_tx_wq, ({
> 5e3dd157d7e70f Kalle Valo        2013-06-12  8077  			bool empty;
> affd321733eebc Michal Kazior     2013-07-16  8078  
> edb8236df4d042 Michal Kazior     2013-07-05  8079  			spin_lock_bh(&ar->htt.tx_lock);
> c4f7022f0ef0aa Remi Pommarel     2024-10-22  8080  			for_each_set_bit(q, &queues, ar->hw->queues) {
> 
> Smatch is concerned that there might not be any set bits.  (You know that the
> compiler is automatically going to ininitialize empty to false so it costs
> nothing to initialize it to false explicitly and silence this warning).

Actually I think empty should be true here, if there is no queue to
wait for being drained then no need to wait at all. Will send a v3
with that fixed.

Thanks for the report and the analysis.

-- 
Remi

