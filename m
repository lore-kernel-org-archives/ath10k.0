Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CDFC433FE
	for <ath10k@archiver.kernel.org>; Wed, 30 Nov 2022 03:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gXvLeqkvUUsiVIKLfEf1v1hBgozQGHecmp+ajlu+ni8=; b=V+b9V6vQt4uzCG
	Btwzn1+lv2AZ266Z6rYDCYZA94zET/6SvJKaa228UOX67S9CpDgTW2HT/05PE3QMgV3DRLmoc7DwO
	i7xmcfhqgbNiUc4fsydyjANaht2BvwmhMW7+D9HuK5vFqBB3Xu6rOApBt1XicYJs0HuJl5NtG7nR6
	Luq60bfe83uVYA/lAr7onCY62jFcL+hqxp0J9rqKS7tgdaz5lTF0hIKezVzq0KaNgfjIl3mt0E9EO
	O9KAGtvdmY8HacJ3dyeJJz00mdRqN3DENdRruObuoXPOD3OyMU3mV9q3fpSw6HjubBeKMmBF0oJKk
	Uh0+fMIDMM5XCEmpyINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DcZ-00CUgX-E0; Wed, 30 Nov 2022 03:18:51 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DcW-00CUfW-Lp
	for ath10k@lists.infradead.org; Wed, 30 Nov 2022 03:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669778328; x=1701314328;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AaeirHaQS54XrdkhwWotsm+ZujECBnY8/856SiBF+Mg=;
  b=ZLAfOsW1Q9sU3UkgM8XjYLRYKfn01svXZ099HHDo2O8MXQqZ2iFm/Y9k
   qhlRn6wynkQJEv22fWY5On6XBVIBLxLYtm9xZZ3J6NXRHyzrddUq/lCND
   HuEOqwPYx8B0SoK/ASgaWU52LiO16asoPXrmSGcnDvxQtkD8PStpZwYjG
   n3XXodxmvGt0FFHazfBTv64iV48I4GFmYl8eAv96IjViS+I6tJYlkCf0D
   uWhaK3txj/NHEMUJ5p3F12yNOURiOTyr+5GPPNcIJBL8mbNUszMqv7d2U
   zBuqF9XLKn25zkvdwP0n2D9aAp5oLMgJ0POlMaBBcOdEbErIc3ykg1cim
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="315323856"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="315323856"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 19:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="889120298"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="889120298"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2022 19:18:47 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0DcU-0009Rp-29;
	Wed, 30 Nov 2022 03:18:46 +0000
Date: Wed, 30 Nov 2022 11:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 245927cb443050dd693ff26528d1e76a958cc7c2
Message-ID: <6386cb5c.pRUbKnLY9zjBgG04%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_191848_799527_9DA86EF5 
X-CRM114-Status: UNSURE (   5.00  )
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
branch HEAD: 245927cb443050dd693ff26528d1e76a958cc7c2  Merge branch 'ath-next' into ath-qca

elapsed time: 971m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a002-20221128
i386                                defconfig
um                           x86_64_defconfig
ia64                             allmodconfig
s390                             allyesconfig
m68k                             allmodconfig
i386                 randconfig-a003-20221128
x86_64               randconfig-a002-20221128
x86_64                           allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20221128
x86_64               randconfig-a005-20221128
x86_64                               rhel-8.3
i386                 randconfig-a005-20221128
arc                              allyesconfig
x86_64               randconfig-a001-20221128
i386                 randconfig-a004-20221128
x86_64               randconfig-a006-20221128
mips                             allyesconfig
x86_64               randconfig-a003-20221128
i386                 randconfig-a006-20221128
x86_64               randconfig-a004-20221128
alpha                            allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20221128
sh                               allmodconfig
i386                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a016-20221128
hexagon              randconfig-r045-20221128
i386                 randconfig-a012-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
i386                 randconfig-a014-20221128
s390                 randconfig-r044-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
