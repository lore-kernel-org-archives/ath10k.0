Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8498C46CA2
	for <ath10k@archiver.kernel.org>; Tue, 19 Dec 2023 19:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XYROEJATyxRO8qkNhk6qA+4hM9tprMvHfqkFq1TGB3o=; b=rOk1TcUkjAJZa0+TOGaseaS/S2
	gCfXCoQbWgSsvLLcVs/EcM/v7Z7QKb7kMNVxoXSdm7uav4xnRCx3dvCOktpGMerakTI/zsfzHqlvX
	rOmXCyqNUPfkQoHKRhd4whSnJo0lHWkqYTQs0slKw3WMsONMAskXdkKCFybaRxsOTm3kurFJh8zTj
	r+9S1NUUg/lsqPebWhELFzeFhNkHskm9oSylqIOfmTC2nyyL3Yb7yvkvxmeDHRLm0KQGcHbi0+i0a
	+E+App0Yehm3Lm3on7X6a63Hi2qPaSYfiYp2d6vyW5lufbJ0ijpyalg6N3cEasHbqG+Kp1jtJW/Zg
	HOvLlMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFg4E-00FLuv-0E;
	Tue, 19 Dec 2023 19:47:50 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFg4A-00FLuU-1C
	for ath10k@lists.infradead.org;
	Tue, 19 Dec 2023 19:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703015266; x=1734551266;
  h=date:from:to:cc:subject:message-id;
  bh=7eWOnM3PivCNb3jmpvOJN9CDPdfkGAQygdu2y2vTlGU=;
  b=kHTgwXkgvrFUEmpBlgyMnttVW38fil8roRp0Z423YKF98lngQFJjyvyB
   SPt63yMgcq2HaKS/bkcAhU37acioGC3z+XiMhIW/TXMeLBU2duzTUuisI
   mTdVFQ4FtV4ohG4ohdCX7MpUEW4hoZbKaP858YKkHpqvciHVpkA9zhkk9
   0khBcACj9keDgqb6FhJfmARtDQIr5oocxTOQWM9YvfDZRdjjEQ8qtTP64
   mO32tQ/EnLmsvRWlvb74JMGZySg6uwdz1pbLvlHnLnzfs4e6mAoC8/dzK
   WMKFkY/qfAWP/XjWOjc2HvGpwnPq+Ze7WSVaFT0vltVHKlLdW6/mO9TaF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="460057388"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="460057388"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 11:47:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="899483867"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="899483867"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Dec 2023 11:47:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFg44-0005sj-1J;
	Tue, 19 Dec 2023 19:47:40 +0000
Date: Wed, 20 Dec 2023 03:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 5b9b62e679c1f8410b8145edc576e53ba7824528
Message-ID: <202312200308.CCMR51z5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_114746_473793_EF529F44 
X-CRM114-Status: UNSURE (   3.02  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 5b9b62e679c1f8410b8145edc576e53ba7824528  wifi: ath12k: Make QMI message rules const

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-nsimosci_hs_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-001-20231220
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-002-20231220
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-shmobile_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-tegra_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-011-20231219
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-012-20231219
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-013-20231219
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-014-20231219
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-015-20231219
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-016-20231219
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-061-20231220
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-062-20231220
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-063-20231220
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-r133-20231220
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-defconfig
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-m5307c3_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-randconfig-r132-20231220
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- mips-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- mips-decstation_r4k_defconfig
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-defconfig
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-titan_defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-i386_defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-001-20231219
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-003-20231219
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-004-20231219
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-005-20231219
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-006-20231219
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-r112-20231220
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- xtensa-generic_kc705_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
`-- xtensa-iss_defconfig
    `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute

elapsed time: 1479m

configs tested: 119
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20231220   gcc  
arc                   randconfig-002-20231220   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   clang
arm                        shmobile_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231219   clang
i386         buildonly-randconfig-002-20231219   clang
i386         buildonly-randconfig-003-20231219   clang
i386         buildonly-randconfig-004-20231219   clang
i386         buildonly-randconfig-005-20231219   clang
i386         buildonly-randconfig-006-20231219   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231219   clang
i386                  randconfig-002-20231219   clang
i386                  randconfig-003-20231219   clang
i386                  randconfig-004-20231219   clang
i386                  randconfig-005-20231219   clang
i386                  randconfig-006-20231219   clang
i386                  randconfig-011-20231219   gcc  
i386                  randconfig-012-20231219   gcc  
i386                  randconfig-013-20231219   gcc  
i386                  randconfig-014-20231219   gcc  
i386                  randconfig-015-20231219   gcc  
i386                  randconfig-016-20231219   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                     cu1830-neo_defconfig   clang
mips                 decstation_r4k_defconfig   gcc  
mips                           ip27_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                    adder875_defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231219   clang
x86_64       buildonly-randconfig-002-20231219   clang
x86_64       buildonly-randconfig-003-20231219   clang
x86_64       buildonly-randconfig-004-20231219   clang
x86_64       buildonly-randconfig-005-20231219   clang
x86_64       buildonly-randconfig-006-20231219   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231219   gcc  
x86_64                randconfig-002-20231219   gcc  
x86_64                randconfig-003-20231219   gcc  
x86_64                randconfig-004-20231219   gcc  
x86_64                randconfig-005-20231219   gcc  
x86_64                randconfig-006-20231219   gcc  
x86_64                randconfig-011-20231219   clang
x86_64                randconfig-012-20231219   clang
x86_64                randconfig-013-20231219   clang
x86_64                randconfig-014-20231219   clang
x86_64                randconfig-015-20231219   clang
x86_64                randconfig-016-20231219   clang
x86_64                randconfig-071-20231219   clang
x86_64                randconfig-072-20231219   clang
x86_64                randconfig-073-20231219   clang
x86_64                          rhel-8.3-rust   clang
xtensa                generic_kc705_defconfig   gcc  
xtensa                          iss_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

