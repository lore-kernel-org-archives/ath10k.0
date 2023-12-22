Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60EEC46CD2
	for <ath10k@archiver.kernel.org>; Fri, 22 Dec 2023 02:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V3gxT4Tgx7wh4FpqMCgEi6Aee0DuVMxpVc1/7qCOfss=; b=BjEJCKqineOl1rzb6c4ygXRCZ6
	S2O9BC8de7ijBiqOkizW2XINOfX1E+dVuOvXNFcLmovnj4IM/D2+psNPYb2LiVHxZFSB/CXC5TXvF
	R7XX+Dg3imPw8Q7R4kzm3sS+iy6TlmFZpuYsDhwAK9dOpx/z0v0MZ5JJ9v6kCdUVEuAOTZzynprHy
	Y/iSST1LgfbrUQUxWX4stWe7CfbUQk4LYW4xdaxuKnjdzNXm6IuIacgzlk/4M4wDi+bQxeAXzUNfc
	I+EyK7fIy2794DE2Up02L4VdaD3Rnf0jih9aVj6Z4jd8RKW4qRiATfLrqEloILh9ib6JnwlMCGOmx
	Nj25Qr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGV7R-004fW6-19;
	Fri, 22 Dec 2023 02:18:33 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGV7M-004fVY-2K
	for ath10k@lists.infradead.org;
	Fri, 22 Dec 2023 02:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703211509; x=1734747509;
  h=date:from:to:cc:subject:message-id;
  bh=8LjMz9XIsazaAhQoPQ8tifAmMq1IM9c12b525fKYPkg=;
  b=E+/8A92E+nJmrnhSyLeJNVdPowU1NQDlUEky0MiZwuym0koRqfoidDk/
   /AOFDZKna6RgDEWynaqpNsK0MZDoXdkNqXFGIM7ucSfMBbAsFdBT04oNX
   ns66yC/86duExgRyy0LgMH5RcHf458p93zQLtTk3E1Jm2xSj5NB74scno
   9eKeCYbEpPVlf5EhpkdAMBdVmhogxlEYPYXHUSI8yR01Do6aQdmh3ImC5
   lpbyx0UllalKHhWKjU3vn8Y8YOEi95XooNUGt61YTIkm87Nt9Uf3a8+lP
   +s5VoB83e1T8xZJMADqvO+1orTIeEYlcqz3YPO4t9KuEYT3luDuaubR/0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9456501"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9456501"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 18:18:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="18894485"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2023 18:18:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGV6C-0008yz-21;
	Fri, 22 Dec 2023 02:17:37 +0000
Date: Fri, 22 Dec 2023 10:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD REGRESSION
 ff5f1e2b7cbc0b171677c2a2f5341b8e34710ba8
Message-ID: <202312221040.cVrYH0d9-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_181828_870445_711B5512 
X-CRM114-Status: UNSURE (   2.87  )
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
branch HEAD: ff5f1e2b7cbc0b171677c2a2f5341b8e34710ba8  wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-002-20231222
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-002-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-003-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-004-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-randconfig-002-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-randconfig-003-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-randconfig-004-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-randconfig-002-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-001-20231222
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-002-20231222
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-003-20231222
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-005-20231222
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-006-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-002-20231222
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-003-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-004-20231222
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-005-20231222
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-001-20231222
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-002-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-002-20231222
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-allyesconfig
|   |-- (.head.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-no-symbol
|   |-- (.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-no-symbol
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-randconfig-002-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-002-20231222
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-003-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc64-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc64-randconfig-002-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc64-randconfig-003-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-randconfig-001-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-randconfig-002-20231222
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
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
|-- sh-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
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
`-- sparc64-allyesconfig
    |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
    |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
    |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
    |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
    |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
    `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute

elapsed time: 1885m

configs tested: 72
configs skipped: 0

tested configs:
alpha                            allyesconfig   gcc  
arc                              allmodconfig   gcc  
arc                              allyesconfig   gcc  
arc                   randconfig-001-20231222   gcc  
arc                   randconfig-002-20231222   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                   randconfig-001-20231222   gcc  
arm                   randconfig-002-20231222   gcc  
arm                   randconfig-003-20231222   gcc  
arm                   randconfig-004-20231222   gcc  
arm64                 randconfig-001-20231222   gcc  
arm64                 randconfig-002-20231222   gcc  
arm64                 randconfig-003-20231222   gcc  
arm64                 randconfig-004-20231222   gcc  
csky                  randconfig-001-20231222   gcc  
csky                  randconfig-002-20231222   gcc  
hexagon               randconfig-001-20231222   clang
hexagon               randconfig-002-20231222   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231222   gcc  
i386         buildonly-randconfig-002-20231222   gcc  
i386         buildonly-randconfig-003-20231222   gcc  
i386         buildonly-randconfig-004-20231222   gcc  
i386         buildonly-randconfig-005-20231222   gcc  
i386         buildonly-randconfig-006-20231222   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231222   gcc  
i386                  randconfig-002-20231222   gcc  
i386                  randconfig-003-20231222   gcc  
i386                  randconfig-004-20231222   gcc  
i386                  randconfig-005-20231222   gcc  
i386                  randconfig-006-20231222   gcc  
i386                  randconfig-011-20231222   clang
i386                  randconfig-012-20231222   clang
i386                  randconfig-013-20231222   clang
i386                  randconfig-014-20231222   clang
i386                  randconfig-015-20231222   clang
i386                  randconfig-016-20231222   clang
loongarch             randconfig-001-20231222   gcc  
loongarch             randconfig-002-20231222   gcc  
nios2                 randconfig-001-20231222   gcc  
nios2                 randconfig-002-20231222   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231222   gcc  
parisc                randconfig-002-20231222   gcc  
powerpc                          allmodconfig   clang
powerpc               randconfig-001-20231222   gcc  
powerpc               randconfig-002-20231222   gcc  
powerpc               randconfig-003-20231222   gcc  
powerpc64             randconfig-001-20231222   gcc  
powerpc64             randconfig-002-20231222   gcc  
powerpc64             randconfig-003-20231222   gcc  
riscv                 randconfig-001-20231222   gcc  
riscv                 randconfig-002-20231222   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

