Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81769C433FE
	for <ath10k@archiver.kernel.org>; Wed, 16 Nov 2022 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lL2rmH89rWgXdJM960QUDFyqfL7M+hPqbPARuhsJe8w=; b=UkkJgzjmN1Xq4D
	EmgbrV3+1wCE7EoXttOeg9qD8ZrahdL2L5BKC0UDWcaySXunrzSbEd9rtE3Q2dN3ORpM6qjPXcVVm
	j0vD/TUtd4eynvnrKYwjnJS5LwbZMHdAnlZmShwS93ckXstecKrd91rqjUFFv+z89zjmePlIc6UkO
	CV+pN13gSmLjdyU8xjTXoDoWwHF11HeXva6oWS8UCWVSaZCpOHvZpRM4YzF53HueubtdLoVM+4AAC
	Y5JiUvZAK/x6c/TlSsfP9Y2LQxyHcWmX/6mQwExDbu11wq8gKjly0fWtUrwAgF9Hs92JwQ7roM8p0
	5y0TIFDji0X1qCscsYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovQXC-008Lt9-En; Wed, 16 Nov 2022 22:05:30 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovQX9-008LZv-Q6
	for ath10k@lists.infradead.org; Wed, 16 Nov 2022 22:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668636327; x=1700172327;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VPqQgKPv7rv2DZf1+VSPDZg+AzfqAGquk/uQtbuqz1o=;
  b=oFQ8QJUusJFKIdIQK8+MjZnB1zcdaHJYb6s+IwYFkneE3FIhVKf3W6aY
   YTO1EdHyQlhNYc9yDFxPU1xVmv3jEQJrDuaqU3A6Wk3iCxAGsvnqCLeln
   evWd05f1+dM7L02iEp1kDUf079YKNfVX4h7k4n+J8EoWTRVCgXg1K+gVX
   zJcs0NjixjnpP+ENcGrzuaEze65+hgX7qU9huw4uOPiXxWFppC8Lqh0SO
   hJfrtV/QxSj5t+5jyMsjNgEn5N/DjL4MhRe75m/U7gSFx1UwJ3ZowBgkT
   mIHjpW3ezdw9z+uCjmqApVIkJeZ4ATlmf0oid8kyF2HAWvHozCFIA62OH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="313830702"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="313830702"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 14:05:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="703048671"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="703048671"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Nov 2022 14:05:20 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovQX2-0002mW-0H;
	Wed, 16 Nov 2022 22:05:20 +0000
Date: Thu, 17 Nov 2022 06:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 96599ce2790b00d1963821ff577df0e1788502b9
Message-ID: <63755e82.NIUiwzTvixEHZ0jv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_140527_946234_ACC96C47 
X-CRM114-Status: UNSURE (   5.14  )
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
branch HEAD: 96599ce2790b00d1963821ff577df0e1788502b9  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
arm                                 defconfig
i386                                defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221116
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
arm                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016

clang tested configs:
riscv                randconfig-r042-20221116
hexagon              randconfig-r041-20221116
hexagon              randconfig-r045-20221116
s390                 randconfig-r044-20221116
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
