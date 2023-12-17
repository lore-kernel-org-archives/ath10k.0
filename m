Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B300C3DA6E
	for <ath10k@archiver.kernel.org>; Sun, 17 Dec 2023 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YHk64mFUcx92grYnCCBvGY0i4MYezPmRtpO/KjVssZw=; b=tcf7ZUnjJeX7s7dE/47QCJFz2+
	zm8ZXI6KT8PXVZfkJ+LNt8xSGsC22kwU1x6CWfZ55qvOsGA4ip9wbZUmoDXOiQiMIYeh3lCTdyPWb
	AAPYMhhOq+qF8GO/ZfQWb8fpnD+PTknA9yVgE7kVWcNa9CoaJhfk6usNMs5z6JORjxO56wZfSp0fi
	eCnxyTer5qR6lrYkSYT3x3g/jbl9cTE3x/2oDFZObHYK/q4RUze3+7IXNCPzJOfXO35OomHO8bMB7
	xRgRGuYdQgg5UPh+C8PE9mfEhIIF6o2DlEmLhEUFYep0AmKvK66jXhiceludmgHvGQfpWmW+nX22G
	ZcUe91ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEqY8-007oiS-2I;
	Sun, 17 Dec 2023 12:47:16 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEqY5-007ohX-0R
	for ath10k@lists.infradead.org;
	Sun, 17 Dec 2023 12:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702817233; x=1734353233;
  h=date:from:to:cc:subject:message-id;
  bh=q4KCklO+LUAnbYA/dXoOxw+CdldSjwKL6H/FOgnXJjA=;
  b=bPc0KO9tUGzFe4auuxg6ZD3LvXY3x3TRiBBfDo0PAXUfvAeVga/VC07P
   Ojk5j3A5BJQEE7W3Y4JSv+KYANpGGq45fI4/wgWg1KMTgXfBK8PBtf7ra
   ghw09X7qedx5x3XtCPEEk6fiAanMFM27AdZlceFtU0bPbQtqRW2B/KEuS
   ESBYLUm1IFEJOhqCbfx+1gljIVt9//DyESYLDhSyMMj7D/9gUQeJvFnbT
   +CBQ/GESBoaFaK2QxQLZrPjFknJewldAlYwiIullPjAqRs2epJJPY2I4G
   303hr+UX9zILxC5LQnI7Nk822pKsUa2lKX8ClTB/Vn70WFyTPJnsFPq6s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2264826"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="2264826"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 04:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="893488654"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="893488654"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2023 04:47:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEqXz-00032g-0B;
	Sun, 17 Dec 2023 12:47:07 +0000
Date: Sun, 17 Dec 2023 20:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 043d9b6e5f748e898cabe0d4f3e691653e4441d2
Message-ID: <202312172050.YNUU6fMT-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_044713_279118_0A28ACA1 
X-CRM114-Status: UNSURE (   4.44  )
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
branch HEAD: 043d9b6e5f748e898cabe0d4f3e691653e4441d2  wifi: ath12k: support default regdb while searching board-2.bin for WCN7850

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allnoconfig
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
|-- i386-buildonly-randconfig-001-20231216
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-002-20231216
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-003-20231216
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-004-20231216
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-005-20231216
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-006-20231216
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-001-20231216
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-002-20231216
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-003-20231216
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-004-20231216
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-005-20231216
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-006-20231216
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-defconfig
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
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
|-- um-defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-i386_defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-x86_64_defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
`-- xtensa-allnoconfig
    `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
clang_recent_errors
|-- arm-defconfig
|   |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
|   `-- WARNING:modpost:drivers-rtc-rtc-sh:section-mismatch-in-reference:sh_rtc_platform_driver-(section:.data)-sh_rtc_remove-(section:.exit.text)
`-- i386-allmodconfig
    |-- WARNING:modpost:drivers-pci-controller-dwc-pci-exynos:section-mismatch-in-reference:exynos_pcie_driver-(section:.data)-exynos_pcie_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-pci-controller-dwc-pcie-kirin:section-mismatch-in-reference:kirin_pcie_driver-(section:.data)-kirin_pcie_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-rtc-rtc-mv:section-mismatch-in-reference:mv_rtc_driver-(section:.data)-mv_rtc_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-rtc-rtc-pcap:section-mismatch-in-reference:pcap_rtc_driver-(section:.data)-pcap_rtc_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-video-fbdev-atmel_lcdfb:section-mismatch-in-reference:atmel_lcdfb_driver-(section:.data)-atmel_lcdfb_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-analog-tv:section-mismatch-in-reference:tvc_connector_driver-(section:.data)-tvc_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-dvi:section-mismatch-in-reference:dvi_connector_driver-(section:.data)-dvic_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-hdmi:section-mismatch-in-reference:hdmi_connector_driver-(section:.data)-hdmic_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-opa362:section-mismatch-in-reference:opa362_driver-(section:.data)-opa362_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tfp410:section-mismatch-in-reference:tfp410_driver-(section:.data)-tfp410_remove-(section:.exit.text)
    |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tpd12s015:section-mismatch-in-reference:tpd_driver-(section:.data)-tpd_remove-(section:.exit.text)
    `-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-panel-dpi:section-mismatch-in-reference:panel_dpi_driver-(section:.data)-panel_dpi_remove-(section:.exit.text)

elapsed time: 1756m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231216   gcc  
i386         buildonly-randconfig-002-20231216   gcc  
i386         buildonly-randconfig-003-20231216   gcc  
i386         buildonly-randconfig-004-20231216   gcc  
i386         buildonly-randconfig-005-20231216   gcc  
i386         buildonly-randconfig-006-20231216   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231216   gcc  
i386                  randconfig-002-20231216   gcc  
i386                  randconfig-003-20231216   gcc  
i386                  randconfig-004-20231216   gcc  
i386                  randconfig-005-20231216   gcc  
i386                  randconfig-006-20231216   gcc  
i386                  randconfig-011-20231216   clang
i386                  randconfig-012-20231216   clang
i386                  randconfig-013-20231216   clang
i386                  randconfig-014-20231216   clang
i386                  randconfig-015-20231216   clang
i386                  randconfig-016-20231216   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc64                             defconfig   gcc  
um                                allnoconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

