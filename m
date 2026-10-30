Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE96606A321
	for <ath10k@archiver.kernel.org>; Fri, 30 Oct 2026 06:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IRPjWVtl;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ta8fp3s4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cf6iy9oHtlZWbLxZ+1iZWA1366GURTBJ3phBMmkuzYc=; b=IRPjWVtlUTeW2pMGYKe+TOWmnS
	C4Q6XHI/ME3UUsaGCuDlpb+iY6B9li1+vt1GjrykzWiB7aY1tLWlCC/UONxvN5FgyxD9UDIQ8XjB+
	/XeKq0nmUPsWVW/Tr9UeRx+TQhnqvofw5XBki1iA//MsOVieDfK5lPtdepY6tgciYK0yTtZEuDsIg
	1WXGaYYYkqnBBcePTgvFMiRxODxlJINEXZoepxAnxUZ5AmeyCs+JElhisaQkOpkRzmRbQ36k7Pi0O
	bpKsm1VLpQp8sQg2bg5jLlHwJMD9JH66wSKH4sg7vgl4isUr3BWTRvOMWiv8I6Gxjk8wYSr8S7no8
	iydxMRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgPn-0000000AuzB-1J8E;
	Fri, 30 Oct 2026 06:48:39 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgPk-0000000Auyc-0Gv6
	for ath10k@lists.infradead.org;
	Fri, 30 Oct 2026 06:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793342916; x=1824878916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IUQk8g38/sUWUuvYSNz6J7vGLBBv85cH4vsW/TIJkXM=;
  b=Ta8fp3s4Xw0Hy97itjJizBXUoy0xPQcUmUMJ0o3m/alVFBVHBKeYuBRe
   tgyBJ7chfkRzEJr+YPBA7xo4rcDF6PvWKK4EkfNeJgigdPOhpIy53aM1C
   TjEnwTWYqO8l2zlMJCjN8Vz+3DdUqVP/k4wirmmMFsn4jRXzVlDvBigRa
   rtJqJhQnqIh/TRLlKW8tU9lhjyyrS5mArGWxsr1GkYzHP3M4ruDD8RyX9
   YlqH0N7APdceyq7/B8IyJDvHaO8rCrHberoQiGQYAUducfWG+e0N/O4xw
   Zazz1aNvZS21kkg9BYjL1DjCEBmK2NbES4tt10LX7nasvR5JD6Nj2WYhh
   A==;
X-CSE-ConnectionGUID: K0/bxr+aSQKPLfWGlZX+rg==
X-CSE-MsgGUID: J0swheZtTNapElJ9w0FEXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1983092"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1983092"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 23:48:35 -0700
X-CSE-ConnectionGUID: oU40DDAvSRukqBvV7Q+8sg==
X-CSE-MsgGUID: UPMs6LhdT6+Q24nOkaQW6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="7189165"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 29 Oct 2026 23:48:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMgPe-00000000bOq-1sbR;
	Fri, 30 Oct 2026 06:48:30 +0000
