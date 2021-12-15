Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F82C433F5
	for <ath10k@archiver.kernel.org>; Wed, 15 Dec 2021 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LX1xz1FW8ks19wLth5z2bJxYMd/nTZWo+C+PulNJ7W4=; b=dLtpEAxUP6beoM
	mY2lvPTJZaWQYwiHmCHL5t9sqfc1rHNX9C/1vJnajIA8EZPC49K9scC6f7+tjFubnc+93Hra+xGua
	WczaA7MOiB5iIPNyym2OwoaKnJrcu90In1XIEnsppL200lHMcueTtt5yYwCKFoRn3waYG8Amibco0
	HTugSObKrcWATDz5v5BQVGg4tm/u0gqxvQWD0E4Q2pJAupIsKSaSTotBsK1xe8tHtZPSDYe2yHRQf
	eWzApGs6hvO0sZbsh106k18ZBdF3/KfHGxWVSIbvfHuFKFow2ghWPDH7S4h31mHOPVgUCfDFE/MSK
	q7VcphYxmEdoFsXxrIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxPYw-00HLKI-F0; Wed, 15 Dec 2021 08:22:58 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxPYt-00HLJS-T7
 for ath10k@lists.infradead.org; Wed, 15 Dec 2021 08:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639556575; x=1671092575;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=tO4caOcYK6zqU8sIlCWaJlrRXeEXaoC+wTkoOHOAvMU=;
 b=Li606+pT6dMgzDopcLjamsSw20qnDCzfm0yl0HQ6IMOhOa8oOAq/v89I
 ANw08dpb5uBUBlOzKqt33BEnz9IAOnLViCWg8iBuuNQNYaI32RAuaYKF4
 p/Zf4/Ppomyoa/LLuNgv+tXekoSnTMExhfuoDSHbm7sLKBGZQt5JVugIc
 NL4KdcZRKr2XqLNsN9AjitfZ9pCp6CVDpbRU3rHEqfM/WLE/yTfvJC0dX
 zZRlVg47nxGRtrMq7HELPlFsosUNlYY1IWOO+Z9LG2AdogMUa+P0jY64g
 u+ev8OHOXYIpps9fyx8L5b7pRKmtMTIDDssmG7XeIVUbPCHrEhv2HFDeG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219861139"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="219861139"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 00:22:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="482310051"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 15 Dec 2021 00:22:53 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxPYq-0001U8-Tw; Wed, 15 Dec 2021 08:22:52 +0000
Date: Wed, 15 Dec 2021 16:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 f4eababebfcfdb3165ce1f7b2c366932db302910
Message-ID: <61b9a5ac.f6JubVfqNw3PSarm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_002256_002090_EAE5D0DF 
X-CRM114-Status: UNSURE (   5.58  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: f4eababebfcfdb3165ce1f7b2c366932db302910  Merge branch 'ath-next' into ath-qca

elapsed time: 923m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211214
sh                 kfr2r09-romimage_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    klondike_defconfig
powerpc                    gamecube_defconfig
powerpc64                        alldefconfig
powerpc                      pasemi_defconfig
arm                       imx_v4_v5_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          lpd270_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
arm                          imote2_defconfig
parisc                           alldefconfig
m68k                        m5307c3_defconfig
xtensa                          iss_defconfig
sh                            shmin_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                        stmark2_defconfig
m68k                             alldefconfig
arm                            qcom_defconfig
sparc64                             defconfig
h8300                    h8300h-sim_defconfig
arm                        shmobile_defconfig
sh                           se7724_defconfig
arm                        magician_defconfig
powerpc                   motionpro_defconfig
arm                  randconfig-c002-20211214
ia64                                defconfig
ia64                             allmodconfig
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
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211214
x86_64               randconfig-a005-20211214
x86_64               randconfig-a001-20211214
x86_64               randconfig-a002-20211214
x86_64               randconfig-a003-20211214
x86_64               randconfig-a004-20211214
i386                 randconfig-a001-20211214
i386                 randconfig-a002-20211214
i386                 randconfig-a005-20211214
i386                 randconfig-a003-20211214
i386                 randconfig-a006-20211214
i386                 randconfig-a004-20211214
arc                  randconfig-r043-20211214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a011-20211214
x86_64               randconfig-a014-20211214
x86_64               randconfig-a012-20211214
x86_64               randconfig-a013-20211214
x86_64               randconfig-a016-20211214
x86_64               randconfig-a015-20211214
i386                 randconfig-a013-20211214
i386                 randconfig-a011-20211214
i386                 randconfig-a016-20211214
i386                 randconfig-a014-20211214
i386                 randconfig-a015-20211214
i386                 randconfig-a012-20211214
hexagon              randconfig-r045-20211214
s390                 randconfig-r044-20211214
riscv                randconfig-r042-20211214
hexagon              randconfig-r041-20211214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
