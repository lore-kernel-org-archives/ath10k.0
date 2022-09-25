Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6356C32771
	for <ath10k@archiver.kernel.org>; Sun, 25 Sep 2022 02:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y63i824oqeyLEfSN7mAjOI838XzMVKakx0tJezXDUxY=; b=th7WAk4Hj7NhSe
	giEUoXBRaucrmG3BNTcd1KJFM4jspFVpHcIQaxDTx7ND77hKTigYaLIf3loTqp82d8xXJmwxgChFE
	BAhSpAWqa0fxgPd4/vv4H0IPSRcQeyyDYHc5jSJEQfisA4x9PcPSVGK5aDW6F2pWBF7mXzCUrWjsw
	BhwT5pT6wVN0bWfmAHcmT1f0jJY0IZxI19BmwN/4YwMaZGJkdusTv8BRbM8pzczVM+6eglNTVhLDx
	j1wDvCI8lxfYLQuWB0iCgthnjfiUCkLJLk2g3k8dHMMv41sMBh6eLBGIp1Fx3MOZq8oBdswmpwUan
	M44vnr8gAS9f4FS8HFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHLi-00AOke-Pb; Sun, 25 Sep 2022 02:26:30 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHLf-00AOjL-SQ
	for ath10k@lists.infradead.org; Sun, 25 Sep 2022 02:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664072787; x=1695608787;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oK5kdSuMViebrib1jk0ynUVGhHCkzGfUbq8eCxTh/3w=;
  b=SJuBWpPBOpZ6OmhKd/Yofc/n2AHEjTT29TaC+7J52HY7JDj+PNBd4kxx
   dHQm2lU1IrrFkPdWiXYp5GI5f0rjhI8kEK0DlJ7DMnJpivvsuLNQ4GPvL
   ZlfhKCIVTWAb2yZ31BjEvZ0zp5Z1h5nXAgtAEMMIF6APQSUlTy1cGCtm3
   AmH3wxf3nlfYXQCUXaC1LBM51lBQMNWENd1/NO7/PXow7lS5TSxorrT70
   m9mP4i07qQpeQ7eUwrI9W60YMIGr+6yweI60u6UWbtuH2jfuqjelK/z9y
   Mr/3tUL7l8dLl43gLqdEWQmJ2yLGr/qdktBkvZ0WfuV9UrqRemrwE+j7H
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="299547718"
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="299547718"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2022 19:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="724606111"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2022 19:26:23 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocHLa-0007I3-2L;
	Sun, 25 Sep 2022 02:26:22 +0000
Date: Sun, 25 Sep 2022 10:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 e893327ff5c270e97523fae017d8605a3ac683a6
Message-ID: <632fbc42.lf0F2BsN55qgILa3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_192627_964711_962B1E90 
X-CRM114-Status: UNSURE (   6.13  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: e893327ff5c270e97523fae017d8605a3ac683a6  Add localversion-wireless-testing-ath

elapsed time: 728m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
x86_64                              defconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                           allyesconfig
sh                               allmodconfig
x86_64                               rhel-8.3
i386                                defconfig
arc                  randconfig-r043-20220924
m68k                             allmodconfig
i386                          randconfig-a001
arm                                 defconfig
i386                          randconfig-a003
x86_64                          rhel-8.3-func
s390                             allyesconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a002
i386                             allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a006
arm                              allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a014
arm64                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
s390                 randconfig-r044-20220925
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm

clang tested configs:
hexagon              randconfig-r041-20220924
hexagon              randconfig-r045-20220924
riscv                randconfig-r042-20220924
i386                          randconfig-a002
s390                 randconfig-r044-20220924
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220925
hexagon              randconfig-r045-20220925

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