Date: Fri, 30 Oct 2026 14:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
Message-ID: <202610301453.rMXyuD6F-lkp@intel.com>
References: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_234836_141314_632C34BC 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -4.4 (----)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ath/ath-next]
[also build test WARNING on wireless/main wireless-next/main linus/master v7.3 next-20261029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/wifi-ath10k-Drop-unused-qmi_elem_info-arrays/20261029-121128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20261029111127.85147-2-krzysztof.kozlowski%40oss.qualcomm.com
patch subject: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261030/202610301453.rMXyuD6F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301453.rMXyuD6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301453.rMXyuD6F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:229:35: warning: 'wlfw_mem_seg_resp_s_v01_ei' defined but not used [-Wunused-const-variable=]
     229 | static const struct qmi_elem_info wlfw_mem_seg_resp_s_v01_ei[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:188:35: warning: 'wlfw_mem_seg_s_v01_ei' defined but not used [-Wunused-const-variable=]
     188 | static const struct qmi_elem_info wlfw_mem_seg_s_v01_ei[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~


vim +/wlfw_mem_seg_resp_s_v01_ei +229 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c

bc17d4b90cdd3e5 Govind Singh 2018-10-11  187  
11e1fcf2b494da8 Jeff Johnson 2022-09-14 @188  static const struct qmi_elem_info wlfw_mem_seg_s_v01_ei[] = {
bc17d4b90cdd3e5 Govind Singh 2018-10-11  189  	{
bc17d4b90cdd3e5 Govind Singh 2018-10-11  190  		.data_type      = QMI_UNSIGNED_4_BYTE,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  191  		.elem_len       = 1,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  192  		.elem_size      = sizeof(u32),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  193  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  194  		.tlv_type       = 0,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  195  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  196  					   size),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  197  	},
bc17d4b90cdd3e5 Govind Singh 2018-10-11  198  	{
bc17d4b90cdd3e5 Govind Singh 2018-10-11  199  		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  200  		.elem_len       = 1,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  201  		.elem_size      = sizeof(enum wlfw_mem_type_enum_v01),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  202  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  203  		.tlv_type       = 0,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  204  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  205  					   type),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  206  	},
bc17d4b90cdd3e5 Govind Singh 2018-10-11  207  	{
bc17d4b90cdd3e5 Govind Singh 2018-10-11  208  		.data_type      = QMI_DATA_LEN,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  209  		.elem_len       = 1,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  210  		.elem_size      = sizeof(u8),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  211  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  212  		.tlv_type       = 0,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  213  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  214  					   mem_cfg_len),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  215  	},
bc17d4b90cdd3e5 Govind Singh 2018-10-11  216  	{
bc17d4b90cdd3e5 Govind Singh 2018-10-11  217  		.data_type      = QMI_STRUCT,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  218  		.elem_len       = QMI_WLFW_MAX_NUM_MEM_CFG_V01,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  219  		.elem_size      = sizeof(struct wlfw_mem_cfg_s_v01),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  220  		.array_type       = VAR_LEN_ARRAY,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  221  		.tlv_type       = 0,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  222  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  223  					   mem_cfg),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  224  		.ei_array      = wlfw_mem_cfg_s_v01_ei,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  225  	},
bc17d4b90cdd3e5 Govind Singh 2018-10-11  226  	{}
bc17d4b90cdd3e5 Govind Singh 2018-10-11  227  };
bc17d4b90cdd3e5 Govind Singh 2018-10-11  228  
11e1fcf2b494da8 Jeff Johnson 2022-09-14 @229  static const struct qmi_elem_info wlfw_mem_seg_resp_s_v01_ei[] = {
bc17d4b90cdd3e5 Govind Singh 2018-10-11  230  	{
bc17d4b90cdd3e5 Govind Singh 2018-10-11  231  		.data_type      = QMI_UNSIGNED_8_BYTE,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  232  		.elem_len       = 1,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  233  		.elem_size      = sizeof(u64),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  234  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  235  		.tlv_type       = 0,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  236  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  237  					   addr),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  238  	},
bc17d4b90cdd3e5 Govind Singh 2018-10-11  239  	{
bc17d4b90cdd3e5 Govind Singh 2018-10-11  240  		.data_type      = QMI_UNSIGNED_4_BYTE,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  241  		.elem_len       = 1,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  242  		.elem_size      = sizeof(u32),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  243  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  244  		.tlv_type       = 0,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  245  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  246  					   size),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  247  	},
bc17d4b90cdd3e5 Govind Singh 2018-10-11  248  	{
bc17d4b90cdd3e5 Govind Singh 2018-10-11  249  		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  250  		.elem_len       = 1,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  251  		.elem_size      = sizeof(enum wlfw_mem_type_enum_v01),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  252  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  253  		.tlv_type       = 0,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  254  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e5 Govind Singh 2018-10-11  255  					   type),
bc17d4b90cdd3e5 Govind Singh 2018-10-11  256  	},
bc17d4b90cdd3e5 Govind Singh 2018-10-11  257  	{}
bc17d4b90cdd3e5 Govind Singh 2018-10-11  258  };
bc17d4b90cdd3e5 Govind Singh 2018-10-11  259  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

