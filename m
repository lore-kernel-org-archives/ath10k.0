Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E790C636D6
	for <ath10k@archiver.kernel.org>; Wed, 22 Feb 2023 23:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kEjRcCZ/Iq5TZ2TdqDKGchpCu1lR/Jrilb+HYI++U6c=; b=loDenA2AJRSQVK
	n9JVC5BrNg1fXRQtAG6NH88dzCkOyW6EqfLGwNSjHM+bPAFHXLZ2NfeRR71S0SW0Du2HJ+UruieB4
	IRFOWufnMHJA/JT1qb8L4r7Mkf18ImmzCLzmnzRAp4MwTMXiCAIQKVjeLH03Q3SHUvbvI8XkvwWjB
	SJO7KYnlg0tASxW5x38RFBRY3ZLenVMSUVCmFwaekAW7hse2OpXuuE6saIEdRacw2Cp4SkvqyodrR
	Bo/PyzL/zvXOe9Yn/h7bPD3wdNbk6IKhyQK6buAgKTngwsbRnzZM5wTd/ULKqsEvMR5p+Z6cMNR0J
	b2AmgRwiazT8J+/RN1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUySx-00EQXx-O5; Wed, 22 Feb 2023 23:24:03 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUySu-00EQWT-VT
	for ath10k@lists.infradead.org; Wed, 22 Feb 2023 23:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677108240; x=1708644240;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w/pNXrXZCm4dl0Dxt56rp04z9ZBHXz/sRYTvvQJw3aE=;
  b=JtQrYf5Yd6spWAt5J94L7XacQtVVPZb1prMWP09mZGp99rrUqXBLtkv1
   HrFmJQ1TI4J00jf8A4tKBDYfK/J+1wgJbzomRIqFxeETZHA7hWU+olS+2
   dCKUa9AVgUj+dR6sKi2OaLS4ATOkb04dpIHWkgq2jTkMnw8U94WZGtlBm
   GQiotGIg2sohawrgNQ7IomeiBIw7J6JZRnXRYdgLaFluYnVK2bzyo6gdb
   FuA5fCBDfhOizvEoK10S6X2bKWil32seqVBU28AI+eDm3VU/0iIMRkcPv
   4JWTaIPMADIKviBxby1LTmmYu2gp9nURlhq7uL1qSRKpesmpO2bD5qutk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="395543627"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="395543627"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 15:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="741038470"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="741038470"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2023 15:23:35 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUySU-0000nN-1j;
	Wed, 22 Feb 2023 23:23:34 +0000
Date: Thu, 23 Feb 2023 07:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 697cb64f671a9985e98e89f716254492cbfa258d
Message-ID: <63f6a3da.FR/RbMR2+OHItGgq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_152401_129637_999CB637 
X-CRM114-Status: UNSURE (   5.69  )
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
branch HEAD: 697cb64f671a9985e98e89f716254492cbfa258d  Merge branch 'ath-next' into ath-qca

elapsed time: 758m

configs tested: 88
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                     haps_hs_smp_defconfig
arc                  randconfig-r043-20230222
arm                              allmodconfig
arm                              allyesconfig
arm                        clps711x_defconfig
arm                                 defconfig
arm                        multi_v7_defconfig
arm                  randconfig-r046-20230222
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                        mvme16x_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                     decstation_defconfig
mips                    maltaup_xpa_defconfig
nios2                               defconfig
openrisc                       virt_defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                    amigaone_defconfig
powerpc                        cell_defconfig
powerpc                 linkstation_defconfig
powerpc                     stx_gp3_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sh                            shmin_defconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                               rhel-8.3

clang tested configs:
hexagon              randconfig-r041-20230222
hexagon              randconfig-r045-20230222
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
mips                      malta_kvm_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8560_defconfig
riscv                randconfig-r042-20230222
s390                 randconfig-r044-20230222
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
