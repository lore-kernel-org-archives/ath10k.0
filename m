Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC1CC4332F
	for <ath10k@archiver.kernel.org>; Thu, 14 Dec 2023 11:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OHQehuoo9tRwI0o+EpWBqZXRZXufVlPgJ39YK2cipMk=; b=NjGHJthA09SW6+eTp5TRc7Zeuh
	iw4Q9ZXWpOlLrDOrXSjKPS44UBl8+fVQpo5QZjAd/K7Yt/L2+daugUYz7FCCB1LYsaDxee/kuWOwA
	wVElwYz7bUeysPmv1BbzQ6JAgK7yME1JJ0Oi7NqkVyg5WPyijb2ae+NozfXf977OybqpUUiDNIerb
	NW8T4LMhw/xfsqkts8SMdLRR8V/1+raeaHLCXpZu0qW7kefk6h3rhb9aNlsACJk6xAJvdN/llynd6
	tYjmbyyxOOqcnfhvr3PCaXkVl+hDTraN+zBINlR7JOT1oN8bPQxGn9hyc+ylE4lK7uM1uFCMUgxkf
	1rT2jl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDk0N-000Ac8-2R;
	Thu, 14 Dec 2023 11:35:51 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDk0H-000AZZ-0t
	for ath10k@lists.infradead.org;
	Thu, 14 Dec 2023 11:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702553745; x=1734089745;
  h=date:from:to:cc:subject:message-id;
  bh=88TTGwTwRcIcVO6zGBGiFdBkg3y0xY3Nj7yAO3Ogi14=;
  b=dPwzSbWB8LDC+YjhLEh1PZLucQYfksY3Gzd548P2nJHyLsDDxxrS22n1
   2Vvz7MqXNkDJ+/JvouIQObPfgkBuV44iWAPbuuLNz8oRukRi0cLWCdG5J
   0Xtr8KrDaqIpgNndt5ks4qseCID+oCs5XtOANdOvjkHcz6oRGlKBUg2gg
   G48C86mfffDyr4nNXtDGwsbwwNEXGgOzG+IZgVY0RffahpuOjnbIQ2bzb
   nv91eHeDZoIjxzoJtAoYeQDy8EHYueKEKpuuOZDInK7YsHEbpEelR7OZ2
   KVmUmOyMp5Js9hV3nvxjG+aKJxTPKIcO6HT3imrTJ23zO672EpGlGoXCM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="398944348"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="398944348"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:35:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="777868859"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="777868859"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2023 03:35:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDk08-000Lzm-2x;
	Thu, 14 Dec 2023 11:35:36 +0000
Date: Thu, 14 Dec 2023 19:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD REGRESSION
 55c1902a4b46bc1182a8e8f9f74a6a4e33752f70
