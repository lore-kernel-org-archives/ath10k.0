Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201ADC00140
	for <ath10k@archiver.kernel.org>; Fri, 29 Jul 2022 00:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XrFafKFtflCTxeUM/efBZ6XMVCEHXzKOcOjWRlVIV4A=; b=PpmqpCq7zSIKRK
	qwj7QdJTOdFYCUKSY0lACw38u9Flj/47h7po24XQ8VjcprgttjUlZLORHVuFO/SqI8ZW+ROmw2bqr
	i6gWEq8QDSxt8+f1S/NNSHTJVEOPWQ6bamDV5/RF4Y0/DwSPgDTHiu/DNOzNOq5m9K/f91MikhMxY
	0eB5LNDk8ZnaRP6p222xma4pLEs07GasjVkRXUVU0wNidXzZyAKnDs2RwiIZbcwBkbQaEglC/a3mm
	ZtYijX0EKDTIUViysxGxxS9B3B3ZTARkHC8xzOjs0HO9aJYWfw6rCdAvAAoDqafUknqmRvcvJeBUY
	SeVK+Ks/FvSP4jD+4VHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHEJP-00GedS-As; Fri, 29 Jul 2022 00:57:07 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHEJM-00Gecw-HC
	for ath10k@lists.infradead.org; Fri, 29 Jul 2022 00:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659056224; x=1690592224;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jUlM4ogmCsvv5Mt3n2b9IPL1NtwmX1MP7C74gHHiF8A=;
  b=gU0mCeQ200tyCkdcXABxeGr0xv5yII/Oan4TNMXkeGztJTWq9Upas7Ae
   krGJePqIGbneQxO6W1EwbavzpL2BE018u5q1TAkBZCagEBoeYHDfspJuH
   f6wRil6wn2lRcN6yi2D0Hox9LVfHXE7iuKiDU7DEp4mEtIoZk33/1IYOs
   2Ac5QZAVhVgEvL6YnRsin0efWv9ol3UMAbHSe6MrFeoUeyLh8zCZn1qjh
   70FhhoynOqWRvqiTDyhyk3f3mKsjC7gsWpKSV2Qi4ZLTwbtx1Fy88MT6B
   A5qX7Zv6NVY6b7YgnBX5KT6YrtSltCON1sjhLXXwWsRObGUBJdEqHPjIl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="286209992"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="286209992"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 17:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="928548623"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2022 17:57:02 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHEJJ-000AoE-1M;
	Fri, 29 Jul 2022 00:57:01 +0000
Date: Fri, 29 Jul 2022 08:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 fdb8d57ce63cfa051edda351ef8c230f2c3cf3f8
Message-ID: <62e3303a.LFN+be+P6zWN5Rg5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_175704_612646_4E4FEC91 
X-CRM114-Status: UNSURE (   5.79  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: fdb8d57ce63cfa051edda351ef8c230f2c3cf3f8  Merge branch 'pending' into master-pending

elapsed time: 799m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20220728
riscv                randconfig-r042-20220728
s390                 randconfig-r044-20220728
x86_64                        randconfig-a002
i386                             allyesconfig
x86_64                          rhel-8.3-func
powerpc                          allmodconfig
x86_64                        randconfig-a015
arm                                 defconfig
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a012
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a013
sh                               allmodconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a003
i386                          randconfig-a014
i386                          randconfig-a005
x86_64                           rhel-8.3-syz
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
i386                          randconfig-c001
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                        generic_defconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
xtensa                  cadence_csp_defconfig
mips                           ip32_defconfig
arc                            hsdk_defconfig
sh                 kfr2r09-romimage_defconfig
sh                     sh7710voipgw_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
m68k                        m5407c3_defconfig
powerpc                     taishan_defconfig
sh                         ap325rxa_defconfig
powerpc                      tqm8xx_defconfig
arm                          lpd270_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                 randconfig-c004-20220728
powerpc              randconfig-c003-20220728
nios2                               defconfig
m68k                            mac_defconfig

clang tested configs:
hexagon              randconfig-r045-20220728
hexagon              randconfig-r041-20220728
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a004
i386                          randconfig-a006
powerpc                 mpc836x_mds_defconfig
riscv                             allnoconfig
x86_64                        randconfig-k001
powerpc                     tqm5200_defconfig
powerpc                        fsp2_defconfig
powerpc                      katmai_defconfig
powerpc                   microwatt_defconfig
powerpc                      ppc64e_defconfig
mips                          rm200_defconfig
arm                  colibri_pxa270_defconfig
arm                      pxa255-idp_defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
