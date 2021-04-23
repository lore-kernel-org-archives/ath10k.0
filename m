Return-Path: <SRS0=b4Sx=JU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C460CC433ED
	for <ath10k@archiver.kernel.org>; Fri, 23 Apr 2021 03:57:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39BEE61422
	for <ath10k@archiver.kernel.org>; Fri, 23 Apr 2021 03:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39BEE61422
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KMU41+5InYKrnn709MpPAxVnwUMTFRAN4Def03Tf3O0=; b=cOqa0XjBGwGU6LB856Qe1l3llr
	XsvTW5mrIVlC6rdzDVn4DqrDjxGRkqRqFVYkHz2aY20NTrnVG2daU0xLWa2i+rHukZm8wmfs+D2AM
	8enqq/sWJzjTMI2IyN495J+7NUzCVxO9YmQmwWnEOnumOehuCqyNeAcX8GzxdIe6GEDVjdYfGaTcA
	DNcLWoyCYszJAbzVLrn+oU5OmE0GmB2oAe+732WKI/EOMxYfJBZ9AzOfct+1+tAgJt1QAZmnem3Me
	MIdYKTcmV7vluN+l4IjFxJU+Ltu+X/kt59VrE1+mMmhQSuqkmz09Ma22JBh5dWWe860xQxeroM0B8
	1nxSDq8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmwl-000Xez-1j; Fri, 23 Apr 2021 03:57:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmwO-000XeE-BR
 for ath10k@desiato.infradead.org; Fri, 23 Apr 2021 03:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=tGPcgibOFgcf5HTno6KEUOxXJ6mQlzxG3aUzQgtFSLM=; b=aYYBQKqRx1i/JpZajfRe86+rEn
 8EZEIJWPWHkiZmJlA16p2i6jJkmwe6GbSSBsOZORV2ZTE9cwlrkS2EJNUEAkV9ntiJUUjpfkROEYu
 pIDAsm3TsLhEqiaOflm9QnuV15ai4h9RKzR0q8NsFL9oMgcOK9KRVv5Ks0zwBCWVxxU8C+w04QA6a
 x2isyP10S9rdErNF8e/hgxR97UEFsmk1eJcUWFuklBaa/Das36p9k6sTGWwqTwS8VsIXo5Qdeaf81
 9zhBBtR7aADq7wFOsDrcP5+of/8aLBrnIcFgOiZ1Fba0Mupw8a2FbWeDrAxJEzPf78yvQUVpEvWDd
 GEgu5e6A==;
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmwJ-00E7yO-SA
 for ath10k@lists.infradead.org; Fri, 23 Apr 2021 03:57:13 +0000
IronPort-SDR: UieyUxvvLC6uwwrKUjkzL0i8b+ef7rly2hDrbRUG6ILFOE0lSd8xcYdkyHfnRt1iOxX3cL2Vbh
 JmPjpfxmUiwg==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="196069906"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="196069906"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 20:57:08 -0700
IronPort-SDR: wBi7xwNNeIyLcs8CpW7aN04B8/hWqZITJiQsc40Eydt+LlP+cakb3vDPWxRYccis8B+xWapiVT
 vxm2VVJHwSSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="535426259"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 22 Apr 2021 20:57:07 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lZmwE-0004Vl-Pg; Fri, 23 Apr 2021 03:57:06 +0000
Date: Fri, 23 Apr 2021 11:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-next] BUILD SUCCESS
 ff9f732a87caa5f7bab72bea3aaad58db9b1ac60
Message-ID: <6082457a.44qLAboE/lazQ78f%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_205711_999487_FDE57CFD 
X-CRM114-Status: UNSURE (   3.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: ff9f732a87caa5f7bab72bea3aaad58db9b1ac60  ath11k: fix warning in ath11k_mhi_config

elapsed time: 725m

configs tested: 198
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
arm                           spitz_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      acadia_defconfig
um                           x86_64_defconfig
sh                            titan_defconfig
powerpc                  storcenter_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      ep88xc_defconfig
arc                      axs103_smp_defconfig
powerpc                 linkstation_defconfig
arm                         s5pv210_defconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
nios2                            alldefconfig
mips                         bigsur_defconfig
arm                           h3600_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                  mpc885_ads_defconfig
mips                          rm200_defconfig
arc                           tb10x_defconfig
arm                     eseries_pxa_defconfig
parisc                           alldefconfig
powerpc                      mgcoge_defconfig
mips                        omega2p_defconfig
arm                          exynos_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
powerpc                       ebony_defconfig
arc                            hsdk_defconfig
arm                       versatile_defconfig
arm                        cerfcube_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      chrp32_defconfig
sh                          sdk7786_defconfig
arm                       cns3420vb_defconfig
um                               alldefconfig
arm                          lpd270_defconfig
sh                           se7724_defconfig
arm                          pcm027_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
ia64                            zx1_defconfig
mips                      maltasmvp_defconfig
arm                           sama5_defconfig
mips                malta_qemu_32r6_defconfig
mips                     cu1000-neo_defconfig
arm                           u8500_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
xtensa                         virt_defconfig
openrisc                         alldefconfig
powerpc                     powernv_defconfig
powerpc                   currituck_defconfig
ia64                      gensparse_defconfig
sh                          kfr2r09_defconfig
sh                        sh7763rdp_defconfig
csky                             alldefconfig
powerpc                     kmeter1_defconfig
powerpc                  iss476-smp_defconfig
openrisc                  or1klitex_defconfig
mips                      pic32mzda_defconfig
nios2                            allyesconfig
mips                        maltaup_defconfig
mips                        vocore2_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                      pistachio_defconfig
arm                          pxa910_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc832x_rdb_defconfig
openrisc                    or1ksim_defconfig
powerpc                       maple_defconfig
sh                           se7751_defconfig
m68k                            mac_defconfig
mips                   sb1250_swarm_defconfig
h8300                       h8s-sim_defconfig
sparc                               defconfig
powerpc                     ep8248e_defconfig
mips                          rb532_defconfig
powerpc                     tqm8548_defconfig
powerpc                     mpc512x_defconfig
arm                         at91_dt_defconfig
arm                         palmz72_defconfig
arm                            dove_defconfig
mips                            e55_defconfig
arm                           sunxi_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      walnut_defconfig
powerpc                     rainier_defconfig
arm                           stm32_defconfig
powerpc                     mpc83xx_defconfig
arm                        trizeps4_defconfig
powerpc                         ps3_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         3c120_defconfig
arm                        neponset_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme16x_defconfig
ia64                          tiger_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210423
x86_64               randconfig-a004-20210423
x86_64               randconfig-a001-20210423
x86_64               randconfig-a005-20210423
x86_64               randconfig-a006-20210423
x86_64               randconfig-a003-20210423
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a005-20210422
i386                 randconfig-a002-20210422
i386                 randconfig-a001-20210422
i386                 randconfig-a006-20210422
i386                 randconfig-a004-20210422
i386                 randconfig-a003-20210422
i386                 randconfig-a005-20210423
i386                 randconfig-a002-20210423
i386                 randconfig-a001-20210423
i386                 randconfig-a006-20210423
i386                 randconfig-a004-20210423
i386                 randconfig-a003-20210423
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
i386                 randconfig-a014-20210422
i386                 randconfig-a012-20210422
i386                 randconfig-a011-20210422
i386                 randconfig-a013-20210422
i386                 randconfig-a015-20210422
i386                 randconfig-a016-20210422
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
