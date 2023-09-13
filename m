Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CF1EE020A
	for <ath10k@archiver.kernel.org>; Wed, 13 Sep 2023 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aH4mqleys+1Z/WbHYzynxu9hHtPXFxujLtVOSisg0UE=; b=BOlDft2lZGVJqx
	Qa2spGec494Fvm0e2jZgevvphBs4xYzVnZZNI0PDppSwFrAx8502AK7/A1HTvJA84kfu9U7jvFBPd
	hH+61toBnl+d2tdodX5Q0TKsF3nRIPP32nmdCyPqSdRnVdB/4TfhzDTmJ/ZvDtCsMOjpIBKb2NLF8
	Yxs3N0nN5wxPr+dLh0w+QwsNsUJJffNxBst2OzAHXbrT4pSj5U16VdyupLjTeTjojG+YP+PcqQxlP
	vbQOlyEGbeV3+G/ob4MWu0bqKxiyQUlmJoYYDsNHph8oNopGHGMyX1I2+DMa8J6JShubuwEicfH0K
	fEiy0L9nhfMWrbFHWG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVT3-006bfb-1L;
	Wed, 13 Sep 2023 19:24:05 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVT0-006beK-0E
	for ath10k@lists.infradead.org;
	Wed, 13 Sep 2023 19:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694633042; x=1726169042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNe9PpuREl4o1SuMhqGlMthlpYLgOoAbfNgfXgbwpIo=;
  b=caN8gl+5UA8ANt1zT73pCyk7Xd7FlalzHxaL2PQd8xLeauHgXIsiDYca
   ulNayuaZG9UH+hU9aDF1cKr3WKOBiWgriWhaATTuyUs0GLF9uFqfszKgn
   SVogrdlWi2OYxzcevR/xVTfCV4nlxnn5Q6IjX2jSU6h0djiEMVbd9ywn/
   GB8JE0huKgeM86QOnzbZZQIo4sRzdTkdZ7xojsnTjkuAIFE4Rv4R2Pmv4
   xQhkK8EWiyHVyi6sHjLTvP8NNVl7jbu3Ejce8Viw2X+EvqD/ruYtY0jKo
   HBB3C18ojdxoulKtqlR/LWI+IojEeBYbYzFU9jjCQObB+0P3eh19KcQqm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377673268"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377673268"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 12:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="917962141"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="917962141"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Sep 2023 12:23:58 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgVSu-0000Vs-2M;
	Wed, 13 Sep 2023 19:23:56 +0000
Date: Thu, 14 Sep 2023 03:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>
Subject: [kvalo-ath:ath11k-testmode 6/7]
 drivers/net/wireless/ath/ath12k/testmode.c:28:16: warning: no previous
 prototype for 'ath12k_tm_get_ar'
Message-ID: <202309140338.JIMolIml-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_122402_116637_58BCCF70 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-testmode
head:   ba2a7d5c57ba0703f64cf849c0299ac23eb1c1f5
commit: b50dc57cafcdbdeab2e799fa6e3148498e7805d7 [6/7] wifi: ath12k: add factory test mode support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309140338.JIMolIml-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140338.JIMolIml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140338.JIMolIml-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/testmode.c:28:16: warning: no previous prototype for 'ath12k_tm_get_ar' [-Wmissing-prototypes]
      28 | struct ath12k *ath12k_tm_get_ar(struct ath12k_base *ab)
         |                ^~~~~~~~~~~~~~~~


vim +/ath12k_tm_get_ar +28 drivers/net/wireless/ath/ath12k/testmode.c

    27	
  > 28	struct ath12k *ath12k_tm_get_ar(struct ath12k_base *ab)
    29	{
    30		struct ath12k_pdev *pdev;
    31		struct ath12k *ar;
    32		int i;
    33	
    34		for (i = 0; i < ab->num_radios; i++) {
    35			pdev = &ab->pdevs[i];
    36			ar = pdev->ar;
    37	
    38			if (ar && ar->state == ATH12K_STATE_TM)
    39				return ar;
    40		}
    41	
    42		return NULL;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
