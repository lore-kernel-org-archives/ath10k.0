Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3B2D11718
	for <ath10k@archiver.kernel.org>; Fri, 25 Oct 2024 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Shoxcp3h480bf/MaRlp7RFfSIiO1DRQ9b/G/3O5b+1c=; b=u1MzS4pKfWAotj
	dtlJuve89tt+8EfdPIpOX1/OjBBBLwdBeLEabSR68cLNssB7pM2zrsqybRbKnGQvSpr4DHcPiJ6Cj
	W1wvUUPXb7yaq2ey4bsJF/KrNh0+VAjk2YDHAQWwOkgv0uGDESxLwDl1bf5XV84w9tmz3XTw51P+I
	n0ltluytiVy0xdbJx54D+uPpxFrSgc/6ZuHV0gIvoSEqRnVcpyIv37TFpkQ3zAXAc8vhhNvvUx49W
	r/GTQnBVpfE47i1zKS56tIR22iYL92BdSHTKqtu9tFlinOdEHIR3Prcbvb3f4xolj2nKR8i9Bvqdw
	jnm8uoTXNpUms/Mb7Vfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F0t-00000002qMD-0RCK;
	Fri, 25 Oct 2024 07:45:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EzY-00000002qGs-39pG
	for ath10k@lists.infradead.org;
	Fri, 25 Oct 2024 07:45:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4315eac969aso11784575e9.1
        for <ath10k@lists.infradead.org>; Fri, 25 Oct 2024 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729842254; x=1730447054; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Shoxcp3h480bf/MaRlp7RFfSIiO1DRQ9b/G/3O5b+1c=;
        b=H8JTFc5mYMCD54q1DDrNuM7Cnca0TyXAPiblcaM9r0rtK4oW55i27hFqda4kLGTh4Y
         2P6+d6XarZzvEJXbGmvbu56mFQD4O8UBTd3tsZGEnouixlRBesP+xeDk1j6a3/UYV3I7
         GjdwqUJ5v1bd91dCGAgyw8lxNfjSk3+DeQjJBVc1zP/IPqindibcnGL7AWLNmy0zgKLw
         Vpdllno22wvFSjmsqOtihmKlDjx7Cel3MNPk4Nyq/3bkrcffwTgHViXhypAsmzi6Cur7
         71rQJMm6j6ja4OCr6sCnYwibTsCl93ZIdJwiKmatRCZQQbQWOnSRJBA8e8MwbZGgZ0nO
         xt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729842254; x=1730447054;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Shoxcp3h480bf/MaRlp7RFfSIiO1DRQ9b/G/3O5b+1c=;
        b=fL8VL7juXRhBMW4dMRpHeJt8JFHLLPLADtM/pAplQEKDAiidsofH8s6OG7m7Yo5Gfe
         pnKYN/WCnMRptxCvyWdPY2DoxZfL29aNoSTmrdq66e+uCi7HyIic7SHH+UqVCEOLO1J8
         pdECrRnR+4oin/4AQYNvIv3H0pgPcuLf3b+iICkI6S4djAdnl2Cfe6cl/NiGUvWzRIO0
         LSiKI/O0zx2kS1NIE31L9HANVA8voIXynG4U12S3taQgWR3rkxi4fZyaVcOgs6n75jiY
         TtRbWidIl++lrNBGQ63M4EUJL64PCoeG0ybCCztsjjpMocXYlEAD9tWFMPsTiqrFTqKo
         5Vgg==
X-Forwarded-Encrypted: i=1; AJvYcCUlDB6bnP7OfZHCuZii9Aa5eCbdwwgmANZaovpnnKYynGde0voLFi7WU9L7yCj5axnPMWee5U0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+k5PagMagk+tAtbl8/9S2yxj0KwKHqAo70UMA5oEM5C8xFwVK
	LiIWdq+qCTBWS2JM/Jc7aYmiMvdolycxCq6v3zUEKS0wFVLSSdC093gppWFQcqE=
