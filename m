Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1048AC2BD09
	for <ath10k@archiver.kernel.org>; Thu, 27 Jun 2024 05:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LZikMGUatGVfO6f8791QZXgpJocNkAIvNh954UHgpj0=; b=jG+SWwCcbsFAiBgggevU90ilJ3
	/4I0Kg+8JgsVoRXttXxY7x2fjPZBmD5zOLWvzH7wwGYNZDqQtv+tf/NLvuhNFvQYutEivkpMZ1Fd4
	Z86I2fhVCnJzDTN6k9m6EEcm2Bai0tZgRrpsbFzDvIixsNdu7Phe5QKbHy+sMiWj7maW11Iik3ea3
	m4U48x92cVBwCnMpn6x0S9zgelKGYnmjM30HCBrpksUXImokAY1byqzOWA4TX2ZcP7O9WfJDyydQJ
	epNsjc5BA8UGoBx+WKcHOb4Zao+KO67/pRgKWb4gga05z8oOEdB+GvZPgu10tfW1X/MSAesMAVocl
	S8oeAkiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMhXf-00000009FFr-3hTW;
	Thu, 27 Jun 2024 05:19:31 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMhXb-00000009FEx-3d0a
	for ath10k@lists.infradead.org;
	Thu, 27 Jun 2024 05:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719465568; x=1751001568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4zfwwWRabIBbFALvddxGp1LG99pW+TLYh9OHPV9CgFg=;
  b=bOrTON/HmgfqoxZ3BhH2ZyIaci1B0LIxnaPoi5uJuPCydjevhow0sMXw
   joUvtatpQbB2BDNySdLXUGv9hxEJSb384OOw/WhH7e2nQujtVUwZZIjR4
   J2q5P6rP4RWay62FvDBLchC3lbzoNVkN6n4QMXZvM+FNsAZfCBsS3BA+W
   7cRf8c54RKIN0c2w0G3D5JrsVuHYtSyL8S39dUJqbLux3gGQYtA/VHpfS
   IVfYsF9jHHIrgFPo43fyf7WOq1icUviWIhSeHrTlaPQGs1aStQkRSgcoW
   88h3IVGG1ggUobGDD0DUogyv9utAcNrU9Kds8d8GFYV1U21RRNu830i90
   g==;
X-CSE-ConnectionGUID: j6iwETtVSQ2ndNj0GbqiAA==
X-CSE-MsgGUID: hfXKbXdLSRuZKtw5WQdl1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16407274"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16407274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 22:19:26 -0700
X-CSE-ConnectionGUID: tvZfU1l2Q/iwPkF2sUs0qg==
X-CSE-MsgGUID: JMh98yKRQJCkTwH9vSXtaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44087752"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2024 22:19:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMhXW-000FvA-0l;
	Thu, 27 Jun 2024 05:19:22 +0000
Date: Thu, 27 Jun 2024 13:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org,
	Kalle Valo <quic_kvalo@quicinc.com>
Subject: [kvalo-ath:pending 34/37]
 drivers/net/wireless/ath/ath12k/wow.c:982:11: warning: enumeration value
 'ATH12K_HW_STATE_TM' not handled in switch
