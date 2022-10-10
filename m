Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD202C433FE
	for <ath10k@archiver.kernel.org>; Mon, 10 Oct 2022 22:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y7j1DrKYa3zIhy+b+wWDos4FQlzWZj+8fNqz0WfcKw4=; b=0Ya1EyZWVueM8h
	MEAVdAap9c2lTIohdyR7UUuGEnTmWH2yqEM0GcgKmuQaZZIcE3mdLU46QZ9Nvfl7dgdIwR7Qdj94K
	5NGXz45hDiMv4ASDCz7F0puisDI9MQ1TSkS4z5whHkN3wnOr7VpLe/s/rL2NIiICUjx6o9QFzX6WU
	JCoJtekBakXQMIYMPs7VkdWk9qyNWYOXxhXmT0x2TPkDYUc3v3RlJ0i6lIo3VVC0a8CoPIFeaLzf8
	0EAkzD+FjCKENfhG9b4LHttQ+tPUlFHS3ovnvSUt9tLLJF8rVb7C9OGVpNe646881PqOiBqgo3Aj/
	kOMZTQlyDgUfNyQ9GPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi17j-002RJW-4k; Mon, 10 Oct 2022 22:19:47 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi17Z-002RFD-55
	for ath10k@lists.infradead.org; Mon, 10 Oct 2022 22:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665440377; x=1696976377;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GJ9DY4reTzINRqpvqcmGFhh60/ucW7ar71IzVevprZ8=;
  b=YxjwUVmK9RXMtRYi8a4bRAfa7ZOufUhlJKgJUDOBgpCDg9voPzdnWuEQ
   W5+TRfY4kUXdJSaXzr5Yn8s8k2fQGwXHtxo7oFwzfBvoNQruknNZp/05u
   +Ge0LWGlw3imFnylY3035RXM0nBYFksuy2eQK75Au9UCnpegBNUiSpVss
   VUMAvPTaeOtxO3yXDv9tqCnHbsjKQCJuwZo6qLKka6Q2JlK6k5rvVLebC
   8gnhdN/wD+c9xvtw/b8qR0LfU0rjgeKaEWXPn5eSLuZ17mF8PlWzJRBvc
   J97grTACYrySad+Aulr11QuldPhJhoS6eiZXpMkR4NGCZxdOFiumc9SRt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="287611980"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="287611980"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 15:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="715274113"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="715274113"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2022 15:19:32 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oi17U-0002DU-0L;
	Mon, 10 Oct 2022 22:19:32 +0000
Date: Tue, 11 Oct 2022 06:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e161d4b60ae3a5356e07202e0bfedb5fad82c6aa
Message-ID: <63449a4a.ebXjG+/4OVXvdMiU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_151937_268598_07B50227 
X-CRM114-Status: UNSURE (   6.12  )
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
branch HEAD: e161d4b60ae3a5356e07202e0bfedb5fad82c6aa  wifi: ath9k: Make arrays prof_prio and channelmap static const

elapsed time: 747m

configs tested: 121
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221010
s390                 randconfig-r044-20221010
riscv                randconfig-r042-20221010
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64               randconfig-a014-20221010
x86_64               randconfig-a015-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a011-20221010
x86_64               randconfig-a013-20221010
x86_64               randconfig-a016-20221010
i386                             allyesconfig
i386                                defconfig
arm                       omap2plus_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
parisc                generic-64bit_defconfig
mips                          rb532_defconfig
parisc64                         alldefconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                 randconfig-a013-20221010
i386                 randconfig-a015-20221010
i386                 randconfig-a016-20221010
i386                 randconfig-a011-20221010
i386                 randconfig-a014-20221010
i386                 randconfig-a012-20221010
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
arm                           h5000_defconfig
arm                        keystone_defconfig
sh                      rts7751r2d1_defconfig
i386                 randconfig-c001-20221010
powerpc                     tqm8541_defconfig
sh                                  defconfig
xtensa                    xip_kc705_defconfig
mips                        bcm47xx_defconfig
xtensa                  nommu_kc705_defconfig
arm                           sama5_defconfig
arm                          pxa910_defconfig
sh                            shmin_defconfig
powerpc                      pcm030_defconfig
powerpc                 canyonlands_defconfig
sh                        sh7785lcr_defconfig
sh                          kfr2r09_defconfig
m68k                        mvme16x_defconfig
sh                         ecovec24_defconfig
arc                        nsim_700_defconfig
arm64                               defconfig
sh                           se7750_defconfig
powerpc                     rainier_defconfig
ia64                             allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                         bigsur_defconfig
powerpc                 linkstation_defconfig
arm                        trizeps4_defconfig
arm                           stm32_defconfig
arm                            pleb_defconfig
arm                         s3c6400_defconfig
arm                         lubbock_defconfig
m68k                        m5272c3_defconfig
_defconfig                            powerpc
currituck_defconfig                             m68k
m5407c3_defconfig                          powerpc
pq2fads_defconfig                              arm
integrator_defconfig                               sh
shx3_defconfig                             mips
maltasmvp_defconfig                              arm
clps711x_defconfig                             m68k
hp300_defconfig                              arm
footbridge_defconfig                               sh
sh7710voipgw_defconfig                        loongarch
allmodconfig                               sh
se7206_defconfig                               sh
edosk7760_defconfig                           x86_64
randconfig-k001-20221010                        loongarch
defconfig                           loongarch
allnoconfig                                  

clang tested configs:
i386                 randconfig-a005-20221010
i386                 randconfig-a003-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a004-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a005-20221010
arm                     am200epdkit_defconfig
arm                          ep93xx_defconfig
mips                      maltaaprp_defconfig
i386                             allyesconfig
hexagon                             defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