X-Google-Smtp-Source: AGHT+IHqGpEQ/vKDPecI19Mf9I/hj7pHAGWAj1QEt5pPdkx4Mu+LCIjrnm1o5CIW71lKN73l8P+HoA==
X-Received: by 2002:a05:600c:4689:b0:42c:b826:a26c with SMTP id 5b1f17b1804b1-4318b5a561cmr32758465e9.8.1729842254093;
        Fri, 25 Oct 2024 00:44:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360d318sm9865635e9.47.2024.10.25.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:44:13 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:44:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Remi Pommarel <repk@triplefau.lt>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Cedric Veilleux <veilleux.cedric@gmail.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in
 ath10k_flush()
Message-ID: <60d579e2-5eb7-4239-9a23-95fa4b32f351@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk@triplefau.lt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_004416_820843_CF9840CE 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

Hi Remi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Remi-Pommarel/wifi-ath10k-Implement-ieee80211-flush_sta-callback/20241022-172038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk%40triplefau.lt
patch subject: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in ath10k_flush()
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251152.A5axJliR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410251152.A5axJliR-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath10k/mac.c:8076 _ath10k_mac_wait_tx_complete() error: uninitialized symbol 'empty'.

vim +/empty +8076 drivers/net/wireless/ath/ath10k/mac.c

c4f7022f0ef0aa Remi Pommarel     2024-10-22  8062  static void _ath10k_mac_wait_tx_complete(struct ath10k *ar,
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8063  					 unsigned long queues)
5e3dd157d7e70f Kalle Valo        2013-06-12  8064  {
affd321733eebc Michal Kazior     2013-07-16  8065  	bool skip;
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8066  	long time_left;
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8067  	unsigned int q;
5e3dd157d7e70f Kalle Valo        2013-06-12  8068  
5e3dd157d7e70f Kalle Valo        2013-06-12  8069  	/* mac80211 doesn't care if we really xmit queued frames or not
d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8070  	 * we'll collect those frames either way if we stop/delete vdevs
d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8071  	 */
548db54cc1890b Michal Kazior     2013-07-05  8072  
affd321733eebc Michal Kazior     2013-07-16  8073  	if (ar->state == ATH10K_STATE_WEDGED)
828853ac58265c Wen Gong          2018-08-28  8074  		return;
affd321733eebc Michal Kazior     2013-07-16  8075  
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15 @8076  	time_left = wait_event_timeout(ar->htt.empty_tx_wq, ({
5e3dd157d7e70f Kalle Valo        2013-06-12  8077  			bool empty;
affd321733eebc Michal Kazior     2013-07-16  8078  
edb8236df4d042 Michal Kazior     2013-07-05  8079  			spin_lock_bh(&ar->htt.tx_lock);
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8080  			for_each_set_bit(q, &queues, ar->hw->queues) {

Smatch is concerned that there might not be any set bits.  (You know that the
compiler is automatically going to ininitialize empty to false so it costs
nothing to initialize it to false explicitly and silence this warning).

c4f7022f0ef0aa Remi Pommarel     2024-10-22  8081  				empty = (ar->htt.num_pending_per_queue[q] == 0);
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8082  				if (!empty)
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8083  					break;
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8084  			}
edb8236df4d042 Michal Kazior     2013-07-05  8085  			spin_unlock_bh(&ar->htt.tx_lock);
affd321733eebc Michal Kazior     2013-07-16  8086  
7962b0d898accd Michal Kazior     2014-10-28  8087  			skip = (ar->state == ATH10K_STATE_WEDGED) ||
7962b0d898accd Michal Kazior     2014-10-28  8088  			       test_bit(ATH10K_FLAG_CRASH_FLUSH,
7962b0d898accd Michal Kazior     2014-10-28  8089  					&ar->dev_flags);
affd321733eebc Michal Kazior     2013-07-16  8090  
affd321733eebc Michal Kazior     2013-07-16  8091  			(empty || skip);
5e3dd157d7e70f Kalle Valo        2013-06-12  8092  		}), ATH10K_FLUSH_TIMEOUT_HZ);
affd321733eebc Michal Kazior     2013-07-16  8093  
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8094  	if (time_left == 0 || skip)
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8095  		ath10k_warn(ar, "failed to flush transmit queue (skip %i ar-state %i): %ld\n",
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8096  			    skip, ar->state, time_left);
828853ac58265c Wen Gong          2018-08-28  8097  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


