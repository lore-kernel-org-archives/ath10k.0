Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27470C00144
	for <ath10k@archiver.kernel.org>; Thu,  4 Aug 2022 04:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gZo4OmTGzQT9+OFMVCZur+dtnt/lDa2tUrBgxx6QzAY=; b=c22kctyyKiBi5Y
	+O23RPMQT15vARe7A9UC9iTQHnxC0uPXs00700lgiNC9Rf6sW5qeuE0aW+HjHsHmCyOTRyyNMOKFj
	pgVJ7iD0Km1tZwopfwVn8gBByjgIqBimMDTHTZ5yxWIDDyX8s51TsCZvvbbzl272z+Ne5vvQnGOaN
	h1q0oeSw2Qz2m+K5gsqwIlHmD+ht0ofdIGFhWS7N+mYuQfHbD+QOASErTERRRI1jdynYKwugCfRPd
	nTi78bIlf8fTx5tnVjDivXHxr+2m0kSOKnODLZfnPhogS3EMDF0Ym1p48RqZw72LVmZDs6u95IuBB
	QioRfhrT43iVR0jI1hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJSLj-000Fs9-Ti; Thu, 04 Aug 2022 04:20:43 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJSLh-000FkD-Bs
	for ath10k@lists.infradead.org; Thu, 04 Aug 2022 04:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659586841; x=1691122841;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lrIUTDQolHlRvI7AzRBih+d1lm1YCMc0K3gLg4jP6Mw=;
  b=SK41LX0W2BM1BPfn6y2Qft1xdwVvsWo4Knhy7OA/8filRESB9E3fLG81
   j+BtJoPEAEci+qNsQv33DIgYwSPHkOkanRGOXnXVsqzdHh25kA3zUicdk
   cVD6/TTZ3+kifw0WGU/Vulcd4aMvnNVP4hDnN0F2arRJxLLMZdglSvH4W
   K2JwXKmFJMpmoVq9Y38SfW2wlwlhstf341mY8irCfSVEd5vqXfK3JjeLU
   n3BkL9wlzoLthlpd01nP7GysSxPFpqZVA5W6zgOECLacyGPz+/d2wzjsT
   Ut1wC0tRxQgDwJN7gg+BpSypv/lFxljM6/1NmHZRO4bkc/Gzcue22mJEJ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="287396817"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="287396817"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 21:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="745313740"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2022 21:20:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJSLd-000I15-2p;
	Thu, 04 Aug 2022 04:20:37 +0000
Date: Thu, 04 Aug 2022 12:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 c0ffb866e17172239d8015ed78615ad04581c8cc
Message-ID: <62eb4907.Li7d2EMqwkNBcJHw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_212041_447437_4E013B4B 
X-CRM114-Status: UNSURE (   7.19  )
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
branch HEAD: c0ffb866e17172239d8015ed78615ad04581c8cc  wifi: ath12k: wmi: replace enum with __le32 in struct wmi_vdev_start_resp_event

elapsed time: 707m

configs tested: 77
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                                defconfig
mips                             allyesconfig
i386                             allyesconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                        randconfig-a013
i386                          randconfig-a014
x86_64                        randconfig-a011
i386                          randconfig-a012
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a004
arc                  randconfig-r043-20220803
arm                                 defconfig
x86_64                        randconfig-a002
s390                 randconfig-r044-20220803
x86_64                        randconfig-a006
riscv                randconfig-r042-20220803
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
xtensa                         virt_defconfig
arm                        multi_v7_defconfig
sh                          rsk7264_defconfig
loongarch                         allnoconfig
arm                            qcom_defconfig
arc                  randconfig-r043-20220804
um                                  defconfig
sh                          r7785rp_defconfig
sh                                  defconfig
mips                 decstation_r4k_defconfig
sh                        sh7757lcr_defconfig
loongarch                           defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220803
hexagon              randconfig-r045-20220803
x86_64                        randconfig-a003
x86_64                        randconfig-a005
mips                           rs90_defconfig
powerpc                      obs600_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
