Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB970C4167B
	for <ath10k@archiver.kernel.org>; Fri,  8 Dec 2023 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sp1v4wE3BCg8HN0778cKLUkjAMarK4IB/4ez/mE6mXk=; b=HUROqhI7/TLhrs9Nc6a9L43TUx
	emr7+dvhA5LLiFtrsHRQXe5Kr8CPqF9RezdVeA4YRkXZvJoaFAUyd++qmBOyh6KKGMO2J7SB1oc/y
	4wl2wJxWcv/hYRwOtVupTFgLDwCi7rMW7uSKfcKmx6PekgZdxXKz7KdEVWIVa+Ntfo2XIz8oTp26X
	RsM8hNoJ7PoVqZ04+WHiaHJnhnj99ty+CB4cw4nj4CN2KL6gF9eJk1dxiQND/Xffj5fMA22csoILp
	AG1TQjRoDKeLF7KeiVYQoBBH6kvguPKbI8M8RMzApcfhOwzK0vCq8DoBeNLcYSZLcSwLHcpALCR+7
	7D1sUCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBca9-00Frmj-2k;
	Fri, 08 Dec 2023 15:16:01 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBca5-00FrmL-2a
	for ath10k@lists.infradead.org;
	Fri, 08 Dec 2023 15:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702048557; x=1733584557;
  h=date:from:to:cc:subject:message-id;
  bh=FFUuJgCbmla3Y2sRxHSYIp4ARNjGjB+9TJ758XZGwg0=;
  b=GbJVW77VOfOFNTgjG6XRb+ZIIuvzW27E4KKTIuM8oyFFc9+tgIWJhlH4
   eMO/bcfe6mnOE7yZ8Fu0zWct+AFdSgt4JHimmVy0U5YQhDxvQfKp502n6
   Dl+c1vgfYbnKnX5v0qbsLTwIJv+n9A8NHJIFnj2INlLjW0DdeZHqi34PF
   Im5uYJd6HjziDE9dmmtchaJ5IYHuiXwSgulyVZHrGHiunhrW1qcDkPuoR
   pbpsA2MX/Nb6drbT+SZMF91qbaaRxlQNNJ7V9Bm7E6NIRvIJLc7G8N8CG
   x2Z1UfKwqJudkpVr4+OolAswJUwf468HySpYMp51Qrl55kVEpBrVYTa/1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="394159035"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="394159035"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 07:15:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="915986134"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="915986134"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 07:15:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBca1-000DtP-30;
	Fri, 08 Dec 2023 15:15:53 +0000
Date: Fri, 08 Dec 2023 23:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 384e8047e4b70fe413e590b91e79585b7c3daf8c
Message-ID: <202312082318.hFzB47NB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_071557_904915_F5CBD7CC 
X-CRM114-Status: UNSURE (   4.47  )
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
branch HEAD: 384e8047e4b70fe413e590b91e79585b7c3daf8c  wifi: ath12k: report tx bitrate for iw dev xxx station dump

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-001-20231208
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-002-20231208
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-vdk_hs38_smp_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-assabet_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-integrator_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-sunxi_defconfig
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
|-- csky-randconfig-001-20231208
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-randconfig-002-20231208
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-001-20231208
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-002-20231208
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-defconfig
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-mvme147_defconfig
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- mips-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-001-20231208
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-002-20231208
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
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
|-- riscv-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-defconfig
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-edosk7705_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-se7206_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-i386_defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-x86_64_defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- xtensa-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
`-- xtensa-generic_kc705_defconfig
    `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute

elapsed time: 1723m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231208   gcc  
arc                   randconfig-002-20231208   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   clang
arm                      integrator_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                   randconfig-001-20231208   clang
arm                   randconfig-002-20231208   clang
arm                   randconfig-003-20231208   clang
arm                   randconfig-004-20231208   clang
arm                           sunxi_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231208   clang
arm64                 randconfig-002-20231208   clang
arm64                 randconfig-003-20231208   clang
arm64                 randconfig-004-20231208   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231208   gcc  
csky                  randconfig-002-20231208   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231208   clang
hexagon               randconfig-002-20231208   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231208   clang
i386         buildonly-randconfig-002-20231208   clang
i386         buildonly-randconfig-003-20231208   clang
i386         buildonly-randconfig-004-20231208   clang
i386         buildonly-randconfig-005-20231208   clang
i386         buildonly-randconfig-006-20231208   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231208   clang
i386                  randconfig-002-20231208   clang
i386                  randconfig-003-20231208   clang
i386                  randconfig-004-20231208   clang
i386                  randconfig-005-20231208   clang
i386                  randconfig-006-20231208   clang
i386                  randconfig-011-20231208   gcc  
i386                  randconfig-012-20231208   gcc  
i386                  randconfig-013-20231208   gcc  
i386                  randconfig-014-20231208   gcc  
i386                  randconfig-015-20231208   gcc  
i386                  randconfig-016-20231208   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231208   gcc  
loongarch             randconfig-002-20231208   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231208   gcc  
nios2                 randconfig-002-20231208   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