Message-ID: <202312141930.76bu432U-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_033545_406207_318897A2 
X-CRM114-Status: UNSURE (   2.34  )
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
branch HEAD: 55c1902a4b46bc1182a8e8f9f74a6a4e33752f70  wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- alpha-defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allyesconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-axs103_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-002-20231214
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-gemini_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-imxrt_defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-integrator_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-002-20231214
|   |-- WARNING:modpost:drivers-rtc-rtc-pcap:section-mismatch-in-reference:pcap_rtc_driver-(section:.data)-pcap_rtc_remove-(section:.exit.text)
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-defconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm64-randconfig-004-20231214
|   |-- WARNING:modpost:drivers-rtc-rtc-sh:section-mismatch-in-reference:sh_rtc_platform_driver-(section:.data)-sh_rtc_remove-(section:.exit.text)
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-randconfig-001-20231214
|   |-- WARNING:modpost:drivers-pci-controller-dwc-pci-exynos:section-mismatch-in-reference:exynos_pcie_driver-(section:.data)-exynos_pcie_remove-(section:.exit.text)
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-randconfig-002-20231214
|   |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-atmel_lcdfb:section-mismatch-in-reference:atmel_lcdfb_driver-(section:.data)-atmel_lcdfb_remove-(section:.exit.text)
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-011-20231213
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-012-20231213
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-013-20231213
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-014-20231213
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-015-20231213
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-016-20231213
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-141-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-allmodconfig
|   |-- WARNING:modpost:drivers-pci-controller-dwc-pci-exynos:section-mismatch-in-reference:exynos_pcie_driver-(section:.data)-exynos_pcie_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-pci-controller-dwc-pcie-kirin:section-mismatch-in-reference:kirin_pcie_driver-(section:.data)-kirin_pcie_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-mv:section-mismatch-in-reference:mv_rtc_driver-(section:.data)-mv_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-pcap:section-mismatch-in-reference:pcap_rtc_driver-(section:.data)-pcap_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-atmel_lcdfb:section-mismatch-in-reference:atmel_lcdfb_driver-(section:.data)-atmel_lcdfb_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-analog-tv:section-mismatch-in-reference:tvc_connector_driver-(section:.data)-tvc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-dvi:section-mismatch-in-reference:dvi_connector_driver-(section:.data)-dvic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-hdmi:section-mismatch-in-reference:hdmi_connector_driver-(section:.data)-hdmic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-opa362:section-mismatch-in-reference:opa362_driver-(section:.data)-opa362_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tfp410:section-mismatch-in-reference:tfp410_driver-(section:.data)-tfp410_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tpd12s015:section-mismatch-in-reference:tpd_driver-(section:.data)-tpd_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-panel-dpi:section-mismatch-in-reference:panel_dpi_driver-(section:.data)-panel_dpi_remove-(section:.exit.text)
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
|-- loongarch-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-002-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allmodconfig
|   |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-mv:section-mismatch-in-reference:mv_rtc_driver-(section:.data)-mv_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-pcap:section-mismatch-in-reference:pcap_rtc_driver-(section:.data)-pcap_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-atmel_lcdfb:section-mismatch-in-reference:atmel_lcdfb_driver-(section:.data)-atmel_lcdfb_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-analog-tv:section-mismatch-in-reference:tvc_connector_driver-(section:.data)-tvc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-dvi:section-mismatch-in-reference:dvi_connector_driver-(section:.data)-dvic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-hdmi:section-mismatch-in-reference:hdmi_connector_driver-(section:.data)-hdmic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-opa362:section-mismatch-in-reference:opa362_driver-(section:.data)-opa362_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tfp410:section-mismatch-in-reference:tfp410_driver-(section:.data)-tfp410_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tpd12s015:section-mismatch-in-reference:tpd_driver-(section:.data)-tpd_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-panel-dpi:section-mismatch-in-reference:panel_dpi_driver-(section:.data)-panel_dpi_remove-(section:.exit.text)
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
|-- nios2-allmodconfig
|   |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-mv:section-mismatch-in-reference:mv_rtc_driver-(section:.data)-mv_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-pcap:section-mismatch-in-reference:pcap_rtc_driver-(section:.data)-pcap_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-atmel_lcdfb:section-mismatch-in-reference:atmel_lcdfb_driver-(section:.data)-atmel_lcdfb_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-analog-tv:section-mismatch-in-reference:tvc_connector_driver-(section:.data)-tvc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-dvi:section-mismatch-in-reference:dvi_connector_driver-(section:.data)-dvic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-hdmi:section-mismatch-in-reference:hdmi_connector_driver-(section:.data)-hdmic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-opa362:section-mismatch-in-reference:opa362_driver-(section:.data)-opa362_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tfp410:section-mismatch-in-reference:tfp410_driver-(section:.data)-tfp410_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tpd12s015:section-mismatch-in-reference:tpd_driver-(section:.data)-tpd_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-panel-dpi:section-mismatch-in-reference:panel_dpi_driver-(section:.data)-panel_dpi_remove-(section:.exit.text)
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
|-- nios2-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-002-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-allyesconfig
|   |-- (.head.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-no-symbol
|   |-- (.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-no-symbol
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- main.c:(.init.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-symbol-memcpy-defined-in-.text-section-in-arch-openrisc-lib-memcpy.o
|   |-- main.c:(.init.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-symbol-parameqn-defined-in-.text-section-in-kernel-params.o
|   `-- main.c:(.init.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-symbol-parse_args-defined-in-.text-section-in-kernel-params.o
|-- openrisc-defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-allmodconfig
|   |-- WARNING:modpost:drivers-pci-controller-dwc-pci-exynos:section-mismatch-in-reference:exynos_pcie_driver-(section:.data)-exynos_pcie_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-pci-controller-dwc-pcie-kirin:section-mismatch-in-reference:kirin_pcie_driver-(section:.data)-kirin_pcie_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-mv:section-mismatch-in-reference:mv_rtc_driver-(section:.data)-mv_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-pcap:section-mismatch-in-reference:pcap_rtc_driver-(section:.data)-pcap_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-atmel_lcdfb:section-mismatch-in-reference:atmel_lcdfb_driver-(section:.data)-atmel_lcdfb_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-analog-tv:section-mismatch-in-reference:tvc_connector_driver-(section:.data)-tvc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-dvi:section-mismatch-in-reference:dvi_connector_driver-(section:.data)-dvic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-hdmi:section-mismatch-in-reference:hdmi_connector_driver-(section:.data)-hdmic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-opa362:section-mismatch-in-reference:opa362_driver-(section:.data)-opa362_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tfp410:section-mismatch-in-reference:tfp410_driver-(section:.data)-tfp410_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tpd12s015:section-mismatch-in-reference:tpd_driver-(section:.data)-tpd_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-panel-dpi:section-mismatch-in-reference:panel_dpi_driver-(section:.data)-panel_dpi_remove-(section:.exit.text)
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
|-- parisc-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-randconfig-002-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-ppc64_defconfig
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-002-20231214
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-003-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc64-randconfig-001-20231214
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-hdmi:section-mismatch-in-reference:hdmi_connector_driver-(section:.data)-hdmic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-opa362:section-mismatch-in-reference:opa362_driver-(section:.data)-opa362_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tpd12s015:section-mismatch-in-reference:tpd_driver-(section:.data)-tpd_remove-(section:.exit.text)
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc64-randconfig-002-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc64-randconfig-003-20231214
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
|-- riscv-nommu_k210_sdcard_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-randconfig-002-20231214
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
|-- sh-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-randconfig-002-20231214
|   |-- WARNING:modpost:drivers-rtc-rtc-mv:section-mismatch-in-reference:mv_rtc_driver-(section:.data)-mv_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-analog-tv:section-mismatch-in-reference:tvc_connector_driver-(section:.data)-tvc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-dvi:section-mismatch-in-reference:dvi_connector_driver-(section:.data)-dvic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-opa362:section-mismatch-in-reference:opa362_driver-(section:.data)-opa362_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tfp410:section-mismatch-in-reference:tfp410_driver-(section:.data)-tfp410_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tpd12s015:section-mismatch-in-reference:tpd_driver-(section:.data)-tpd_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-panel-dpi:section-mismatch-in-reference:panel_dpi_driver-(section:.data)-panel_dpi_remove-(section:.exit.text)
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-rsk7203_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-urquell_defconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc-allmodconfig
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-isdn-capi-capiutil.c:warning:function-bufprint-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- drivers-soc-qcom-qcom_aoss.c:warning:function-qmp_send-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc-randconfig-001-20231214
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc-randconfig-002-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
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
|-- sparc64-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-randconfig-002-20231214
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-i386_defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-randconfig-001-20231214
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-randconfig-002-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- um-x86_64_defconfig
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-buildonly-randconfig-002-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-buildonly-randconfig-003-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-buildonly-randconfig-006-20231214
|   `-- WARNING:modpost:drivers-rtc-rtc-mv:section-mismatch-in-reference:mv_rtc_driver-(section:.data)-mv_rtc_remove-(section:.exit.text)
|-- x86_64-randconfig-011-20231214
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-013-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-015-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-016-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-074-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-075-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-076-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-161-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
|-- xtensa-allnoconfig
|   `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|-- xtensa-randconfig-001-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|-- xtensa-randconfig-002-20231214
|   |-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-reiserfs-prints.c:warning:function-prepare_error_buf-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- kernel-bpf-btf.c:warning:function-btf_seq_show-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- kernel-bpf-btf.c:warning:function-btf_snprintf_show-might-be-a-candidate-for-gnu_printf-format-attribute
`-- xtensa-virt_defconfig
    `-- drivers-clk-clkdev.c:warning:function-vclkdev_alloc-might-be-a-candidate-for-gnu_printf-format-attribute
clang_recent_errors
|-- arm-defconfig
|   |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
|   `-- WARNING:modpost:drivers-rtc-rtc-sh:section-mismatch-in-reference:sh_rtc_platform_driver-(section:.data)-sh_rtc_remove-(section:.exit.text)
|-- i386-allmodconfig
|   |-- WARNING:modpost:drivers-pci-controller-dwc-pci-exynos:section-mismatch-in-reference:exynos_pcie_driver-(section:.data)-exynos_pcie_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-pci-controller-dwc-pcie-kirin:section-mismatch-in-reference:kirin_pcie_driver-(section:.data)-kirin_pcie_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-at91rm9200:section-mismatch-in-reference:at91_rtc_driver-(section:.data)-at91_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-mv:section-mismatch-in-reference:mv_rtc_driver-(section:.data)-mv_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-rtc-rtc-pcap:section-mismatch-in-reference:pcap_rtc_driver-(section:.data)-pcap_rtc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-atmel_lcdfb:section-mismatch-in-reference:atmel_lcdfb_driver-(section:.data)-atmel_lcdfb_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-analog-tv:section-mismatch-in-reference:tvc_connector_driver-(section:.data)-tvc_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-dvi:section-mismatch-in-reference:dvi_connector_driver-(section:.data)-dvic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-connector-hdmi:section-mismatch-in-reference:hdmi_connector_driver-(section:.data)-hdmic_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-opa362:section-mismatch-in-reference:opa362_driver-(section:.data)-opa362_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tfp410:section-mismatch-in-reference:tfp410_driver-(section:.data)-tfp410_remove-(section:.exit.text)
|   |-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-encoder-tpd12s015:section-mismatch-in-reference:tpd_driver-(section:.data)-tpd_remove-(section:.exit.text)
|   `-- WARNING:modpost:drivers-video-fbdev-omap2-omapfb-displays-panel-dpi:section-mismatch-in-reference:panel_dpi_driver-(section:.data)-panel_dpi_remove-(section:.exit.text)
`-- powerpc-allmodconfig
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

elapsed time: 1484m

configs tested: 172
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231214   gcc  
arc                   randconfig-002-20231214   gcc  
arm                               allnoconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   clang
arm                          gemini_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                   randconfig-001-20231214   gcc  
arm                   randconfig-002-20231214   gcc  
arm                   randconfig-003-20231214   gcc  
arm                   randconfig-004-20231214   gcc  
arm                        vexpress_defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231214   gcc  
arm64                 randconfig-002-20231214   gcc  
arm64                 randconfig-003-20231214   gcc  
arm64                 randconfig-004-20231214   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231214   gcc  
csky                  randconfig-002-20231214   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231214   clang
hexagon               randconfig-002-20231214   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231213   clang
i386         buildonly-randconfig-002-20231213   clang
i386         buildonly-randconfig-003-20231213   clang
i386         buildonly-randconfig-004-20231213   clang
i386         buildonly-randconfig-005-20231213   clang
i386         buildonly-randconfig-006-20231213   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231213   clang
i386                  randconfig-002-20231213   clang
i386                  randconfig-003-20231213   clang
i386                  randconfig-004-20231213   clang
i386                  randconfig-005-20231213   clang
i386                  randconfig-006-20231213   clang
i386                  randconfig-011-20231213   gcc  
i386                  randconfig-012-20231213   gcc  
i386                  randconfig-013-20231213   gcc  
i386                  randconfig-014-20231213   gcc  
i386                  randconfig-015-20231213   gcc  
i386                  randconfig-016-20231213   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231214   gcc  
loongarch             randconfig-002-20231214   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                         cobalt_defconfig   gcc  
mips                           rs90_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231214   gcc  
nios2                 randconfig-002-20231214   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231214   gcc  
parisc                randconfig-002-20231214   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc               randconfig-001-20231214   gcc  
powerpc               randconfig-002-20231214   gcc  
powerpc               randconfig-003-20231214   gcc  
powerpc64             randconfig-001-20231214   gcc  
powerpc64             randconfig-002-20231214   gcc  
powerpc64             randconfig-003-20231214   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231214   gcc  
riscv                 randconfig-002-20231214   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231214   clang
s390                  randconfig-002-20231214   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231214   gcc  
sh                    randconfig-002-20231214   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231214   gcc  
sparc64               randconfig-002-20231214   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231214   gcc  
um                    randconfig-002-20231214   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231214   gcc  
x86_64       buildonly-randconfig-002-20231214   gcc  
x86_64       buildonly-randconfig-003-20231214   gcc  
x86_64       buildonly-randconfig-004-20231214   gcc  
x86_64       buildonly-randconfig-005-20231214   gcc  
x86_64       buildonly-randconfig-006-20231214   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231214   clang
x86_64                randconfig-002-20231214   clang
x86_64                randconfig-003-20231214   clang
x86_64                randconfig-004-20231214   clang
x86_64                randconfig-005-20231214   clang
x86_64                randconfig-006-20231214   clang
x86_64                randconfig-011-20231214   gcc  
x86_64                randconfig-012-20231214   gcc  
x86_64                randconfig-013-20231214   gcc  
x86_64                randconfig-014-20231214   gcc  
x86_64                randconfig-015-20231214   gcc  
x86_64                randconfig-016-20231214   gcc  
x86_64                randconfig-071-20231214   gcc  
x86_64                randconfig-072-20231214   gcc  
x86_64                randconfig-073-20231214   gcc  
x86_64                randconfig-074-20231214   gcc  
x86_64                randconfig-075-20231214   gcc  
x86_64                randconfig-076-20231214   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231214   gcc  
xtensa                randconfig-002-20231214   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

