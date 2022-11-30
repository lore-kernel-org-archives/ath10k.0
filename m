Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEDAC433FE
	for <ath10k@archiver.kernel.org>; Wed, 30 Nov 2022 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F/7CQQnM5Xyv+rX0240qOsmpqtaGEJ0wmauwWYC+H98=; b=FVDSoUtFHPh3uc
	dVv8W+xccGtcUqfcCO3IGoSlh3PSn/rPIVbmXMpShD4oNTIRfj+2v+j6R5mfWdHLW88jgu6LJHraO
	9gyN8+NbmyrH/AFCcXa59yesA/WUVDr62guocounHKx1+axuawH4MTreaZTEu9Fb1JVzfcR82L0Pr
	fVjBvcoBOTSdwPP9PC2QfujSjd6ARiTlbLIxjXQjsTApNdTCdNziBxjwIBEzW3+npNCFCpi1mF6CB
	M2UhDgHyE6YYcy8qTIybkWpolYKh2QNqWwbVnhACWVHkrrXv3tU0hyboN4tuiqdSFfcvF3MU/o8aH
	+/tvPsGn/XvBb6jtTSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0K4k-00FN4H-Dg; Wed, 30 Nov 2022 10:12:22 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0K4h-00FN0j-Rf
	for ath10k@lists.infradead.org; Wed, 30 Nov 2022 10:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669803139; x=1701339139;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Gx7yEIHg6S7igjvM+qzy9rxb2Gd9UUL/8KL4EcH+blM=;
  b=j2MvvKtbNNW//OLAkGayp5h24rD6K7Te3c2HntFKJpp+FcnrxEvI/MB4
   yHhxifhnkSA9B15CXq55lpyJr4bHIHyQVAWl/1oyC3Rqgk3xGtnOpbss6
   SOjKaRkFmcptsDoO9x19j7Wix+ShvIElCyiiI9I761qpIGxU+SqCFfdK4
   x/LUsG4wR3YQzYeXAbtBl0/GUCyNbxmVaWJgyPpmUNec57rBLmLEgKEIw
   ueC34Mq9iruiPFKfX4wAOQgaRhCh9CTFlJ7oMTLh95ucasRugbCFnzYFO
   gLXjDn0qHP9svFACcB4lGmEvgNh1Kp+9E0W5gnE2h8+bG95sPs2wkcV8S
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="314051540"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="314051540"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 02:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="712752950"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="712752950"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2022 02:12:00 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0K4O-000Aya-04;
	Wed, 30 Nov 2022 10:12:00 +0000
Date: Wed, 30 Nov 2022 18:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 d889913205cf7ebda905b1e62c5867ed4e39f6c2
Message-ID: <63872c63.aQx+OFNKSSTYUM01%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_021219_979459_0EA08A26 
X-CRM114-Status: UNSURE (   6.44  )
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
branch HEAD: d889913205cf7ebda905b1e62c5867ed4e39f6c2  wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices

elapsed time: 1385m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
m68k                             allyesconfig
s390                             allyesconfig
i386                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a002-20221128
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a004-20221128
x86_64                           rhel-8.3-syz
i386                 randconfig-a005-20221128
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a006-20221128
x86_64                               rhel-8.3
arc                  randconfig-r043-20221128
i386                             allyesconfig
x86_64                           allyesconfig
sh                               allmodconfig
x86_64               randconfig-a002-20221128
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64               randconfig-a005-20221128
mips                             allyesconfig
x86_64               randconfig-a001-20221128
x86_64               randconfig-a006-20221128
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64                            allnoconfig
sh                        sh7763rdp_defconfig
powerpc                         ps3_defconfig
xtensa                  cadence_csp_defconfig
mips                      maltasmvp_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
s390                 randconfig-r044-20221128
hexagon              randconfig-r045-20221128
i386                 randconfig-a012-20221128
hexagon              randconfig-r041-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
riscv                randconfig-r042-20221128
i386                 randconfig-a014-20221128
x86_64               randconfig-a012-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a013-20221128
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
