Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F1EC4332F
	for <ath10k@archiver.kernel.org>; Wed, 16 Nov 2022 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zc6ise9hoK1O2twABApHORPH5weemBNWqdj5XwVIm2w=; b=lQ5ToqKW2bH+tg
	ftJGB01Hq2aqqQJzDq3n/28a+wyP5t1S1JGOrTYDq0XiC93DhpFlYcfVKuPMprBz4L29PzBcx6Fwp
	6uJfRe8UE+qaXja7Lht19kR5ar8oW0b/CoMLIZMG5DIwnDvCEhVm9aJtlg+Wewm9mn/ebFReW2xrv
	QVox9DjocxLLcDyaPmPZaV/hIn4PHo8E8/ZGjzxYq6tEoZXmRr1ujHJcrIfZZ5orKPXqkymWa2wAP
	Aj4s8PlYnx4t/04UNfMiWSe2NWsjlmz7dFFrx/gigyiA/PO+rhbHId5jAZTXzl0v289itUM73xtGp
	/0M/xZ9BMjdij7qPOczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDDG-000z93-5C; Wed, 16 Nov 2022 07:52:02 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDDB-000z62-4I
	for ath10k@lists.infradead.org; Wed, 16 Nov 2022 07:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668585117; x=1700121117;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/uKkuOBLvxLwanlTeQRFS2sWm6KEdeh2g9hvXXq/g/Q=;
  b=fGpAvT5PCrZ9r38AneOdhhEmcRDKymORdMMGpfUNdCk0IToRt1Wk+684
   fC2VCwXca5IhRTaMCC25FCzte5jfqDWtPHkld6X1X4srGC8gMU/yL7wPf
   njO/4E0ciGMDQkRFScsGEzJ5GbGr9IxnXBYt/sdNmKUkk2RRI0rvDj31G
   0xfAvXNzKPmbL52o8JnkuYTMtiZd84FxrfRDPn45lm9AUu/VmmRwSLzU2
   aL5K3ijPjyH2lNDfYjDAO4TyvrBdcGLx2nmWnfsFW34t3IX4T5fQPKMWO
   uzA6vC1kQjCbfMpxyMbipykySTPTm0yaxW6j3FdEkHLIW8v6nsXdQwAMl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="313628979"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="313628979"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 23:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="744946582"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="744946582"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2022 23:51:54 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovDD8-00028h-0i;
	Wed, 16 Nov 2022 07:51:54 +0000
Date: Wed, 16 Nov 2022 15:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 ea6338c4715096826eb9e65bb068e7e17030f05a
Message-ID: <6374966e.iMPsnfhDo5rXTGFv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_235157_240147_9C60AE9F 
X-CRM114-Status: UNSURE (   6.34  )
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
branch HEAD: ea6338c4715096826eb9e65bb068e7e17030f05a  wifi: ath12k: wmi: avoid copying invalid vdev key data

elapsed time: 776m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
sh                               allmodconfig
s390                                defconfig
arc                  randconfig-r043-20221115
riscv                randconfig-r042-20221115
s390                 randconfig-r044-20221115
s390                             allyesconfig
i386                          randconfig-a001
x86_64                        randconfig-a002
i386                          randconfig-a003
m68k                             allmodconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
arc                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
alpha                            allyesconfig
x86_64                        randconfig-a006
m68k                             allyesconfig
i386                          randconfig-a005
i386                          randconfig-a014
x86_64                        randconfig-a004
i386                          randconfig-a012
i386                          randconfig-a016
i386                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                                 defconfig
x86_64                           allyesconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221115
x86_64               randconfig-a012-20221114
x86_64               randconfig-a011-20221114
hexagon              randconfig-r045-20221115
x86_64               randconfig-a013-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a015-20221114
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
