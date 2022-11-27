Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42735C4321E
	for <ath10k@archiver.kernel.org>; Sun, 27 Nov 2022 01:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xkVqN9p4A2Xv0yo8jvJQZrij+g4PN4yLb4FFXzkDC00=; b=qE8Lm6qiRvkKEF
	/z6JS/6hLbSqZazM554iKBpG3heqHehHcVjaejA18TpKTYEkzG0nZ+l4Klh2g1CzBA6EScxHoV4fM
	nvqHvBfaZkLIR6UwOAv55r73RYbCyjtZIa+k3lLjOmKAtkKsn29D+DUh96VsO/t3o236tQXeqibxI
	BSaGTBmi3IGgck2fALXLVVjHGwUv+kwdVer+dXigDCEB1gJ75wMDyhzimChAwHN4szC4UWE+4dIWS
	R6uBY5GZqEO2skraHlAGUBbfVwiWbKacMfE/0lQ8QSNhtgCXM37za0GEzscbUF7btTk4dfFTDDz0e
	IKaw5/d9JlZa8dLDo2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz6LK-008jOO-71; Sun, 27 Nov 2022 01:20:26 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz6LH-008jNq-1u
	for ath10k@lists.infradead.org; Sun, 27 Nov 2022 01:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669512023; x=1701048023;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=REEGeUkgLg/Nec/RvIKMdEAG8UnYyyVRvrixGMvInSY=;
  b=IGBAwieru7YIpUd9dN1aKimFfaXBTjr85TSGUzKO37X4xdC4YPzheXz/
   mzTHRQOKMp02kjyOfVy+Rntxlha0pUkpAnYItazi1O5govTt1qaLRivJQ
   guhTcfyeIymshw1WgrXSer1nQEsvAcGOKbxGVMilDVWLKT0ik6pkRWclP
   +WD2i2KIEB1H8a5NNYFLtnj1xRZ2TEHKoUXXnZ/cdnDBcS0suCp52C9Ny
   /CLI6Y9G+IjhhJNLYDPy+ciQMNubFrBPePHyjysrOkiMI92SiGTdDvyty
   9AXgmDhmnUlUENjbbaacyczBs/uzKbfu0LuKfRLicTFUcjVaz5CPNZLLi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="302208315"
X-IronPort-AV: E=Sophos;i="5.96,197,1665471600"; 
   d="scan'208";a="302208315"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 17:20:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="673851941"
X-IronPort-AV: E=Sophos;i="5.96,197,1665471600"; 
   d="scan'208";a="673851941"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Nov 2022 17:20:17 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oz6LA-0006gz-32;
	Sun, 27 Nov 2022 01:20:16 +0000
Date: Sun, 27 Nov 2022 09:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 7256f28767fa40249254116a4bcb45efff35f31b
Message-ID: <6382bb17.H2kZJFNYGTmR/tjB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_172023_219157_EE068E7A 
X-CRM114-Status: UNSURE (   5.76  )
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
branch HEAD: 7256f28767fa40249254116a4bcb45efff35f31b  wifi: carl9170: Replace zero-length array of trailing structs with flex-array

elapsed time: 2250m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                  randconfig-r043-20221124
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
ia64                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                              defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                           allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                                defconfig
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
