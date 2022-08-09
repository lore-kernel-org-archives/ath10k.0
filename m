Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F90C19F2D
	for <ath10k@archiver.kernel.org>; Tue,  9 Aug 2022 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j417KkVG+bHS813qr1Zy5iYFfvw/RLq822xXcYmYcuc=; b=knBN9f3nkOxKXt
	fG7SYwJq13l+zT+Xdw0NGeztEPZYiR6Um6QFFsPUVBTEbesiJqUkjBwp3qFVjJbeZLd5e5zE5ep5k
	5MWP7vRTc+XNt6wWSlYjJhh987ucelFliabgvLPymBlSxP47TKz9XogZv7H93EQbEIdEsvdKdXl8s
	WSvNAPJGywnOlo6jB4CXgsAtzPkd/P/BOs7sn+wz+TlK2qAEu2v79g4Y3MdSEMkFbZDeJ+fNZ10P3
	ZZ83G7IRn/rK8L4gZdMtkOGF0zIuIftaD2bqrR7YzdNs3dnRiPius+pcybUix1ycvgAT977eDx1qf
	SQoNXT/BLbxEhqBdOG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVtp-006JCD-R8; Tue, 09 Aug 2022 20:32:25 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVth-006Izl-H4
	for ath10k@lists.infradead.org; Tue, 09 Aug 2022 20:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660077137; x=1691613137;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xLQ4te8tCe4TlL6VeBv6aOgObd11B2PlPdb/qTI1cXs=;
  b=cZa/CbKElf7G3soH0TiIrPyGqVHut6IvDl1gYI4Oa/o4H/qlkYpsx+yM
   kVBKz7FsvTihFf7SXhnbmKAff4NU705Yp0hgB4rETv/8cF+bV3xRkGHn3
   +y6ghUPQtjXJWqFfks3Yxsd92CQEFHQPqppylAsKLZ4xcyD9LqzMN85i2
   j5gdz7E/kIiCbCCK54HJgYNBUIcKN7FQSle3TtZI805lPOqeWzKt0dF/V
   kQYtWlsah+Knicy6LiOyHAiG4H1u1UoTUK9rBKO6ql/P4ypPcB+yfTC9m
   uWDinhwNf1vx+wkCeBd+el5pNgzfrbzh26rp3pTN3NMUhPngrBnwlevQ6
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="270703871"
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="270703871"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 13:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="694266330"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2022 13:32:00 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLVtP-000NGE-1l;
	Tue, 09 Aug 2022 20:31:59 +0000
Date: Wed, 10 Aug 2022 04:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 df79ebf1fdfa1a69d2eaae46d51021fb19609671
Message-ID: <62f2c40e.IlmoHkYXSYtGjlu3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_133217_647123_0A0D4A6B 
X-CRM114-Status: UNSURE (   5.30  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: df79ebf1fdfa1a69d2eaae46d51021fb19609671  wifi: ath12k: hal: remove unneeded casts

elapsed time: 719m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
powerpc                           allnoconfig
i386                             allyesconfig
x86_64               randconfig-a003-20220808
x86_64               randconfig-a004-20220808
arm                                 defconfig
x86_64               randconfig-a001-20220808
x86_64               randconfig-a005-20220808
x86_64               randconfig-a002-20220808
x86_64               randconfig-a006-20220808
arc                  randconfig-r043-20220808
i386                 randconfig-a001-20220808
i386                 randconfig-a002-20220808
arm64                            allyesconfig
i386                 randconfig-a003-20220808
i386                 randconfig-a004-20220808
arm                              allyesconfig
i386                 randconfig-a006-20220808
i386                 randconfig-a005-20220808
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                ecovec24-romimage_defconfig
mips                      loongson3_defconfig
loongarch                        alldefconfig
sh                           sh2007_defconfig
sparc64                             defconfig
arm                           u8500_defconfig
csky                             alldefconfig
mips                    maltaup_xpa_defconfig
sh                   secureedge5410_defconfig
xtensa                  audio_kc705_defconfig
sh                          rsk7264_defconfig
powerpc                      chrp32_defconfig
arm                         assabet_defconfig
sparc                             allnoconfig
arm                          pxa3xx_defconfig
sh                        sh7785lcr_defconfig

clang tested configs:
hexagon              randconfig-r045-20220808
hexagon              randconfig-r041-20220808
i386                 randconfig-a011-20220808
i386                 randconfig-a013-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a014-20220808
i386                 randconfig-a015-20220808
riscv                randconfig-r042-20220808
s390                 randconfig-r044-20220808
i386                 randconfig-a016-20220808
x86_64               randconfig-a013-20220808
x86_64               randconfig-a012-20220808
x86_64               randconfig-a011-20220808
x86_64               randconfig-a014-20220808
x86_64               randconfig-a015-20220808
x86_64               randconfig-a016-20220808
arm                       mainstone_defconfig
arm                   milbeaut_m10v_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