Message-ID: <202406271317.IYXB6YVE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_221928_084360_6BC18528 
X-CRM114-Status: UNSURE (   8.91  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   ff7f6be343c446ec89addc6abb99e83a6b98abfe
commit: 5e4b86c9b76950ec6bf056e17e80d6611df66182 [34/37] wifi: ath12k: add factory test mode support
config: i386-buildonly-randconfig-003-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271317.IYXB6YVE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271317.IYXB6YVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271317.IYXB6YVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/wow.c:982:11: warning: enumeration value 'ATH12K_HW_STATE_TM' not handled in switch [-Wswitch]
     982 |                 switch (ah->state) {
         |                         ^~~~~~~~~
   1 warning generated.


vim +/ATH12K_HW_STATE_TM +982 drivers/net/wireless/ath/ath12k/wow.c

4a3c212eee0e36 Baochen Qiang 2024-06-19   929  
4a3c212eee0e36 Baochen Qiang 2024-06-19   930  int ath12k_wow_op_resume(struct ieee80211_hw *hw)
4a3c212eee0e36 Baochen Qiang 2024-06-19   931  {
4a3c212eee0e36 Baochen Qiang 2024-06-19   932  	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
4a3c212eee0e36 Baochen Qiang 2024-06-19   933  	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
4a3c212eee0e36 Baochen Qiang 2024-06-19   934  	int ret;
4a3c212eee0e36 Baochen Qiang 2024-06-19   935  
4a3c212eee0e36 Baochen Qiang 2024-06-19   936  	mutex_lock(&ar->conf_mutex);
4a3c212eee0e36 Baochen Qiang 2024-06-19   937  
4a3c212eee0e36 Baochen Qiang 2024-06-19   938  	ret = ath12k_hif_resume(ar->ab);
4a3c212eee0e36 Baochen Qiang 2024-06-19   939  	if (ret) {
4a3c212eee0e36 Baochen Qiang 2024-06-19   940  		ath12k_warn(ar->ab, "failed to resume hif: %d\n", ret);
4a3c212eee0e36 Baochen Qiang 2024-06-19   941  		goto exit;
4a3c212eee0e36 Baochen Qiang 2024-06-19   942  	}
4a3c212eee0e36 Baochen Qiang 2024-06-19   943  
4a3c212eee0e36 Baochen Qiang 2024-06-19   944  	ath12k_hif_ce_irq_enable(ar->ab);
4a3c212eee0e36 Baochen Qiang 2024-06-19   945  	ath12k_hif_irq_enable(ar->ab);
4a3c212eee0e36 Baochen Qiang 2024-06-19   946  
4a3c212eee0e36 Baochen Qiang 2024-06-19   947  	ret = ath12k_wow_wakeup(ar);
16f474d6d49db5 Baochen Qiang 2024-06-04   948  	if (ret) {
4a3c212eee0e36 Baochen Qiang 2024-06-19   949  		ath12k_warn(ar->ab, "failed to wakeup from wow: %d\n", ret);
16f474d6d49db5 Baochen Qiang 2024-06-04   950  		goto exit;
16f474d6d49db5 Baochen Qiang 2024-06-04   951  	}
16f474d6d49db5 Baochen Qiang 2024-06-04   952  
16f474d6d49db5 Baochen Qiang 2024-06-04   953  	ret = ath12k_wow_nlo_cleanup(ar);
16f474d6d49db5 Baochen Qiang 2024-06-04   954  	if (ret) {
16f474d6d49db5 Baochen Qiang 2024-06-04   955  		ath12k_warn(ar->ab, "failed to cleanup nlo: %d\n", ret);
16f474d6d49db5 Baochen Qiang 2024-06-04   956  		goto exit;
16f474d6d49db5 Baochen Qiang 2024-06-04   957  	}
4a3c212eee0e36 Baochen Qiang 2024-06-19   958  
66a9448b1b8977 Baochen Qiang 2024-06-19   959  	ret = ath12k_wow_clear_hw_filter(ar);
66a9448b1b8977 Baochen Qiang 2024-06-19   960  	if (ret) {
66a9448b1b8977 Baochen Qiang 2024-06-19   961  		ath12k_warn(ar->ab, "failed to clear hw filter: %d\n", ret);
66a9448b1b8977 Baochen Qiang 2024-06-19   962  		goto exit;
66a9448b1b8977 Baochen Qiang 2024-06-19   963  	}
66a9448b1b8977 Baochen Qiang 2024-06-19   964  
1666108c74c438 Baochen Qiang 2024-06-19   965  	ret = ath12k_wow_protocol_offload(ar, false);
1666108c74c438 Baochen Qiang 2024-06-19   966  	if (ret) {
1666108c74c438 Baochen Qiang 2024-06-19   967  		ath12k_warn(ar->ab, "failed to clear wow protocol offload events: %d\n",
1666108c74c438 Baochen Qiang 2024-06-19   968  			    ret);
1666108c74c438 Baochen Qiang 2024-06-19   969  		goto exit;
1666108c74c438 Baochen Qiang 2024-06-19   970  	}
1666108c74c438 Baochen Qiang 2024-06-19   971  
7af01e56952954 Baochen Qiang 2024-06-19   972  	ret = ath12k_wow_set_keepalive(ar,
7af01e56952954 Baochen Qiang 2024-06-19   973  				       WMI_STA_KEEPALIVE_METHOD_NULL_FRAME,
7af01e56952954 Baochen Qiang 2024-06-19   974  				       WMI_STA_KEEPALIVE_INTERVAL_DISABLE);
7af01e56952954 Baochen Qiang 2024-06-19   975  	if (ret) {
7af01e56952954 Baochen Qiang 2024-06-19   976  		ath12k_warn(ar->ab, "failed to disable wow keepalive: %d\n", ret);
7af01e56952954 Baochen Qiang 2024-06-19   977  		goto exit;
7af01e56952954 Baochen Qiang 2024-06-19   978  	}
7af01e56952954 Baochen Qiang 2024-06-19   979  
4a3c212eee0e36 Baochen Qiang 2024-06-19   980  exit:
4a3c212eee0e36 Baochen Qiang 2024-06-19   981  	if (ret) {
4a3c212eee0e36 Baochen Qiang 2024-06-19  @982  		switch (ah->state) {
4a3c212eee0e36 Baochen Qiang 2024-06-19   983  		case ATH12K_HW_STATE_ON:
4a3c212eee0e36 Baochen Qiang 2024-06-19   984  			ah->state = ATH12K_HW_STATE_RESTARTING;
4a3c212eee0e36 Baochen Qiang 2024-06-19   985  			ret = 1;
4a3c212eee0e36 Baochen Qiang 2024-06-19   986  			break;
4a3c212eee0e36 Baochen Qiang 2024-06-19   987  		case ATH12K_HW_STATE_OFF:
4a3c212eee0e36 Baochen Qiang 2024-06-19   988  		case ATH12K_HW_STATE_RESTARTING:
4a3c212eee0e36 Baochen Qiang 2024-06-19   989  		case ATH12K_HW_STATE_RESTARTED:
4a3c212eee0e36 Baochen Qiang 2024-06-19   990  		case ATH12K_HW_STATE_WEDGED:
4a3c212eee0e36 Baochen Qiang 2024-06-19   991  			ath12k_warn(ar->ab, "encountered unexpected device state %d on resume, cannot recover\n",
4a3c212eee0e36 Baochen Qiang 2024-06-19   992  				    ah->state);
4a3c212eee0e36 Baochen Qiang 2024-06-19   993  			ret = -EIO;
4a3c212eee0e36 Baochen Qiang 2024-06-19   994  			break;
4a3c212eee0e36 Baochen Qiang 2024-06-19   995  		}
4a3c212eee0e36 Baochen Qiang 2024-06-19   996  	}
4a3c212eee0e36 Baochen Qiang 2024-06-19   997  
4a3c212eee0e36 Baochen Qiang 2024-06-19   998  	mutex_unlock(&ar->conf_mutex);
4a3c212eee0e36 Baochen Qiang 2024-06-19   999  	return ret;
4a3c212eee0e36 Baochen Qiang 2024-06-19  1000  }
4a3c212eee0e36 Baochen Qiang 2024-06-19  1001  

:::::: The code at line 982 was first introduced by commit
:::::: 4a3c212eee0e36c1cd55bfbfb94041a0d3ad265b wifi: ath12k: add basic WoW functionalities

:::::: TO: Baochen Qiang <quic_bqiang@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

