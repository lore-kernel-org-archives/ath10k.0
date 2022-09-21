Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABE0C32771
	for <ath10k@archiver.kernel.org>; Wed, 21 Sep 2022 05:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iMKpbcVhRhr76cyH9j0qEV8xBw0FaTHXkp4xMAzk+HM=; b=eDI53W9M11YxWB
	N7pt/6mnOSk2unkaXNcM8iHPSNT5ZSXzxstUWFjfPZwo4wWt8i2mPZoGl2RSmAWzJtLhcjNrm29oJ
	MKrjB42T2En+NdvROwqFsYX8M2yz0eM4exEdNe/Jkq3h3dK2itEFxJMsEAeLOa8kq4KJ/QyQNMjp3
	cC/qvinRQoZGvmZOQ2+PIQ+u43bj+hPRD44hnAA53z+v4nwAtgboJLVKdaew34FNd1YJI4i+qVxIq
	a0p+vRrXQrOFgF60ow61j77Rsc1UyxLLxTC+FWCT8CoFBxlQuDyCHcDEuTBioP9y9TIElW+ghklai
	0kkQa0fCZ6vRx9T6/xFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oasT0-00958W-CL; Wed, 21 Sep 2022 05:40:14 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oasSv-00956n-Jn
	for ath10k@lists.infradead.org; Wed, 21 Sep 2022 05:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663738809; x=1695274809;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/sbB5BFNhANPYoPiWs7Z3HUiUBUXioIeAO5UumA93vk=;
  b=VtgsCJnZj3ACfstaHhy5DY2LrKvVGYsYGaM2NrkySk9ctg9WMLCKxcz0
   4r+/7l+VgRODkYw14u2ficqBLjnOvycihB/356mGXTkGhhkA+Grtp9ZZ8
   4cn9S+XNZS/9exV0YDzAv3fgFWuuSrf9rGnE0ODb2drZFaCxG2dAzqmim
   7z7MYL74+ZFmTlg1BQuFOh7B7x4zT5iHD5sLeC847cdmApJRii4xAdfwk
   tiqRdk6wNnDyaD8J0PXst1Ii3VRosFuWkVVOiihJfXcW+2XaqpJI6W5hV
   /rStAsWSZEF0zautFfLvoiYS5PPjhl4+twqzLmDEUm7EkyzQGqh0OIgq0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="279631394"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="279631394"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 22:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="947993911"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2022 22:40:05 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oasSq-0003HL-35;
	Wed, 21 Sep 2022 05:40:04 +0000
Date: Wed, 21 Sep 2022 13:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 7de602b1e60cf58f598c2881e4f760c772635810
Message-ID: <632aa391.P3EeByYg07TPuE6E%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_224009_710900_E6EACB54 
X-CRM114-Status: UNSURE (   4.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 7de602b1e60cf58f598c2881e4f760c772635810  wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second

elapsed time: 721m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
s390                 randconfig-r044-20220921
s390                                defconfig
s390                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                                defconfig
s390                             allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
arm                                 defconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a004
arm                              allyesconfig
x86_64                          rhel-8.3-func
sh                               allmodconfig
x86_64                        randconfig-a002
m68k                             allyesconfig
arm64                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                               rhel-8.3
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                           allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
i386                          randconfig-a002
x86_64                        randconfig-a016
i386                          randconfig-a004
x86_64                        randconfig-a014
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
